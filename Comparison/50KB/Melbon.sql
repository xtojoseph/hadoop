create table Melbondata50KB (Suburb STRING,Rooms INT,Type STRING,Price STRING,Method STRING,SellerG STRING,Bedroom2 INT,Bathroom INT)
row format delimited
fields terminated by ',';

load data local inpath '/media/sf_SharedFolder/Melbon50KB.csv' into table Melbondata50KB;

select Rooms + Rooms as Sum from Melbondata50KB;

select * from Melbondata50KB where (Suburb!='Reservoir' and  Suburb!= 'Richmond') --95% filter

select * from Melbondata50KB where Suburb like '%Reservoir%' OR Suburb like '%Richmond%';--5% filter

select Suburb,COUNT(Rooms) from Melbondata50KB Group by Suburb; --Group by

select M1.Suburb,M1.Rooms,M1.Price from Melbondata50KB M1 JOIN Melbondata50KB M2 on M1.Rooms = M2.Bedroom2; --JOIN

Select distinct Suburb from Melbondata50KB;





