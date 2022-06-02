DROP TABLE IF EXISTS Team200Innings1;
DROP TABLE IF EXISTS Team200Innings2;
DROP TABLE IF EXISTS ChasingWinnerNames;
DROP TABLE IF EXISTS Groupchasingcount;
DROP TABLE IF EXISTS Grouptotalcount;


CREATE TABLE Team200Innings1 (
batting_team STRING,
cnt BIGINT);

CREATE TABLE Team200Innings2 (
batting_team STRING,
cnt BIGINT);


CREATE TABLE ChasingWinnerNames (
winner STRING);

CREATE TABLE Groupchasingcount (
cnt BIGINT);

CREATE TABLE Grouptotalcount (
cnt BIGINT);