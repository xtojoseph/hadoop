RiPrIn = load '/media/sf_SharedFolder/50MB.csv' using PigStorage(',') as (
DATAID:int,
ISO1:int,
EVENTIDCNTY:chararray,
EVENTIDNO_CNTY:int,
EVENT_DATE:chararray,
YEAR_i:int,
TIME_PRECIS:int,
EVENT_TYPEI:chararray,
SUBEVENT_TYP:chararray,
ACTOR1:chararray,
ASSOCACTOR1:chararray,
INTER1:int,
ACTOR2:chararray,
ASSOCACTOR2:chararray,
INTER2:int,
INTERACTION:int,
REGN:chararray,
CNTRY:chararray,
ADMIN1:chararray,
ADMIN2:chararray,
ADMIN3:chararray,
LOCATN:chararray,
LATI:double,
LONGI:double,
GEO_PRECSN:int,
SRC:chararray,
SOURCE_SCALE:chararray,
NOTS:chararray,
FATALITIES:int,
tmpstmp:int,
iso3:chararray);

RiPrIn1 = FILTER RiPrIn by LOCATN == 'Jammu' or LOCATN == 'Srinagar';
RiPrIn2 = FILTER RiPrIn by LOCATN == 'Jammu' or LOCATN == 'Srinagar';
RiPrIn3 = JOIN RiPrIn1 BY EVENTIDCNTY, RiPrIn2 BY EVENTIDCNTY;
STORE RiPrIn3 into '/home/hdoop/PIG/sample/comparison/$outDir';
