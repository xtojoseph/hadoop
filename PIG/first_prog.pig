A = load '/home/hdoop/PIG/sample/sample.txt' using PigStorage(',');
A = load '/home/hdoop/PIG/sample/sample.txt' using PigStorage(',') as (cid:chararray, prd:chararray, qty:int);
onlyMob = FILTER A by prd == 'Mobile';
onlyLap = FILTER A by prd == 'laptop';
onlyLap = FILTER A by prd == 'Laptop';
groupLap = group onlyLap by prd;
totalLaps = foreach groupLap generate group as Product, SUM(onlyLap.qty) AS totalQty;
STORE totalLaps into '/home/hdoop/PIG/sample/totalLaps';
import '/home/hdoop/PIG/sample/grpSum.macro';
result = grpSum(onlyLap, prd, qty);
result = grpSum(onlyMob, prd, qty);
result = grpSum(onlyLap, cid, qty);
result = grpSum(A, cid, qty);
STORE result into '/home/hdoop/PIG/sample/macroGrp';
A = load '/home/hdoop/PIG/sample/bakery.txt' using PigStorage('|') as (pid:chararray, items:bag{item: tuple(description: chararray)});
read = foreach A generate pid;
read = foreach A generate items.description;
quit
