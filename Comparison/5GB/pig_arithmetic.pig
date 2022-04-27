A = LOAD '/media/sf_SharedFolder/CIS_Automotive_Kaggle_Sample.csv' USING PigStorage(',') AS (vin: chararray, stockNum: chararray, firstSeen: chararray, lastSeen: chararray, msrp: long, askPrice: long, mileage: long, isNew: boolean, color: chararray, interiorColor: chararray);
B = FOREACH A GENERATE vin, msrp - askPrice AS Deviation, msrp, askPrice;
STORE B into '/home/hdoop/PIG/sample/comparison/$outDir';
