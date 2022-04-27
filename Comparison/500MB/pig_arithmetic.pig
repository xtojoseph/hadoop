a= load '/media/sf_SharedFolder/500MB.csv' using PigStorage(',') as (lon:chararray,lat:chararray,number:int,street:chararray,unit:chararray,city:chararray,district:chararray,region:chararray, postcode:chararray, id:chararray,hash:chararray);

c =FOREACH a GENERATE *,number+5 AS num3:int;
STORE c INTO '/home/hdoop/PIG/sample/comparison/$outDir' USING PigStorage (',');

