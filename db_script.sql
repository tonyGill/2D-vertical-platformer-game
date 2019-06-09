DROP DATABASE IF EXISTS sandsOfEgypt;
CREATE DATABASE sandsOfEgypt;

CREATE TABLE user (
    userID VARCHAR(6) NOT NULL,
    nameuser VARCHAR(20) NOT NULL,
    score INT NOT NULL,
    PRIMARY KEY (userID)
)

CREATE TABLE clientSession (
    sessionID VARCHAR(6) NOT NULL,
    userID VARCHAR(6) NOT NULL,
    nameuser VARCHAR(20),
    PRIMARY KEY (sessionID),
    FOREIGN KEY (userID)
        REFERENCES user (userID)
)