match= LOAD 'metastore.matches' using org.apache.hive.hcatalog.pig.HCatLoader() as (id:chararray,city:chararray, date:chararray, player_of_match:chararray,venue:int,neutral_venue:chararray,team1:chararray,team2:chararray,toss_winner:chararray,toss_decision:chararray,winner:chararray,result:chararray,result_margin:int,eliminator:chararray,method:chararray,umpire1:chararray,umpire2:chararray);
ball = LOAD 'metastore.deliveries' using org.apache.hive.hcatalog.pig.HCatLoader() as (id:chararray,inning:chararray, over:int, ball:int,batsman:chararray,non_striker:chararray,bowler:chararray,batsman_runs:int,extra_runs:int,total_runs:int,non_boundary:int,is_wicket:int,dismissal_kind:chararray,player_dismissed:chararray,fielder:chararray,extras_type:chararray,batting_team:chararray,bowling_team:chararray);
join_table = JOIN match BY id, ball BY id;
FILTER_table = FILTER join_table  BY ball::over<=6 and ball::inning=='2';
Group_Table = GROUP FILTER_table BY match::id;
Sum_Table_inning2 = FOREACH Group_Table  GENERATE group as matchid,SUM(FILTER_table .total_runs) as sumruns;
STORE Sum_Table_inning2 INTO 'metastore.SumRunsInning2' USING org.apache.hive.hcatalog.pig.HCatStorer();