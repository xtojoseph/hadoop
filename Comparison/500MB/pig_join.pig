a= load '/media/sf_SharedFolder/500MB.csv' using PigStorage(',') as (lon:chararray,lat:chararray,number:int,street:chararray,unit:chararray,city:chararray,district:chararray,region:chararray, postcode:chararray, id:chararray,hash:chararray);
b= load '/media/sf_SharedFolder/500MB.csv' using PigStorage(',') as (lon:chararray,lat:chararray,number:int,street:chararray,unit:chararray,city:chararray,district:chararray,region:chararray, postcode:chararray, id:chararray,hash:chararray);
c = JOIN a by id, b by id;
d = FOREACH c GENERATE id;
STORE c into '/home/hdoop/PIG/sample/comparison/$outDir';
