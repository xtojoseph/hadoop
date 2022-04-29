A= load '/media/sf_SharedFolder/500MB.csv' using PigStorage(',') as (lon:chararray,lat:chararray,number:int,street:chararray,unit:chararray,city:chararray,district:chararray,region:chararray, postcode:chararray, id:chararray,hash:chararray);
B = GROUP A BY region;
STORE B INTO '/home/hdoop/PIG/sample/comparison/$outDir' USING PigStorage (',');
