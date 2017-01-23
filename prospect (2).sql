-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 23, 2017 at 06:18 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prospect`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `CONTACT_ID` int(11) NOT NULL,
  `CONTACT_NM` varchar(50) NOT NULL,
  `CONTACT_PIC_URL` varchar(500) NOT NULL,
  `CONTACT_CNTRY` varchar(20) NOT NULL,
  `CONTACT_ST` varchar(20) NOT NULL,
  `CONTACT_CITY` varchar(20) NOT NULL,
  `CONTACT_DOB` date NOT NULL,
  `CONTACT_JOB_DESC` varchar(50) NOT NULL,
  `CONTACT_MARITAL_STATUS` varchar(10) NOT NULL,
  `CONTACT_GENDER` varchar(5) NOT NULL,
  `CONTACT_SOURCE_ID` varchar(5) NOT NULL,
  `CONTACT_TYPE_FLG` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`CONTACT_ID`, `CONTACT_NM`, `CONTACT_PIC_URL`, `CONTACT_CNTRY`, `CONTACT_ST`, `CONTACT_CITY`, `CONTACT_DOB`, `CONTACT_JOB_DESC`, `CONTACT_MARITAL_STATUS`, `CONTACT_GENDER`, `CONTACT_SOURCE_ID`, `CONTACT_TYPE_FLG`) VALUES
(1, 'Jeff Car', 'https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/7/005/013/32d/29ffecd.jpg', 'USA', 'Ohio', 'Cleveland', '1981-12-01', 'Sheet Metal Worker', 'Single', 'Male', 'FB', 'P'),
(2, 'Jason Bourne', 'http://digitalspyuk.cdnds.net/16/26/160x160/square-1467271634-jason-bourne-still.jpg', 'USA', 'NEW YORK', 'NEW YORK', '2016-08-15', 'Actor', 'Single', 'Male', 'FB', 'P'),
(3, 'Scarlet Johansson', 'http://img2.timeinc.net/instyle/images/2011/awards/022711-scarlett-johansson-hair-400.jpg', 'USA', 'New York', 'New Yorki', '1984-11-22', 'Financial Planner', 'Single', 'F', 'FB', 'R'),
(4, 'Agent Smith', 'http://p1.pichost.me/160x160/5/1281038.jpg', 'USA', 'New York', 'New York', '2017-01-11', 'Secret Agent', 'Single', 'M', 'FB', 'P'),
(5, 'Jon Snow', 'http://www.blastr.com/sites/blastr/files/styles/square_160x160/public/Jon-Snow-Harington.jpg?itok=yyXx5W2A&timestamp=1462484601', 'Winterfell', 'Winterfell', 'Winterfell', '2017-01-11', 'Fictional Character', 'Single', 'M', 'FB', 'P'),
(6, 'Arya Stark', 'https://pbs.twimg.com/profile_images/713341866620485633/r74dChcE.jpg', 'Winterfell', 'Winterfell', 'Winterfell', '2017-01-11', 'Princess', 'Single', 'F', 'FB', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `contact_interest`
--

CREATE TABLE `contact_interest` (
  `CONTACT_ID` int(10) NOT NULL,
  `CONTACT_INTEREST_DESC` varchar(20) NOT NULL,
  `CONTACT_INTEREST_CATEGORY` varchar(20) NOT NULL,
  `CONTACT_INTEREST_SOURCE_ID` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_interest`
--

