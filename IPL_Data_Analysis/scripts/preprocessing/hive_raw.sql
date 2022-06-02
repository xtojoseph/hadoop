use metastore;

DROP TABLE IF EXISTS MATCHES_RAW;
DROP TABLE IF EXISTS IPL_TEAMS;
DROP TABLE IF EXISTS IPL_STADIUMS;
DROP TABLE IF EXISTS MATCHES;
DROP TABLE IF EXISTS DELIVERIES_RAW;
DROP TABLE IF EXISTS DELIVERIES;

CREATE EXTERNAL TABLE IF NOT EXISTS MATCHES_RAW (
id INT,
city STRING,
matchdate STRING,
player_of_match STRING,
venue STRING,
neutral_venue BOOLEAN,
team1 STRING,
team2 STRING,
toss_winner STRING,
toss_decision STRING,
winner STRING,
result STRING,
result_margin INT,
eliminator CHAR(1),
method CHAR(2),
umpire1  STRING,
umpire2 STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with SERDEPROPERTIES 
(
   "separatorChar" = ','
)
LOCATION 'hdfs://localhost:9000/project/MATCHES_RAW'
TBLPROPERTIES('skip.header.line.count'='1');


CREATE TABLE IF NOT EXISTS IPL_TEAMS (
name string,
altNames array<string>,
active boolean)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
COLLECTION ITEMS TERMINATED BY '|'
TBLPROPERTIES('skip.header.line.count'='1');

load data local inpath '/media/sf_SharedFolder/IPL Teams.csv' into table IPL_TEAMS;


CREATE TABLE IF NOT EXISTS IPL_STADIUMS (
name string,
loc string,
altNames array<string>)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
COLLECTION ITEMS TERMINATED BY '|'
TBLPROPERTIES('skip.header.line.count'='1');

load data local inpath '/media/sf_SharedFolder/IPL Stadiums.txt' into table IPL_STADIUMS;


CREATE TABLE IF NOT EXISTS MATCHES (
id INT,
city STRING,
matchdate STRING,
player_of_match STRING,
venue STRING,
neutral_venue STRING,
team1 STRING,
team2 STRING,
toss_winner STRING,
toss_decision STRING,
winner STRING,
result STRING,
result_margin INT,
eliminator CHAR(1),
method CHAR(2),
umpire1  STRING,
umpire2 STRING)
TBLPROPERTIES('skip.header.line.count'='1');



CREATE EXTERNAL TABLE IF NOT EXISTS DELIVERIES_RAW (
id INT,
inning INT,
`over` INT,
ball INT,
batsman STRING,
non_striker STRING,
bowler STRING,
batsman_runs INT,
extra_runs INT,
total_runs INT,
non_boundary INT,
is_wicket INT,
dismissal_kind STRING,
player_dismissed STRING,
fielder STRING,
extras_type STRING,
batting_team STRING,
bowling_team STRING)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
with SERDEPROPERTIES 
(
   "separatorChar" = ','
)
LOCATION 'hdfs://localhost:9000/project/DELIVERIES_RAW'
TBLPROPERTIES('skip.header.line.count'='1');


CREATE TABLE IF NOT EXISTS DELIVERIES (id INT,
inning INT,
`over` INT,
ball INT,
batsman STRING,
non_striker STRING,
bowler STRING,
batsman_runs INT,
extra_runs INT,
total_runs INT,
non_boundary INT,
is_wicket INT,
dismissal_kind STRING,
player_dismissed STRING,
fielder STRING,
extras_type STRING,
batting_team STRING,
bowling_team STRING)
TBLPROPERTIES('skip.header.line.count'='1');
