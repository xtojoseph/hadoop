***Lab 8 -HIVE***

1.	For the file countries.tsv create

a.	Managed table
b.	External table
1.	Describe both the tables.
2.	Load data from local filesystem into the two tables
3.	Drop the two table to see the difference between managed an external tables of HIVE
4.	Re-create the tables. Load data from HDFS into the two tables. Drop them and see the difference. 
2.	Consider the wdi.tsv data set. The description of the columns is as follows:

a.	Create the necessary managed table and load the data from local file system
b.	Write HiveQL queries to 
i.	Select all the data
ii.	Select all data for the indicator : Foreign direct investment, net inflows (% of GDP)
iii.	Restrict data to only 2010 and display only those countries where the data is not null
iv.	Order your data in order of decreasing indicator readings. What is the effect on larger data sets?
v.	Use sort by order to order your data. What do you observe
vi.	Modify your reducer such that each reducer gets data of only a single indicator. For this filter your data for two indicators: Trade (% of GDP) and Foreign direct investment, net inflows (% of GDP) and only for the year 2010.
vii.	Demonstrate cluster_by operation.

3.	Create tables for countries.tsv and oecd.tsv. Perform the following joins:

a.	All countries that are both NATO and OECD countries
b.	All countries that are NATO and not OECD countries
c.	All countries that are OECD and not NATO countries

4.	Create a table for the indicator data set. The data is going to be partitioned by the country code. Load the data into the respective partitions. What effect do you see in the warehouse directory?
5.	Create an employee table that has emp id, name, a list of email addresses and one address that has city and state. 

a.	Insert data into this table.
b.	Count the number of email addresses per emp. Make use of a temporary table.
6.	What are the hiveconf and hivevar namespaces? Create variables in both and access them. 
7.	Write a hive script to count the occurrence of words in file. 

**Helper**

To run hive script, save file as `.sql` and use below:
`hive -f /sample.sql`

CREATE TABLE wdi ( country_name STRING, country_code STRING, indicator_name STRING, indicator_code STRING, `1960` FLOAT, `1961` FLOAT, `1962` FLOAT, `1963` FLOAT, `1964` FLOAT, `1965` FLOAT, `1966` FLOAT, `1967` FLOAT, `1968` FLOAT, `1969` FLOAT, `1970` FLOAT, `1971` FLOAT, `1972` FLOAT, `1973` FLOAT, `1974` FLOAT, `1975` FLOAT, `1976` FLOAT, `1977` FLOAT, `1978` FLOAT, `1979` FLOAT, `1980` FLOAT, `1981` FLOAT, `1982` FLOAT, `1983` FLOAT, `1984` FLOAT, `1985` FLOAT, `1986` FLOAT, `1987` FLOAT, `1988` FLOAT, `1989` FLOAT, `1990` FLOAT, `1991` FLOAT, `1992` FLOAT, `1993` FLOAT, `1994` FLOAT, `1995` FLOAT, `1996` FLOAT, `1997` FLOAT, `1998` FLOAT, `1999` FLOAT, `2000` FLOAT, `2001` FLOAT, `2002` FLOAT, `2003` FLOAT, `2004` FLOAT, `2005` FLOAT, `2006` FLOAT, `2007` FLOAT, `2008` FLOAT, `2009` FLOAT, `2010` FLOAT, `2011` FLOAT, `2012` FLOAT ) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';

CREATE TABLE wdi_code ( country_name STRING, indicator_name STRING, indicator_code STRING, `1960` FLOAT, `1961` FLOAT, `1962` FLOAT, `1963` FLOAT, `1964` FLOAT, `1965` FLOAT, `1966` FLOAT, `1967` FLOAT, `1968` FLOAT, `1969` FLOAT, `1970` FLOAT, `1971` FLOAT, `1972` FLOAT, `1973` FLOAT, `1974` FLOAT, `1975` FLOAT, `1976` FLOAT, `1977` FLOAT, `1978` FLOAT, `1979` FLOAT, `1980` FLOAT, `1981` FLOAT, `1982` FLOAT, `1983` FLOAT, `1984` FLOAT, `1985` FLOAT, `1986` FLOAT, `1987` FLOAT, `1988` FLOAT, `1989` FLOAT, `1990` FLOAT, `1991` FLOAT, `1992` FLOAT, `1993` FLOAT, `1994` FLOAT, `1995` FLOAT, `1996` FLOAT, `1997` FLOAT, `1998` FLOAT, `1999` FLOAT, `2000` FLOAT, `2001` FLOAT, `2002` FLOAT, `2003` FLOAT, `2004` FLOAT, `2005` FLOAT, `2006` FLOAT, `2007` FLOAT, `2008` FLOAT, `2009` FLOAT, `2010` FLOAT, `2011` FLOAT, `2012` FLOAT ) PARTITIONED BY (country_code STRING) ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';


select country_name, indicator_name, indicator_code, `1960`, `1961`, `1962`, `1963`, `1964`, `1965`, `1966` , `1967`, `1968`, `1969` , `1970`, `1971`, `1972`, `1973`, `1974`, `1975`, `1976`, `1977`, `1978`, `1979`, `1980`, `1981`, `1982`, `1983`, `1984`, `1985`, `1986`, `1987`, `1988`, `1989`, `1990`, `1991`, `1992` , `1993`, `1994`, `1995` , `1996`, `1997`, `1998`, `1999`, `2000` , `2001` , `2002`, `2003`, `2004`, `2005`, `2006` , `2007` , `2008` , `2009`, `2010`, `2011`, `2012`, country_code from wdi;

CREATE TABLE wdi_bucket ( country_name STRING, country_code STRING, indicator_name STRING, indicator_code STRING, `1960` FLOAT, `1961` FLOAT, `1962` FLOAT, `1963` FLOAT, `1964` FLOAT, `1965` FLOAT, `1966` FLOAT, `1967` FLOAT, `1968` FLOAT, `1969` FLOAT, `1970` FLOAT, `1971` FLOAT, `1972` FLOAT, `1973` FLOAT, `1974` FLOAT, `1975` FLOAT, `1976` FLOAT, `1977` FLOAT, `1978` FLOAT, `1979` FLOAT, `1980` FLOAT, `1981` FLOAT, `1982` FLOAT, `1983` FLOAT, `1984` FLOAT, `1985` FLOAT, `1986` FLOAT, `1987` FLOAT, `1988` FLOAT, `1989` FLOAT, `1990` FLOAT, `1991` FLOAT, `1992` FLOAT, `1993` FLOAT, `1994` FLOAT, `1995` FLOAT, `1996` FLOAT, `1997` FLOAT, `1998` FLOAT, `1999` FLOAT, `2000` FLOAT, `2001` FLOAT, `2002` FLOAT, `2003` FLOAT, `2004` FLOAT, `2005` FLOAT, `2006` FLOAT, `2007` FLOAT, `2008` FLOAT, `2009` FLOAT, `2010` FLOAT, `2011` FLOAT, `2012` FLOAT ) 
CLUSTERED BY (country_code) INTO 5 BUCKETS 
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
