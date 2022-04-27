create table CarDetails(vin string, stockNum string, firstSeen string, lastSeen string, msrp double, askPrice double, mileage double, isNew boolean, color string, interiorColor string)
row format delimited
fields terminated by ',';

load data local inpath '/media/sf_SharedFolder/CIS_Automotive_Kaggle_Sample.csv' into table cardetails;

select vin, msrp - askPrice as deviation, msrp, askPrice from cardetails;

select * from cardetails WHERE color = 'Black';

select * from cardetails WHERE color != 'Black';

select * from cardetails GROUP BY isNew;

select DISTINCT * from cardetails;

select * from cardetails d1
JOIN cardetails d2 ON d2.vin = d1.vin;





