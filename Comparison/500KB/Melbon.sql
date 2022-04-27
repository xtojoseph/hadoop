create table Melbondata (Suburb STRING,Rooms INT,Type STRING,Price STRING,Method STRING,SellerG STRING,Bedroom2 INT,Bathroom INT)
row format delimited
fields terminated by ',';

load data local inpath '/media/sf_SharedFolder/Melbon500KB.csv' into table Melbondata;

select Rooms + Rooms as Sum from Melbondata;

select * from Melbondata where (Suburb!='Reservoir' and  Suburb!= 'Richmond') --95% filter

select * from Melbondata where Suburb like '%Reservoir%' OR Suburb like '%Richmond%';--5% filter

select Suburb,COUNT(Rooms) from Melbondata Group by Suburb; --Group by

select M1.Suburb,M1.Rooms,M1.Price from Melbondata M1 JOIN Melbondata M2 on M1.Rooms = M2.Bedroom2; --JOIN





