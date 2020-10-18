-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2020 at 06:48 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pythonblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `mes` text NOT NULL,
  `date` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone_num`, `mes`, `date`) VALUES
(1, 'anmol', 'first@gmil.com', '11111', 'dkqwgnrgqegk', '0000-00-00 00:00:00.000000'),
(2, 'harsmi', 'anmolbuttar143205@gmail.com', '88888', 'ecqvwvqvgq', '2020-08-22 19:26:32.258769'),
(3, 'komal', 'komal@gmail.com', '1122354', 'hello', '2020-08-22 19:27:44.632455'),
(5, 'again', 'again@gmail.com', '1223', '', '2020-08-23 05:19:56.279062'),
(6, 'anmol singh', 'anmol@!gmail.com', '98778654553', 'klnbjfuy', '2020-08-23 09:03:40.885884'),
(7, 'anmol singh', 'anmol@!gmail.com', '98778654553', 'klnbjfuy', '2020-08-23 09:38:37.197831'),
(9, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'hello friend', '2020-08-24 07:43:37.943300'),
(10, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'hello friend', '2020-08-24 07:45:03.129919'),
(11, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'hello friend', '2020-08-24 07:45:18.436710'),
(12, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'hello friend', '2020-08-24 07:45:25.353818'),
(13, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'hello friend', '2020-08-24 07:48:36.286771'),
(14, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'hello friend', '2020-08-24 07:51:12.417407'),
(15, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'hello friend', '2020-08-24 08:01:22.797484'),
(17, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'khkhoj', '2020-08-24 08:06:52.696512'),
(18, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'khkhoj', '2020-08-24 08:09:21.156153'),
(19, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'khkhoj', '2020-08-24 08:09:27.545199'),
(20, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'khkhoj', '2020-08-24 08:11:12.029125'),
(21, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'khkhoj', '2020-08-24 08:11:41.653301'),
(22, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'khkhoj', '2020-08-24 08:12:56.098493'),
(23, 'anmol', 'anmolbuttar143205@gmail.com', '8777865678', 'khkhoj', '2020-08-24 08:14:38.802516');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(40) NOT NULL,
  `date` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `tagline` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `img_file`, `date`, `tagline`) VALUES
(1, 'my first python book', '....', 'Eric Matthes is a high school science and math teacher living in Alaska,\r\nwhere he teaches an introductory Python course. He has been writing\r\nprograms since he was five years old. Eric currently focuses on writing software\r\nthat addresses inefficiencies in education and brings the benefits of\r\nopen source software to the field of education. In his spare time he enjoys\r\nclimbing mountains and spending time with his family.', '/static/clean_blog/img/post-bg.jpg', '2020-09-04 18:45:08.496345', 'book'),
(2, 'why Python?', 'hmm..', 'Every year I consider whether to continue using Python or whether to move\r\non to a different language—perhaps one that’s newer to the programming\r\nworld. But I continue to focus on Python for many reasons. Python is an\r\nincredibly efficient language: your programs will do more in fewer lines of\r\ncode than many other languages would require. Python’s syntax will also\r\nhelp you write “clean” code. Your code will be easy to read, easy to debug,\r\nand easy to extend and build upon compared to other languages.\r\nPeople use Python for many purposes: to make games, build web applications,\r\nsolve business problems, and develop internal tools at all kinds of\r\ninteresting companies. Python is also used heavily in scientific fields for\r\nacademic research and applied work.', '/static/clean_blog/img/post-bg.jpg', '2020-09-04 18:46:59.527401', '?'),
(3, 'my first python book', '....', 'Eric Matthes is a high school science and math teacher living in Alaska,\r\nwhere he teaches an introductory Python course. He has been writing\r\nprograms since he was five years old. Eric currently focuses on writing software\r\nthat addresses inefficiencies in education and brings the benefits of\r\nopen source software to the field of education. In his spare time he enjoys\r\nclimbing mountains and spending time with his family.', '/static/clean_blog/img/post-bg.jpg', '2020-09-04 18:49:14.584470', 'book'),
(4, 'what is api', 'api', 'A web API is a part of a website designed to interact with programs that\r\nuse very specific URLs to request certain information. This kind of request\r\nis called an API call. The requested data will be returned in an easily processed\r\nformat, such as JSON or CSV. Most apps that rely on external data\r\nsources, such as apps that integrate with social media sites, rely on API calls.', '/static/clean_blog/img/post-bg.jpg', '2020-09-04 18:56:59.131557', 'API'),
(5, 'what is api', 'Api', 'A web API is a part of a website designed to interact with programs that\r\nuse very specific URLs to request certain information. This kind of request\r\nis called an API call. The requested data will be returned in an easily processed\r\nformat, such as JSON or CSV. Most apps that rely on external data\r\nsources, such as apps that integrate with social media sites, rely on API calls.', '/static/clean_blog/img/post-bg.jpg', '2020-09-04 19:08:45.827223', ' api'),
(6, 'Django', 'framework', 'Django is a web framework—a set of tools designed to help you build\r\ninteractive websites. Django can respond to page requests and make it\r\n398 Chapter 18\r\neasier to read and write to a database, manage users, and much more. In\r\nChapters 19 and 20 we’ll refine the Learning Log project and then deploy it\r\nto a live server so you (and your friends) can use it.', '/static/clean_blog/img/home-bg.jpg', '2020-09-04 19:03:39.870533', 'jango'),
(7, 'csv module?', 'module', 'Python’s csv module in the standard library parses the lines in a CSV file\r\nand allows us to quickly extract the values we’re interested in. Let’s start by\r\nexamining the first line of the file, which contains a series of headers for\r\nthe data:', '/static/clean_blog/img/about-bg.jpg', '2020-09-04 19:04:51.690153', 'py module'),
(8, 'File handling python', 'handling', 'Learning to work with files and save data will make your programs\r\neasier for people to use. Users will be able to choose what data to enter and\r\nwhen to enter it. People can run your program, do some work, and then\r\nclose the program and pick up where they left off later. Learning to handle\r\nexceptions will help you deal with situations in which files don’t exist and\r\ndeal with other problems that can cause your programs to crash. This will\r\nmake your programs more robust when they encounter bad data, whether\r\n190 Chapter 10\r\nit comes from innocent mistakes or from malicious attempts to break your\r\nprograms. With the skills you’ll learn in this chapter, you’ll make your programs\r\nmore applicable, usable, and stable.', '/static/clean_blog/img/about-bg.jpg', '2020-09-04 19:06:11.942215', 'file');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
