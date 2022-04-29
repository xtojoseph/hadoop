create table Melbondata_5MB (Suburb STRING,Rooms INT,Type STRING,Price STRING,Method STRING,SellerG STRING,Bedroom2 INT,Bathroom INT)
row format delimited
fields terminated by ',';

load data local inpath '/media/sf_SharedFolder/Melbon500KB.csv' into table Melbondata_5MB;

select Rooms + Rooms as Sum from Melbondata_5MB;

select * from Melbondata_5MB where (Suburb!='Reservoir' and  Suburb!= 'Richmond') --95% filter

select * from Melbondata_5MB where Suburb like '%Reservoir%' OR Suburb like '%Richmond%';--5% filter

select Suburb,COUNT(Rooms) from Melbondata_5MB Group by Suburb; --Group by

select M1.Suburb,M1.Rooms,M1.Price from Melbondata_5MB M1 JOIN Melbondata_5MB M2 on M1.Rooms = M2.Rooms; --JOIN


select distinct Suburb from from Melbondata_5MB;


