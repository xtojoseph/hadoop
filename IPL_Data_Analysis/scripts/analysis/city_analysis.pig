IPL_Match1 = LOAD 'metastore.matches' using org.apache.hive.hcatalog.pig.HCatLoader() as (
id:int,
city:chararray,
date:chararray,
player_of_match:chararray,
venue:chararray,
neutral_venue:chararray,
team1:chararray,
team2:chararray,
toss_winner:chararray,
toss_decision:chararray,
winner:chararray,
result:chararray,
result_margin:int,
eliminator:chararray,
method:chararray,
umpire1:chararray,
umpire2:chararray);

R = GROUP IPL_Match1 by city;
R1 = FOREACH R GENERATE group as city, COUNT(IPL_Match1.city) as citycount;
STORE R1 INTO 'metastore.CITY_ANALYSIS' USING org.apache.hive.hcatalog.pig.HCatStorer();