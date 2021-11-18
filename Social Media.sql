-- Social Media Database Construction

CREATE database IF NOT EXISTS socialmedia;

use socialmedia;

DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id int(12) NOT NULL auto_increment,
	user_firstname varchar(40) NOT NULL,
	user_lastname varchar(40) NOT NULL,
	user_email varchar(80) NOT NULL,
	user_password varchar(30) NOT NULL,
	PRIMARY KEY (user_id)
);

CREATE TABLE posts (
	post_id int(20) NOT NULL auto_increment,
	user_id int(12) NOT NULL,
	post_content varchar(255),
	post_time datetime NOT NULL DEFAULT current_timestamp,
	PRIMARY KEY (post_id),
	FOREIGN KEY user_id REFERENCES users(user_id)
);

CREATE TABLE comments (
	comment_id int(50) NOT NULL auto_increment,
	user_id int(12) NOT NULL,
	post_id int(20) NOT NULL,
	comment_content varchar(255),
	comment_time datetime NOT NULL DEFAULT current_timestamp,
	PRIMARY KEY (comment_id),
	FOREIGN KEY user_id REFERENCES users(user_id),
	FOREIGN KEY post_id refermeces posts(post_id)
);

