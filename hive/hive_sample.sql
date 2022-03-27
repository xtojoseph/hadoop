use countrydb;

--Q.iv
select * from wdi ORDER BY country_code DESC LIMIT 10; -- 1 Job, 1 map and 1 reduce

--Q.v
select * from wdi SORT BY country_code DESC LIMIT 10; -- 2 Job, 2 map-redcue

--Q.vi
select * from wdi WHERE country_code IN ('IND', 'USA', 'ZWE') DISTRIBUTE BY country_code LIMIT 10; -- 1 Job, 1 map-reduce

select * from wdi where country_code IN ('IND','USA','ZWE') and indicator_name IN ('Trade (% of GDP)', 'Foreign direct investment, net inflows (% of GDP)') and `2010` IS NOT NULL 
DISTRIBUTE BY country_code; -- 1 Job, 1 map-reduce

--Q.vii
select * from wdi where country_code IN ('IND','USA','ZWE') and indicator_name IN ('Trade (% of GDP)', 'Foreign direct investment, net inflows (% of GDP)') and `2010` IS NOT NULL 
CLUSTER BY country_code; -- 1 Job, 1 map-reduce

--Q.3: Same as SQL
select * from student s
join student_details d ON d.id = s.id;

select * from student s
left join student_details d ON d.id = s.id
WHERE d.id IS NULL;

select * from student s
right join student_details d ON d.id = s.id
WHERE s.id IS NULL;


--Q.6,7
drop table if exists file_content;
create table file_content (text string);
load data local inpath '/home/hdoop/codebase/hadoop/PIG/InvertedIndex/doc1.txt' into table file_content;
set word = 'you';
select ${hiveconf:word};
select split(text, ' ') from file_content;
select explode(split(text, ' ')) from file_content;

select words.word, COUNT(*) FROM  (
	select explode(split(text, ' ')) as word from file_content
) as words 
GROUP BY words.word;

select words.word, COUNT(*) FROM  (
	select explode(split(text, ' ')) as word from file_content
) as words 
WHERE words.word = ${hiveconf:word}
GROUP BY words.word;

