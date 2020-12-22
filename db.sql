# STRUCTURE
USE lamd;


DROP TABLE IF EXISTS pick;
DROP TABLE IF EXISTS locate;
DROP TABLE IF EXISTS upload;
DROP TABLE IF EXISTS respond;

DROP TABLE IF EXISTS spotify;
DROP table IF EXISTS instagram;
DROP TABLE IF EXISTS meet;
DROP TABLE IF EXISTS hashtag;
DROP TABLE IF EXISTS localisation;
DROP TABLE IF EXISTS photo;
DROP TABLE IF EXISTS answer;
DROP TABLE IF EXISTS question;
DROP TABLE IF EXISTS user;


CREATE TABLE IF NOT EXISTS user(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    email VARCHAR (200) UNIQUE,
    password VARCHAR(255),
    birthday DATE,
    description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS spotify(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    token VARCHAR(255),
    userId VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS instagram(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    token VARCHAR(255),
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS meet(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    success_ratio DECIMAL(6 , 2) NOT NULL,
    user_id INT NOT NULL,
    target_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE IF NOT EXISTS hashtag(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    label VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS pick(
    user_id INT NOT NULL,
    hashtag_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (hashtag_id) REFERENCES hashtag(id),
    PRIMARY KEY (user_id, hashtag_id)
);

CREATE TABLE IF NOT EXISTS localisation(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    longitude DECIMAL(7,5) NOT NULL,
    latitude DECIMAL(7,5) NOT NULL
);

CREATE TABLE IF NOT EXISTS locate(
    user_id INT NOT NULL,
    localisation_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (localisation_id) REFERENCES localisation(id)
);

CREATE TABLE IF NOT EXISTS photo(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    uri VARCHAR(255) UNIQUE
);

CREATE TABLE IF NOT EXISTS upload(
    user_id INT NOT NULL,
    photo_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (photo_id) REFERENCES photo(id)
);

CREATE TABLE IF NOT EXISTS answer(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    text VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS question(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    text VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS respond(
    question_id INT NOT NULL,
    answer_id INT NOT NULL,
    FOREIGN KEY (question_id) REFERENCES question(id),
    FOREIGN KEY (answer_id) REFERENCES answer(id)
);

CREATE TABLE IF NOT EXISTS ask(
    user_id INT NOT NULL,
    question_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES user(id),
    FOREIGN KEY (question_id) REFERENCES question(id)
);