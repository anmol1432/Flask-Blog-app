from flask import Flask, render_template, request, session, redirect, flash
from flask_sqlalchemy import SQLAlchemy, Pagination
from datetime import datetime
from flask_mail import Mail
from werkzeug.utils import secure_filename
import pymysql
import json
import random
import os
import math


with open('config.json', 'r') as config_file:
    params = json.load(config_file)['params']#load file parmas value in params variable

local_server = 'True'
app = Flask(__name__)
app.secret_key = params['secret_key_for_session']
app.config["upload_folder"] = params['upload_location']
app.config.update(
    Mail_SERVER='smpt.gmail.com',
    Mail_PORT='465',
    Mail_USE_SSL=True,
    Mail_USERNAME=params['gmail_user'],
    Mail_password=params['gmail_password']
)
mail = Mail(app)

if (local_server):
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)

#data base clasess start
class Contacts(db.Model):
    """
    sno, name, phone_num, msg, date, email

    unique = false means  example if one subham send the  message
    and another subham name person cant do that  bcoz database dont allow if unique key is equal to true
    """
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    mes = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12),nullable=True)
    email = db.Column(db.String(20), nullable=False)


class Posts(db.Model):
    """
    sno, title, slug, content, date

    unique = false means  example if one subham send the  message
    and another subham name person cant do that  bcoz database dont allow if unique key is equal to true
    """
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), unique=True, nullable=False)
    slug = db.Column(db.String(21), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    img_file = db.Column(db.String(30), nullable=False)
    date = db.Column(db.String(12), nullable=True)
    tagline = db.Column(db.String(50), nullable=True)
#data base classes end


@app.route("/")
def home():
    page = request.args.get('page', 1)
    posts = Posts.query.paginate(per_page=params['no_of_posts'], page=int(len(Posts.query.all()) / params['no_of_posts']))

    return render_template('index.html', params=params, posts=posts)


@app.route("/about")
def about():
    return render_template('about.html', params=params['about_txt'])


@app.route("/login", methods=['GET', 'POST'])
def login():
    if 'user' in session and session['user'] == params['admin_user']:
        post = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=post)

    if request.method == 'POST':
        usernanme = request.form.get("uname")
        password = request.form.get("pass")
        if usernanme == params['admin_user'] and password == params['admin_password']:
            session['user'] = usernanme
            post = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=post)

    return render_template('login.html', params=params)


@app.route("/edit/<string:sno>", methods=['GET', 'POST'])
def edit(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST': #get data from template
            box_title = request.form.get('title')
            tagline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img = request.form.get('img')
            date = datetime.utcnow()
            if sno == '0': #add new post
                post = Posts(title=box_title, tagline=tagline, slug=slug, content=content, img_file=img, date=date)
                db.session.add(post)
                db.session.commit()
            else: #for edit post
                post = Posts.query.filter_by(sno=sno).first()
                post.tagline = box_title
                post.slug = slug
                post.content = content
                post.img_file = img
                post.date = datetime.utcnow()
                db.session.commit()
                return redirect('/login')
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, sno=sno, post=post)


@app.route("/uploader", methods=['POST','GET'])
def uploader():
    if 'user' in session and session['user'] == params['admin_user']:
        if request.method == 'POST':
            f = request.files['image']
            f.save(os.path.join(app.config['upload_folder']) + secure_filename(f.filename))
            msg = flash('UPLOAD_SUCESSFULL', 'info')
            return redirect('/login')


@app.route("/logout")
def logout():
    session.pop('user')
    return redirect('/login')

@app.route("/delete/<string:sno>")
def delete(sno):
    if 'user' in session and session['user'] == params['admin_user']:
        print(sno)
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
        return redirect('/login')


@app.route("/contact", methods=['GET', 'POST'])#url_mapping
def contact():
    if (request.method == 'POST'): #the post request from client
        '''add entry to database'''
        name = request.form.get('name') #now our server get the data from client request
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        # for adding template data into database
        entry = Contacts(name=name, phone_num=phone, email=email, mes=message, date=datetime.utcnow())
        db.session.add(entry)
        db.session.commit()
       # mail.send_message('New message from blog'+name,
        #                  sender=email,
         #                 recipients=[params['gmail_user']],
          #                body = message+'\n'+phone )
    return render_template('contact.html')  #on_specific_url_render_specific_page


@app.route("/post/<string:post_slug>", methods = ['GET','POST'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()
    return render_template('post.html', params=params, post=post)


@app.route('/post')
def post():
    rand = random.randrange(1, Posts.query.with_entities(Posts.sno).count()) #this is added by me
    post = Posts.query.filter_by(sno=rand).first()
    return render_template('post.html', post=post)


app.run(debug=True)
if "__name__" == "__main__":
    pass