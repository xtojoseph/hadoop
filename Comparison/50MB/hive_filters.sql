create database RiPrIn;

create table if not exists RiPrIn22(
DATAID int,
ISO1 int,
EVENTIDCNTY string,
EVENTIDNO_CNTY int,
EVENT_DATE string,
YEAR_i int,
TIME_PRECIS int,
EVENT_TYPEI string,
SUBEVENT_TYP string,
ACTOR1 string,
ASSOCACTOR1 string,
INTER1 int,
ACTOR2 string,
ASSOCACTOR2 string,
INTER2 int,
INTERACTION int,
REGN string,
CNTRY string,
ADMIN1 string,
ADMIN2 string,
ADMIN3 string,
LOCATN string,
LATI double,
LONGI double,
GEO_PRECSN int,
SRC string,
SOURCE_SCALE string,
NOTS string,
FATALITIES int,
tmpstmp int,
iso3 string)
row format delimited
fields terminated by ',';

load data local inpath '/media/sf_SharedFolder/50MB.csv' into table RiPrIn22;

select EVENTIDCNTY, LOCATN, INTER1 + 1 from RiPrIn22 LIMIT 5; --Arithmetic
select * from RiPrIn22 where LOCATN == 'Jammu' or LOCATN == 'Srinagar'; --5%
select * from RiPrIn22 where LOCATN != 'Jammu' and LOCATN != 'Srinagar'; -- 95%
select LOCATN, sum(INTERACTION) from RiPrIn22 group by LOCATN; -- group by
select DISTINCT LOCATN from RiPrIn22; -- DISTINCT


create table if not exists RiPrIn22_ACTR(
DATAID int,
ISO1 int,
EVENTIDCNTY string,
EVENTIDNO_CNTY int,
EVENT_DATE string,
YEAR_i int,
TIME_PRECIS int,
EVENT_TYPEI string,
SUBEVENT_TYP string,
ACTOR1 string,
ASSOCACTOR1 string,
INTER1 int,
ACTOR2 string,
ASSOCACTOR2 string,
INTER2 int,
INTERACTION int,
REGN string,
CNTRY string,
ADMIN1 string,
ADMIN2 string,
ADMIN3 string,
LOCATN string,
LATI double,
LONGI double,
GEO_PRECSN int,
SRC string,
SOURCE_SCALE string,
NOTS string,
FATALITIES int,
tmpstmp int,
iso3 string)
row format delimited
fields terminated by ',';

load data local inpath '/media/sf_SharedFolder/50MB.csv' into table RiPrIn22_ACTR;

select  * 
from RiPrIn22 Ri join RiPrIn22_ACTR RiA on Ri.EVENTIDCNTY= RiA.EVENTIDCNTY LIMIT 5;  -- JOIN


select Ri.EVENTIDCNTY, Ri.LOCATN, Ri.ACTOR1, Ri.ASSOCACTOR1, Ri.ACTOR2, Ri.ASSOCACTOR2 
from RiPrIn22 Ri where Ri.ACTOR2 IS NOT NULL LIMIT 5;
select Ri.EVENTIDCNTY, Ri.LOCATN, Ri.ACTOR1, Ri.ASSOCACTOR1, Ri.ACTOR2, Ri.ASSOCACTOR2 
from RiPrIn22 Ri where Ri.ACTOR2 IS NULL LIMIT 5; -- SPLIT


