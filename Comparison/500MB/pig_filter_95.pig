a= load '/media/sf_SharedFolder/500MB.csv' using PigStorage(',') as (lon:chararray,lat:chararray,number:int,street:chararray,unit:chararray,city:chararray,district:chararray,region:chararray, postcode:chararray, id:chararray,hash:chararray);

c = FILTER a by city!='Hempstead';

STORE c INTO '/home/hdoop/PIG/sample/comparison/$outDir' USING PigStorage (',');
