INSERT INTO `users` (`user_id` ,`email` ,`first_name` ,`last_name` ,`password`)
VALUES (1 , 'the.biri@gmail.com', 'FirstName', 'LastName', 'ceb6c970658f31504a901b89dcd3e461'); 
-- password = test@123

INSERT INTO `surveys` (`survey_id` ,`creation_date` ,`survey_name`)
VALUES (1 ,CURRENT_TIMESTAMP , 'Test Survey 1');

INSERT INTO `user_surveys` (`user_id` ,`survey_id` ,`relation_id` ,`performed`)
VALUES ('1', '1', '1', NOW( ));

INSERT INTO `questions` (`question_id` ,`survey_id` ,`qtype_id`,`question_text`)
VALUES ('1', '1', '1','Is this a good test?');

INSERT INTO `questions` (`question_id` ,`survey_id` ,`qtype_id`,`question_text`)
VALUES ('2', '1', '1','Second Question!');

INSERT INTO `question_options`(`option_id` ,`survey_id` ,`question_id`,`option_text`) VALUES(1, 1, 1, 'True');
INSERT INTO `question_options`(`option_id` ,`survey_id` ,`question_id`,`option_text`) VALUES(2, 1, 1, 'False');
INSERT INTO `question_options`(`option_id` ,`survey_id` ,`question_id`,`option_text`) VALUES(1, 1, 2, 'True');
INSERT INTO `question_options`(`option_id` ,`survey_id` ,`question_id`,`option_text`) VALUES(2, 1, 2, 'False');


INSERT INTO `answers` VALUES(1, 1, 1, '1');
INSERT INTO `answers` VALUES(2, 1, 1, '2');