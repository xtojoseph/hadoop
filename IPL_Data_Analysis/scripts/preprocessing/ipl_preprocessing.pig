match_raw = LOAD 'metastore.matches_raw' using org.apache.hive.hcatalog.pig.HCatLoader() AS (id: INT,
city: charArray,
matchdate: charArray,
player_of_match: charArray,
venue: charArray,
neutral_venue: charArray,
team1: charArray,
team2: charArray,
toss_winner: charArray,
toss_decision: charArray,
winner: charArray,
result: charArray,
result_margin: INT,
eliminator: charArray,
method: charArray,
umpire1:  charArray,
umpire2: charArray);
ipl_teams = LOAD 'metastore.ipl_teams' using org.apache.hive.hcatalog.pig.HCatLoader();
ipl_teams = FOREACH ipl_teams GENERATE name, FLATTEN(altnames.innerfield) as oldName;
ipl_stadiums = LOAD 'metastore.ipl_stadiums' using org.apache.hive.hcatalog.pig.HCatLoader();
ipl_stadiums_flat = FOREACH ipl_stadiums GENERATE name, FLATTEN(altnames.innerfield) as oldName, loc;

deliveries_raw = LOAD 'metastore.deliveries_raw' using org.apache.hive.hcatalog.pig.HCatLoader() AS (
id: INT,
inning: INT,
over: INT,
ball: INT,
batsman: charArray,
non_striker: charArray,
bowler: charArray,
batsman_runs: INT,
extra_runs: INT,
total_runs: INT,
non_boundary: INT,
is_wicket: INT,
dismissal_kind: charArray,
player_dismissed: charArray,
fielder: charArray,
extras_type: charArray,
batting_team: charArray,
bowling_team: charArray);

team1_col_join = JOIN match_raw BY (team1) LEFT OUTER,ipl_teams BY (oldName);
team1_col_replace = FOREACH team1_col_join GENERATE *, (ipl_teams::oldName IS NOT NULL ? ipl_teams::name : match_raw::team1) as correctName;
team2_col_join = JOIN team1_col_replace BY (team2) LEFT OUTER,ipl_teams BY (oldName);
team2_col_replace = FOREACH team2_col_join GENERATE *, (ipl_teams::oldName IS NOT NULL ? ipl_teams::name : match_raw::team2) as correctName;

names_corrected = FOREACH team2_col_replace GENERATE team1_col_replace::match_raw::id as id,
team1_col_replace::match_raw::city as city,
team1_col_replace::match_raw::matchdate as matchdate,
team1_col_replace::match_raw::player_of_match as player_of_match,
team1_col_replace::match_raw::venue as venue,
team1_col_replace::match_raw::neutral_venue as neutral_venue,
team1_col_replace::correctName as team1,
correctName as team2,
team1_col_replace::match_raw::toss_winner as toss_winner,
team1_col_replace::match_raw::toss_decision as toss_decision,
team1_col_replace::match_raw::winner as winner,
team1_col_replace::match_raw::result as result,
team1_col_replace::match_raw::result_margin as result_margin,
team1_col_replace::match_raw::eliminator as eliminator,
team1_col_replace::match_raw::method as method,
team1_col_replace::match_raw::umpire1 as umpire1,
team1_col_replace::match_raw::umpire2 as umpire2;


team1_col_join = JOIN match_raw BY (team1) LEFT OUTER,ipl_teams BY (oldName);
team2_col_join = JOIN team1_col_join BY (team2) LEFT OUTER,ipl_teams BY (oldName);
stadium_col_join = JOIN team2_col_join BY (venue) LEFT OUTER, ipl_stadiums_flat BY (oldName);
city_col_join = JOIN stadium_col_join BY (venue) LEFT OUTER, ipl_stadiums BY (name);

matches_replace = FOREACH city_col_join GENERATE 
stadium_col_join::team2_col_join::team1_col_join::match_raw::id as id,
(
ipl_stadiums::loc IS NOT NULL AND 
	(stadium_col_join::team2_col_join::team1_col_join::match_raw::city == 'NA' 
	OR ipl_stadiums::loc != stadium_col_join::team2_col_join::team1_col_join::match_raw::city) ?
ipl_stadiums::loc : (stadium_col_join::ipl_stadiums_flat::oldName IS NOT NULL ? stadium_col_join::ipl_stadiums_flat::loc : stadium_col_join::team2_col_join::team1_col_join::match_raw::city )
) as city,
stadium_col_join::team2_col_join::team1_col_join::match_raw::matchdate as matchdate,
stadium_col_join::team2_col_join::team1_col_join::match_raw::player_of_match as player_of_match,
(
stadium_col_join::ipl_stadiums_flat::oldName IS NOT NULL ?
stadium_col_join::ipl_stadiums_flat::name : stadium_col_join::team2_col_join::team1_col_join::match_raw::venue
) as venue,
stadium_col_join::team2_col_join::team1_col_join::match_raw::neutral_venue as neutral_venue,
(stadium_col_join::team2_col_join::team1_col_join::ipl_teams::oldName IS NOT NULL ?
stadium_col_join::team2_col_join::team1_col_join::ipl_teams::name : stadium_col_join::team2_col_join::team1_col_join::match_raw::team1 
) as team1,
(
stadium_col_join::team2_col_join::ipl_teams::oldName IS NOT NULL ?
stadium_col_join::team2_col_join::ipl_teams::name : stadium_col_join::team2_col_join::team1_col_join::match_raw::team2
) as team2,
stadium_col_join::team2_col_join::team1_col_join::match_raw::toss_winner as toss_winner,
stadium_col_join::team2_col_join::team1_col_join::match_raw::toss_decision as toss_decision,
stadium_col_join::team2_col_join::team1_col_join::match_raw::winner as winner,
stadium_col_join::team2_col_join::team1_col_join::match_raw::result as result,
stadium_col_join::team2_col_join::team1_col_join::match_raw::result_margin as result_margin,
stadium_col_join::team2_col_join::team1_col_join::match_raw::eliminator as eliminator,
stadium_col_join::team2_col_join::team1_col_join::match_raw::method as method,
stadium_col_join::team2_col_join::team1_col_join::match_raw::umpire1 as umpire1,
stadium_col_join::team2_col_join::team1_col_join::match_raw::umpire2 as umpire2;


filter_abrupt_matches = FILTER matches_replace BY winner != 'NA';
deliveries_join = JOIN deliveries_raw BY (id), filter_abrupt_matches BY (id);
deliveries = FOREACH deliveries_join GENERATE deliveries_raw::id as id,
deliveries_raw::inning as inning,
deliveries_raw::over as over,
deliveries_raw::ball as ball,
deliveries_raw::batsman as batsman,
deliveries_raw::non_striker as non_striker,
deliveries_raw::bowler as bowler,
deliveries_raw::batsman_runs as batsman_runs,
deliveries_raw::extra_runs as extra_runs,
deliveries_raw::total_runs as total_runs,
deliveries_raw::non_boundary as non_boundary,
deliveries_raw::is_wicket as is_wicket,
deliveries_raw::dismissal_kind as dismissal_kind,
deliveries_raw::player_dismissed as player_dismissed,
deliveries_raw::fielder as fielder,
deliveries_raw::extras_type as extras_type,
deliveries_raw::batting_team as batting_team,
deliveries_raw::bowling_team as bowling_team;
STORE deliveries INTO 'metastore.DELIVERIES' USING org.apache.hive.hcatalog.pig.HCatStorer();

STORE filter_abrupt_matches INTO 'metastore.MATCHES' USING org.apache.hive.hcatalog.pig.HCatStorer();