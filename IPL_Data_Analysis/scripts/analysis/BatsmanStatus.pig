ball = LOAD 'metastore.deliveries' using org.apache.hive.hcatalog.pig.HCatLoader() as (id:int,inning:int, over:int, ball:int,batsman:chararray,non_striker:chararray,bowler:chararray,batsman_runs:int,extra_runs:int,total_runs:int,non_boundary:int,is_wicket:int,dismissal_kind:chararray,player_dismissed:chararray,fielder:chararray,extras_type:chararray,batting_team:chararray,bowling_team:chararray);

run_calculation = FOREACH ball GENERATE id,batsman,batsman_runs,ball, (batsman_runs==4?1:0) AS four_runs,(batsman_runs==6?1:0) AS six_runs;

run_groupby_season = GROUP run_calculation BY batsman ;
run_season   = FOREACH run_groupby_season { 
						  uniq_matches = DISTINCT run_calculation.id ;
                                            GENERATE FLATTEN(group) AS batsman,COUNT(uniq_matches)AS innings,SUM(run_calculation.batsman_runs)AS run,ROUND_TO(((double)SUM(run_calculation.batsman_runs) / COUNT(run_calculation.ball) )*100,2) AS strike_rate, ROUND_TO(((double)SUM(run_calculation.batsman_runs) / COUNT(uniq_matches) ),2) AS avrg_run, SUM(run_calculation.four_runs) AS four_runs,SUM(run_calculation.six_runs) AS six_runs ;
                                          };
										  

run_season50   = FILTER run_season BY innings>50;

TopFoursBatsmen = ORDER run_season50 BY four_runs DESC;
TopFoursBatsmen1 = LIMIT TopFoursBatsmen 10;
TopSixsBatsmen = ORDER run_season50 BY six_runs DESC;
TopSixsBatsmen1 = LIMIT TopSixsBatsmen 10;
TopStrkRteBatsmen = ORDER run_season50 BY strike_rate DESC;
TopStrkRteBatsmen1 = LIMIT TopStrkRteBatsmen 10;
TopAvgRunBatsmen = ORDER run_season50 BY avrg_run DESC;
TopAvgRunBatsmen1 = LIMIT TopAvgRunBatsmen 10;


STORE run_season INTO 'metastore.BatsmanStatus' USING org.apache.hive.hcatalog.pig.HCatStorer();
STORE TopFoursBatsmen1 INTO 'metastore.TopFoursBatsmen' USING org.apache.hive.hcatalog.pig.HCatStorer();
STORE TopSixsBatsmen1 INTO 'metastore.TopSixsBatsmen' USING org.apache.hive.hcatalog.pig.HCatStorer();
STORE TopStrkRteBatsmen1 INTO 'metastore.TopStrkRteBatsmen' USING org.apache.hive.hcatalog.pig.HCatStorer();
STORE TopAvgRunBatsmen1 INTO 'metastore.TopAvgRunBatsmen' USING org.apache.hive.hcatalog.pig.HCatStorer();

