-- phpMyAdmin SQL Dump
-- version 4.5.0-dev
-- http://www.phpmyadmin.net
--
-- Host: 192.168.30.23
-- Generation Time: May 24, 2015 at 06:14 PM
-- Server version: 5.5.40-0+wheezy1
-- PHP Version: 5.6.7-1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `surveydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
  `question_id` int(11) NOT NULL,
  `answer` varchar(2500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `lkp_survey_user_rel`
--

CREATE TABLE IF NOT EXISTS `lkp_survey_user_rel` (
  `relation_id` int(11) NOT NULL,
  `relation_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `qtype_id` int(11) NOT NULL,
  `question_text` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `question_type`
--

CREATE TABLE IF NOT EXISTS `question_type` (
  `qtype_id` int(11) NOT NULL,
  `qtype_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE IF NOT EXISTS `surveys` (
  `survey_id` int(11) NOT NULL,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `survey_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_surveys`
--

CREATE TABLE IF NOT EXISTS `user_surveys` (
  `user_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `relation_id` int(11) NOT NULL,
  `performed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`question_id`);

--
-- Indexes for table `lkp_survey_user_rel`
--
ALTER TABLE `lkp_survey_user_rel`
  ADD PRIMARY KEY (`relation_id`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `questions_fk1` (`qtype_id`),
  ADD KEY `questions_fk2` (`survey_id`);

--
-- Indexes for table `question_type`
--
ALTER TABLE `question_type`
  ADD PRIMARY KEY (`qtype_id`);

--
-- Indexes for table `surveys`
--
ALTER TABLE `surveys`
  ADD PRIMARY KEY (`survey_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `user_surveys`
--
ALTER TABLE `user_surveys`
  ADD PRIMARY KEY (`user_id`,`survey_id`,`relation_id`),
  ADD KEY `user_surveys_fk1` (`relation_id`),
  ADD KEY `user_surveys_fk2` (`survey_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `lkp_survey_user_rel`
--
ALTER TABLE `lkp_survey_user_rel`
  MODIFY `relation_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `question_type`
--
ALTER TABLE `question_type`
  MODIFY `qtype_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `surveys`
--
ALTER TABLE `surveys`
  MODIFY `survey_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `answers_fk1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_fk2` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`survey_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `answers_fk3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_fk2` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`survey_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `questions_fk1` FOREIGN KEY (`qtype_id`) REFERENCES `question_type` (`qtype_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `user_surveys`
--
ALTER TABLE `user_surveys`
  ADD CONSTRAINT `user_surveys_fk3` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_surveys_fk1` FOREIGN KEY (`relation_id`) REFERENCES `lkp_survey_user_rel` (`relation_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `user_surveys_fk2` FOREIGN KEY (`survey_id`) REFERENCES `surveys` (`survey_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

ALTER TABLE `answers` ADD PRIMARY KEY ( `user_id` , `survey_id` , `relation_id` ) ;

-- Preset Values
INSERT INTO `lkp_survey_user_rel` (`relation_id` ,`relation_name`)
VALUES (1 , 'maker');

INSERT INTO `lkp_survey_user_rel`(`relation_id`,`relation_name`)
VALUES (2 , 'taker');

INSERT INTO `question_type` (`qtype_id` ,`qtype_name`)
VALUES (1 , 'True/False');

INSERT INTO `question_type` (`qtype_id` ,`qtype_name`)
VALUES (2 , 'Multiple Choice (4)');

INSERT INTO `question_type` (`qtype_id` ,`qtype_name`)
VALUES (3 , 'Fill In The Blank');