INSERT INTO `contact_interest` (`CONTACT_ID`, `CONTACT_INTEREST_DESC`, `CONTACT_INTEREST_CATEGORY`, `CONTACT_INTEREST_SOURCE_ID`) VALUES
(1, 'study', 'Like', 'FB'),
(1, 'forces', 'Like', 'FB'),
(1, 'movement', 'Like', 'FB'),
(1, 'force', 'Like', 'FB'),
(1, 'ad', 'Like', 'FB'),
(1, 'energy', 'Like', 'FB'),
(1, 'laws', 'Like', 'FB'),
(1, 'speed', 'Like', 'FB'),
(1, 'matter', 'Like', 'FB'),
(1, 'world', 'Like', 'FB'),
(1, 'works', 'Like', 'FB'),
(1, 'nature', 'Like', 'FB'),
(1, 'branch', 'Like', 'FB'),
(1, 'concerned', 'Like', 'FB'),
(1, 'source', 'Like', 'FB'),
(1, 'google', 'Like', 'FB'),
(1, 'two', 'Like', 'FB'),
(1, 'grouped', 'Like', 'FB'),
(1, 'modern', 'Like', 'FB'),
(1, 'org', 'Like', 'FB'),
(1, 'answers', 'Like', 'FB'),
(1, 'natural', 'Like', 'FB'),
(1, 'objects', 'Like', 'FB'),
(1, 'treats', 'Like', 'FB'),
(1, 'department', 'Like', 'FB'),
(1, 'heat', 'Like', 'FB'),
(1, 'general', 'Like', 'FB'),
(1, 'words', 'Like', 'FB'),
(1, 'ph', 'Like', 'FB'),
(1, 'html', 'Like', 'FB'),
(1, 'lrl', 'Like', 'FB'),
(1, 'zgzmeylfwuy', 'Like', 'FB'),
(1, 'subject', 'Like', 'FB'),
(1, 'sound', 'Like', 'FB'),
(1, 'structure', 'Like', 'FB'),
(1, 'atoms', 'Like', 'FB'),
(1, 'nuclear', 'Like', 'FB'),
(1, 'plasma', 'Like', 'FB'),
(1, 'deals', 'Like', 'FB'),
(1, 'conducted', 'Like', 'FB'),
(1, 'order', 'Like', 'FB'),
(1, 'understand', 'Like', 'FB'),
(1, 'behaves', 'Like', 'FB'),
(1, 'en', 'Like', 'FB'),
(1, 'wheels', 'Like', 'FB'),
(1, 'torque', 'Like', 'FB'),
(1, 'wheel', 'Like', 'FB'),
(1, 'momentum', 'Like', 'FB'),
(1, 'measure', 'Like', 'FB'),
(1, 'car', 'Like', 'FB'),
(1, 'add', 'Like', 'FB'),
(1, 'traveled', 'Like', 'FB'),
(1, 'power', 'Like', 'FB'),
(1, 'Farming', 'Interest Group', 'LN'),
(1, 'BookMyShow', 'Interest Group', 'LN'),
(1, 'Farming', 'Interest Group', 'LN'),
(1, 'Tysonism', 'Interest Group', 'LN'),
(1, 'SubjectPolitics', 'Interest Group', 'LN'),
(1, 'Flickr', 'Interest Group', 'LN'),
(1, 'BookMyShow', 'Interest Group', 'LN'),
(1, 'Indiatimes', 'Interest Group', 'LN'),
(1, 'Shanghaiist', 'Interest Group', 'LN'),
(1, 'Beebom', 'Interest Group', 'LN'),
(1, 'India Today', 'Interest Group', 'LN'),
(1, 'Virender Sehwag', 'Interest Group', 'LN'),
(1, 'Fossbytes', 'Interest Group', 'LN'),
(1, 'Sarcasmistan', 'Interest Group', 'LN'),
(1, 'Cin?polis', 'Interest Group', 'LN'),
(1, 'AsapSCIENCE', 'Interest Group', 'LN'),
(1, 'Pune 99', 'Interest Group', 'LN'),
(1, 'Citibank', 'Interest Group', 'LN'),
(1, 'Urban Disport', 'Interest Group', 'LN'),
(1, 'Life Sahi Hai', 'Interest Group', 'LN'),
(1, 'Nifty', 'Interest Group', 'LN'),
(1, 'WordsWithMagic', 'Interest Group', 'LN'),
(1, 'Finkick Adventures', 'Interest Group', 'LN'),
(1, 'Imagica', 'Interest Group', 'LN'),
(1, 'Tasty', 'Interest Group', 'LN'),
(1, 'INSIDER', 'Interest Group', 'LN'),
(1, 'Cityshor Pune', 'Interest Group', 'LN'),
(1, 'Amul', 'Interest Group', 'LN'),
(1, 'ScoopWhoop', 'Interest Group', 'LN'),
(1, 'Informatica LLC', 'Interest Group', 'LN'),
(1, 'Cognizant', 'Interest Group', 'LN'),
(1, 'Idealist', 'Interest Group', 'LN'),
(1, 'Brain Pickings', 'Interest Group', 'LN'),
(1, 'Big Think', 'Interest Group', 'LN'),
(1, 'The Idealist', 'Interest Group', 'LN'),
(1, 'FilterCopy', 'Interest Group', 'LN'),
(1, 'Bollywood Tabloid', 'Interest Group', 'LN'),
(1, 'Nagpur Trollers', 'Interest Group', 'LN'),
(1, 'The Sarcastic Retard', 'Interest Group', 'LN'),
(1, 'The Economist', 'Interest Group', 'LN'),
(1, 'The Indian Idiot', 'Interest Group', 'LN'),
(1, 'Futurism', 'Interest Group', 'LN'),
(1, 'MediaTek Labs', 'Interest Group', 'LN'),
(1, 'Bengaluru', 'Interest Group', 'LN');

