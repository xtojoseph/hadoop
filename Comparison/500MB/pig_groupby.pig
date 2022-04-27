a= load '/media/sf_SharedFolder/500MB.csv' using PigStorage(',') as (lon:chararray,lat:chararray,number:int,street:chararray,unit:chararray,city:chararray,district:chararray,region:chararray, postcode:chararray, id:chararray,hash:chararray);

b = group a all;

c =FOREACH b GENERATE COUNT(a);

STORE c INTO '/home/hdoop/PIG/sample/comparison/$outDir' USING PigStorage (',');
