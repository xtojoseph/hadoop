REGISTER '/home/hdoop/codebase/hadoop/PIG/NumbersUDF/target/pig-0.0.1-SNAPSHOT.jar';
DEFINE NumToString com.niit.pig.NumToString();
A = LOAD '/home/hdoop/codebase/hadoop/PIG/NumbersUDF/sample.txt' AS (text : chararray);
B = FOREACH A GENERATE TOKENIZE(text) AS WORDS;
number = FOREACH B {
	conv = FOREACH WORDS GENERATE (token MATCHES '.*\\d+.*' ? NumToString(token) : token);
	GENERATE conv;
};
bag_string = foreach number Generate BagToString(conv, ' ');
STORE bag_string INTO '/home/hdoop/PIG/sample/NumToWords';

quit;