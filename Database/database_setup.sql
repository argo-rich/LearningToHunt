-- create the learning_to_hunt DB
CREATE DATABASE IF NOT EXISTS learning_to_hunt;

use learning_to_hunt;

-- authors table for article writers
CREATE TABLE IF NOT EXISTS `authors`(
	`author_id` int NOT NULL AUTO_INCREMENT,
    `name` varchar(35) NOT NULL,
    `company` varchar(45) DEFAULT NULL,
    `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `modify_date` datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`author_id`)
);

-- articles table
CREATE TABLE IF NOT EXISTS `articles`(
	`article_id` int NOT NULL AUTO_INCREMENT,
    `title` varchar(25) NOT NULL,
    `subtitle` varchar(35) DEFAULT NULL,
    `content` text NOT NULL, 
    `author_id` int NOT NULL,
    `create_date` datetime DEFAULT CURRENT_TIMESTAMP,
    `modify_date` datetime DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`article_id`),
    FOREIGN KEY (author_id) REFERENCES authors(author_id) 
);

-- insert dummy data
insert into `authors`(`name`, `company`) values ('Rich Argo', 'Learning to Hunt');
insert into `articles` (`title`, `subtitle`, `content`, `author_id`) 
			    values ('First Title', 'First Subtitle', 'This is the content', 1);