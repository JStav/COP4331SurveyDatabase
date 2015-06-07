-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 07, 2015 at 04:14 PM
-- Server version: 5.1.57
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `a9634422_survey`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `answer` varchar(2500) NOT NULL,
  `ans_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`survey_id`,`question_id`),
  KEY `answers_fk1` (`question_id`),
  KEY `answers_fk2` (`survey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answers`
--


-- --------------------------------------------------------

--
-- Table structure for table `lkp_survey_user_rel`
--

CREATE TABLE `lkp_survey_user_rel` (
  `relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `relation_name` varchar(100) NOT NULL,
  PRIMARY KEY (`relation_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `lkp_survey_user_rel`
--

INSERT INTO `lkp_survey_user_rel` VALUES(1, 'maker');
INSERT INTO `lkp_survey_user_rel` VALUES(2, 'taker');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `qtype_id` int(11) NOT NULL,
  `question_text` varchar(100) NOT NULL,
  PRIMARY KEY (`question_id`,`survey_id`),
  KEY `questions_fk1` (`qtype_id`),
  KEY `questions_fk2` (`survey_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--


-- --------------------------------------------------------

--
-- Table structure for table `question_options`
--

CREATE TABLE `question_options` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `option_text` varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (`survey_id`,`question_id`,`option_id`),
  KEY `question_options_fk1` (`question_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `question_options`
--


-- --------------------------------------------------------

--
-- Table structure for table `question_type`
--

CREATE TABLE `question_type` (
  `qtype_id` int(11) NOT NULL AUTO_INCREMENT,
  `qtype_name` varchar(100) NOT NULL,
  PRIMARY KEY (`qtype_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `question_type`
--

INSERT INTO `question_type` VALUES(1, 'True/False');
INSERT INTO `question_type` VALUES(2, 'Multiple Choice (4)');
INSERT INTO `question_type` VALUES(3, 'Fill In The Blank');

-- --------------------------------------------------------

--
-- Table structure for table `surveys`
--

CREATE TABLE `surveys` (
  `survey_id` int(11) NOT NULL AUTO_INCREMENT,
  `creation_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `survey_name` varchar(100) NOT NULL,
  PRIMARY KEY (`survey_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `surveys`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` VALUES(1, 'the.biri@gmail.com', 'FirstName', 'LastName', 'ceb6c970658f31504a901b89dcd3e461');
INSERT INTO `users` VALUES(3, 'RDIBACCO@knights.ucf.edu', 'Richard', 'DiBacco', '827ccb0eea8a706c4c34a16891f84e7b');
INSERT INTO `users` VALUES(4, 'alex@gmail.yo', 'alex', 'dibacco', '7694f4a66316e53c8cdd9d9954bd611d');
INSERT INTO `users` VALUES(5, 'the.biri2@gmail.com', 'test2', 'test3', 'ceb6c970658f31504a901b89dcd3e461');

-- --------------------------------------------------------

--
-- Table structure for table `user_surveys`
--

CREATE TABLE `user_surveys` (
  `user_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `relation_id` int(11) NOT NULL,
  `performed` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`,`survey_id`,`relation_id`),
  KEY `user_surveys_fk1` (`relation_id`),
  KEY `user_surveys_fk2` (`survey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_surveys`
--

