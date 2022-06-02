match= LOAD 'metastore.matches' using org.apache.hive.hcatalog.pig.HCatLoader() as (id:chararray,city:chararray, date:chararray, player_of_match:chararray,venue:int,neutral_venue:chararray,team1:chararray,team2:chararray,toss_winner:chararray,toss_decision:chararray,winner:chararray,result:chararray,result_margin:int,eliminator:chararray,method:chararray,umpire1:chararray,umpire2:chararray);
ball = LOAD 'metastore.deliveries' using org.apache.hive.hcatalog.pig.HCatLoader() as (id:chararray,inning:chararray, over:int, ball:int,batsman:chararray,non_striker:chararray,bowler:chararray,batsman_runs:int,extra_runs:int,total_runs:int,non_boundary:int,is_wicket:int,dismissal_kind:chararray,player_dismissed:chararray,fielder:chararray,extras_type:chararray,batting_team:chararray,bowling_team:chararray);
join_table = JOIN match BY id, ball BY id;
FILTER_table3 = FILTER join_table  BY ball::over<=6 and ball::inning=='1';
Substring1 = FOREACH FILTER_table3 GENERATE *,(match::date,match::id), SUBSTRING(match::date,6,10) AS Year_IPL;
Group_table3 = GROUP Substring1 BY (match::id,Year_IPL);
Avg_Table_inning2 = FOREACH Group_table3 GENERATE *,FLATTEN(Substring1),SUM(Substring1.total_runs) as sum_runs;
AvgGroup = GROUP Avg_Table_inning2 BY Year_IPL;
Avg_Table_Runs = FOREACH AvgGroup GENERATE group as season,AVG(Avg_Table_inning2.sum_runs) as avg_runs;
STORE Avg_Table_Runs INTO 'metastore.Avg_Table_Runs_inning1' USING org.apache.hive.hcatalog.pig.HCatStorer();