-- --------------------------------------------------------

--
-- Table structure for table `contact_to_contact_rlntp`
--

CREATE TABLE `contact_to_contact_rlntp` (
  `PROS_CONTACT_ID` int(10) NOT NULL,
  `OFFICER_CONTACT_ID` int(10) NOT NULL,
  `MATCH_SCORE` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_to_contact_rlntp`
--

INSERT INTO `contact_to_contact_rlntp` (`PROS_CONTACT_ID`, `OFFICER_CONTACT_ID`, `MATCH_SCORE`) VALUES
(1, 3, '81.00'),
(1, 2, '78.00'),
(6, 3, '80.00'),
(4, 3, '85.00'),
(5, 2, '75.00'),
(2, 3, '91.00');

-- --------------------------------------------------------

--
-- Table structure for table `contact_trait`
--

CREATE TABLE `contact_trait` (
  `CONTACT_ID` int(5) NOT NULL,
  `CONTACT_TRAIT_TYP_ID` int(5) NOT NULL,
  `CONTACT_TRAIT_VAL` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_trait`
--

INSERT INTO `contact_trait` (`CONTACT_ID`, `CONTACT_TRAIT_TYP_ID`, `CONTACT_TRAIT_VAL`) VALUES
(1, 1, 94),
(1, 2, 81),
(1, 6, 97),
(1, 7, 89),
(1, 3, 92),
(1, 4, 95),
(3, 1, 75),
(3, 2, 65),
(3, 3, 85),
(3, 6, 91);

-- --------------------------------------------------------

--
-- Table structure for table `contact_trait_typ`
--

CREATE TABLE `contact_trait_typ` (
  `CONTACT_TRAIT_TYP_ID` int(5) NOT NULL,
  `CONTACT_TRAIT_TYP_DESC` varchar(20) NOT NULL,
  `CONTACT_TRAIT_TYP_GRP` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_trait_typ`
--

INSERT INTO `contact_trait_typ` (`CONTACT_TRAIT_TYP_ID`, `CONTACT_TRAIT_TYP_DESC`, `CONTACT_TRAIT_TYP_GRP`) VALUES
(1, 'Agreeableness', 'Personality'),
(2, 'Openness', 'Personality'),
(3, 'Introversion', 'Personality'),
(4, 'Emotional Range', 'Personality'),
(6, 'Harmony', 'Consumer Needs'),
(7, 'Tradition', 'Values');

-- --------------------------------------------------------

--
-- Table structure for table `contact_trait_typ2`
--

CREATE TABLE `contact_trait_typ2` (
  `CONTACT_ID` int(10) NOT NULL,
  `CONTACT_TRAIT_TYP_ID` int(11) NOT NULL,
  `CONTACT_TRAIT_TYP_DESC` varchar(50) NOT NULL,
  `CONTACT_TRAIT_TYP_GRP` varchar(50) NOT NULL,
  `CONTACT_TRAIT_TYP_SUBGRP` varchar(50) NOT NULL,
  `CONTACT_TRAIT_TYP_WEIGHT` int(3) NOT NULL,
  `CONTACT_TRAIT_TYP_LOWTERM` varchar(50) NOT NULL,
  `CONTACT_TRAIT_TYP_HIGHTERM` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_trait_typ2`
--

INSERT INTO `contact_trait_typ2` (`CONTACT_ID`, `CONTACT_TRAIT_TYP_ID`, `CONTACT_TRAIT_TYP_DESC`, `CONTACT_TRAIT_TYP_GRP`, `CONTACT_TRAIT_TYP_SUBGRP`, `CONTACT_TRAIT_TYP_WEIGHT`, `CONTACT_TRAIT_TYP_LOWTERM`, `CONTACT_TRAIT_TYP_HIGHTERM`) VALUES
(1, 1, 'Agreeableness', 'Personality', 'Agreeableness', 94, 'Positive', 'Negative'),
(1, 2, 'Altruism', 'Personality', 'Agreeableness', 99, 'Open', 'Close'),
(1, 6, 'Harmony', 'Consumer Needs', 'Harmony', 99, 'ABC', 'XYZ'),
(1, 6, 'Tradition', 'Values', 'Tradition', 99, 'Patient', 'Impatient'),
(1, 3, 'Sympathy', 'Personality', 'Agreeableness', 99, 'A', 'B'),
(1, 3, 'Uncompromising', 'Personality', 'Agreeableness', 90, 'A', 'B'),
(1, 3, 'Trust', 'Personality', 'Agreeableness', 90, 'A', 'B'),
(1, 3, 'Cooperation', 'Personality', 'Agreeableness', 86, 'A', 'B'),
(1, 3, 'Conscientiousness', 'Personality', 'Conscientiousness', 81, 'A', 'B'),
(1, 3, 'Achievement striving', 'Personality', 'Conscientiousness', 84, 'A', 'B'),
(1, 3, 'Dutifulness', 'Personality', 'Conscientiousness', 81, 'A', 'B'),
(1, 3, 'Harmony', 'Consumer Needs', 'Harmony', 81, 'A', 'B'),
(1, 3, 'Curiosity', 'Consumer Needs', 'Curiosity', 81, 'A', 'B'),
(1, 3, 'Stability', 'Consumer Needs', 'Stability', 91, 'A', 'B'),
(1, 3, 'Self-expression', 'Consumer Needs', 'Self-expression', 95, 'A', 'B'),
(1, 3, 'Closeness', 'Consumer Needs', 'Closeness', 88, 'A', 'B'),
(1, 3, 'Tradition', 'Values', 'Tradition', 88, 'A', 'B'),
(1, 3, 'Stimulation', 'Values', 'Stimulation', 91, 'A', 'B'),
(1, 3, 'Helping others', 'Values', 'Helping others', 95, 'A', 'B'),
(1, 3, 'Conscientiousness', 'Personality', 'Conscientiousness', 95, 'A', 'B');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`CONTACT_ID`),
  ADD UNIQUE KEY `CONTACT_ID` (`CONTACT_ID`);

--
-- Indexes for table `contact_interest`
--
ALTER TABLE `contact_interest`
  ADD KEY `fk_1` (`CONTACT_ID`);

--
-- Indexes for table `contact_trait`
--
ALTER TABLE `contact_trait`
  ADD KEY `CONTACT_ID` (`CONTACT_ID`),
  ADD KEY `fk_2` (`CONTACT_TRAIT_TYP_ID`);

--
-- Indexes for table `contact_trait_typ`
--
ALTER TABLE `contact_trait_typ`
  ADD PRIMARY KEY (`CONTACT_TRAIT_TYP_ID`),
  ADD UNIQUE KEY `CONTACT_TRAIT_TYP_ID` (`CONTACT_TRAIT_TYP_ID`),
  ADD KEY `CONTACT_TRAIT_TYP_ID_2` (`CONTACT_TRAIT_TYP_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact_interest`
--
ALTER TABLE `contact_interest`
  ADD CONSTRAINT `fk_1` FOREIGN KEY (`CONTACT_ID`) REFERENCES `contact` (`CONTACT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact_trait`
--
ALTER TABLE `contact_trait`
  ADD CONSTRAINT `fk_2` FOREIGN KEY (`CONTACT_TRAIT_TYP_ID`) REFERENCES `contact_trait_typ` (`CONTACT_TRAIT_TYP_ID`),
  ADD CONSTRAINT `fk_id` FOREIGN KEY (`CONTACT_ID`) REFERENCES `contact` (`CONTACT_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
