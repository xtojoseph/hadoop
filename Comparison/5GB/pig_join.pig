A = LOAD '/media/sf_SharedFolder/CIS_Automotive_Kaggle_Sample.csv' USING PigStorage(',') AS (vin: chararray, stockNum: chararray, firstSeen: chararray, lastSeen: chararray, msrp: long, askPrice: long, mileage: long, isNew: boolean, color: chararray, interiorColor: chararray);
B = LOAD '/media/sf_SharedFolder/CIS_Automotive_Kaggle_Sample.csv' USING PigStorage(',') AS (vin: chararray, stockNum: chararray, firstSeen: chararray, lastSeen: chararray, msrp: long, askPrice: long, mileage: long, isNew: boolean, color: chararray, interiorColor: chararray);
C = JOIN A by vin, B by vin;
D = FOREACH C GENERATE $0;
STORE D into '/home/hdoop/PIG/sample/comparison/$outDir';
