match= LOAD 'metastore.matches' using org.apache.hive.hcatalog.pig.HCatLoader() as (id:chararray,city:chararray, date:chararray, player_of_match:chararray,venue:int,neutral_venue:chararray,team1:chararray,team2:chararray,toss_winner:chararray,toss_decision:chararray,winner:chararray,result:chararray,result_margin:int,eliminator:chararray,method:chararray,umpire1:chararray,umpire2:chararray);
ball = LOAD 'metastore.deliveries' using org.apache.hive.hcatalog.pig.HCatLoader() as (id:chararray,inning:chararray, over:int, ball:int,batsman:chararray,non_striker:chararray,bowler:chararray,batsman_runs:int,extra_runs:int,total_runs:int,non_boundary:int,is_wicket:int,dismissal_kind:chararray,player_dismissed:chararray,fielder:chararray,extras_type:chararray,batting_team:chararray,bowling_team:chararray);
join_table = JOIN match BY id, ball BY id;
FILTER_table = FILTER join_table  BY ball::over<=6 and ball::is_wicket == 1 and ball::inning == '2';
SubstringYear= FOREACH FILTER_table GENERATE *,(match::date,match::id),SUBSTRING(match::date,6,10) AS Year_IPL;
Group_table = GROUP SubstringYear BY (match::id,Year_IPL,ball::inning);
Count_Total_Dismissal = FOREACH Group_table GENERATE group as Year,COUNT(SubstringYear.is_wicket) as CountOfWickets;
Flat = FOREACH Count_Total_Dismissal GENERATE Flatten(Year);Flat = FOREACH Count_Total_Dismissal GENERATE Flatten(Year),CountOfWickets;
GroupFlat = Group Flat BY Year::Year_IPL;
Avg_Total_Dismissal = FOREACH GroupFlat GENERATE group as season,AVG(Flat.CountOfWickets) as avgofinning1wickets;
STORE Avg_Total_Dismissal INTO 'metastore.AvgInning2DismissalAverage' USING org.apache.hive.hcatalog.pig.HCatStorer();