match= LOAD 'metastore.matches' using org.apache.hive.hcatalog.pig.HCatLoader() as (id:chararray,city:chararray, date:chararray, player_of_match:chararray,venue:int,neutral_venue:chararray,team1:chararray,team2:chararray,toss_winner:chararray,toss_decision:chararray,winner:chararray,result:chararray,result_margin:int,eliminator:chararray,method:chararray,umpire1:chararray,umpire2:chararray);
 ball = LOAD 'metastore.deliveries' using org.apache.hive.hcatalog.pig.HCatLoader() as (id:chararray,inning:chararray, over:int, ball:int,batsman:chararray,non_striker:chararray,bowler:chararray,batsman_runs:int,extra_runs:int,total_runs:int,non_boundary:int,is_wicket:int,dismissal_kind:chararray,player_dismissed:chararray,fielder:chararray,extras_type:chararray,batting_team:chararray,bowling_team:chararray);
  join_table = JOIN match BY id, ball BY id;
  Batting_first = FILTER join_table  BY ball::inning=='1' ;
 Batting_second = FILTER join_table  BY ball::inning=='2' ;
  
Group_Table1 = GROUP Batting_first BY (match::id , ball::batting_team , ball::bowling_team, match::winner) ;
Group_Table2 = GROUP Batting_second BY (match::id , ball::batting_team , ball::bowling_team, match::winner) ;

  Score1 = FOREACH Group_Table1  GENERATE group as matchId,SUM(Batting_first .total_runs) as sumRuns;
  Score2 = FOREACH Group_Table2  GENERATE group as matchId,SUM(Batting_second .total_runs) as sumRuns2;

  Filter200 = FILTER Score1  BY (int)sumRuns> 200 ;
 Filter2002nd = FILTER Score2  BY (int)sumRuns2> 200 ;
  Score1st = Foreach Filter200 generate  flatten(matchId),sumRuns;
 Score2nd = Foreach Filter2002nd generate  flatten(matchId),sumRuns2;

Teamwise1 = Group  Score1st BY ( matchId::ball::batting_team);
Teamwise2 = Group  Score2nd BY ( matchId::ball::batting_team);

 
TeamwiseCount1 = Foreach Teamwise1 generate group as batting_team ,COUNT(Score1st.(matchId::match::id)) as cnt;
TeamwiseCount2 = Foreach Teamwise2 generate group as batting_team ,COUNT(Score2nd.(matchId::match::id)) as cnt;



STORE TeamwiseCount1 INTO 'metastore.Team200Innings1' USING org.apache.hive.hcatalog.pig.HCatStorer(); 
STORE TeamwiseCount2 INTO 'metastore.Team200Innings2' USING org.apache.hive.hcatalog.pig.HCatStorer();

