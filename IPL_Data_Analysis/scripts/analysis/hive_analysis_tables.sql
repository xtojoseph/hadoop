use metastore;

DROP TABLE IF EXISTS CITY_ANALYSIS;
DROP TABLE IF EXISTS VENUE_ANALYSIS;
DROP TABLE IF EXISTS Avg_Table_Runs_inning1;
DROP TABLE IF EXISTS Avg_Table_Runs_inning2;
DROP TABLE IF EXISTS AvgInning1DismissalAverage;
DROP TABLE IF EXISTS AvgInning2DismissalAverage;
DROP TABLE IF EXISTS SumRunsInning1;
DROP TABLE IF EXISTS SumRunsInning2;
DROP TABLE IF EXISTS MaxDismissal;
DROP TABLE IF EXISTS Totaltimes;
DROP TABLE IF EXISTS BatsmanStatus;
DROP TABLE IF EXISTS TopFoursBatsmen;
DROP TABLE IF EXISTS TopSixsBatsmen;
DROP TABLE IF EXISTS TopStrkRteBatsmen;
DROP TABLE IF EXISTS TopAvgRunBatsmen;
DROP TABLE IF EXISTS Team200Innings1;
DROP TABLE IF EXISTS Team200Innings2;
DROP TABLE IF EXISTS ChasingWinnerNames;
DROP TABLE IF EXISTS Groupchasingcount;
DROP TABLE IF EXISTS Grouptotalcount;


CREATE TABLE CITY_ANALYSIS (
city STRING,
cityCount BIGINT);


CREATE TABLE VENUE_ANALYSIS (
city STRING,
venue STRING,
cnt BIGINT);


CREATE TABLE Avg_Table_Runs_inning1 (
season STRING,
avg_runs DOUBLE);

CREATE TABLE Avg_Table_Runs_inning2 (
season STRING,
avg_runs DOUBLE);

CREATE TABLE AvgInning1DismissalAverage (
season STRING,
AvgOfInning1Wickets DOUBLE);

CREATE TABLE AvgInning2DismissalAverage (
season STRING,
AvgOfInning1Wickets DOUBLE);

CREATE TABLE SumRunsInning1 (
matchId STRING,
sumRuns BIGINT);

CREATE TABLE SumRunsInning2 (
matchId STRING,
sumRuns BIGINT);

CREATE TABLE MaxDismissal (
season STRING,
MaxOfWickets BIGINT);

CREATE TABLE Totaltimes (
batting_team STRING,
cnt BIGINT);

CREATE TABLE BatsmanStatus (
batsman STRING,
innings BIGINT,
run BIGINT,
strike_rate DOUBLE,
avrg_run DOUBLE,
four_runs BIGINT,
six_runs BIGINT);

CREATE TABLE TopFoursBatsmen (
batsman STRING,
innings BIGINT,
run BIGINT,
strike_rate DOUBLE,
avrg_run DOUBLE,
four_runs BIGINT,
six_runs BIGINT);

CREATE TABLE TopSixsBatsmen (
batsman STRING,
innings BIGINT,
run BIGINT,
strike_rate DOUBLE,
avrg_run DOUBLE,
four_runs BIGINT,
six_runs BIGINT);

CREATE TABLE TopStrkRteBatsmen (
batsman STRING,
innings BIGINT,
run BIGINT,
strike_rate DOUBLE,
avrg_run DOUBLE,
four_runs BIGINT,
six_runs BIGINT);

CREATE TABLE TopAvgRunBatsmen (
batsman STRING,
innings BIGINT,
run BIGINT,
strike_rate DOUBLE,
avrg_run DOUBLE,
four_runs BIGINT,
six_runs BIGINT);

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




