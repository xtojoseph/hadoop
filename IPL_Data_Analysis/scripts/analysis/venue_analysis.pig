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

R = GROUP IPL_Match1 by (city, venue,player_of_match);
R1 = FOREACH R GENERATE group as venue, COUNT(IPL_Match1.venue) as cnt;
R2 = FOREACH R1 GENERATE FLATTEN(venue), cnt;
R3 = FOREACH R2 GENERATE venue::city as city,venue::venue as venue, cnt;
STORE R3 INTO 'metastore.VENUE_ANALYSIS' USING org.apache.hive.hcatalog.pig.HCatStorer();