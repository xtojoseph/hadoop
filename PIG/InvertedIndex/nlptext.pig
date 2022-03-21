REGISTER '/home/hdoop/codebase/hadoop/PIG/InvertedIndex/target/nlp-0.0.1-SNAPSHOT.jar';
DEFINE IsStopWord com.niit.pig.IsStopWord();
A = LOAD '/home/hdoop/codebase/hadoop/PIG/InvertedIndex/doc1.txt' USING PigStorage('\n', '-tagFile') AS (filename: chararray, line:chararray);
A = FOREACH A GENERATE filename, FLATTEN(TOKENIZE(line)) AS word;
B = LOAD '/home/hdoop/codebase/hadoop/PIG/InvertedIndex/doc2.txt' USING PigStorage('\n', '-tagFile') AS (filename: chararray, line:chararray);
B = FOREACH B GENERATE filename, FLATTEN(TOKENIZE(line)) AS word;
allWords = UNION A,B;
allWords = FOREACH allWords GENERATE filename, REPLACE(word,'([^\\w]+)','') AS word;
allWords = FILTER allWords BY word IS NOT NULL AND NOT IsStopWord(word);
wordGroup = GROUP allWords BY word;
wordGroup = ORDER wordGroup BY group; 
result = FOREACH wordGroup GENERATE group AS word, allWords.filename AS item;
index = FOREACH result {
	files = DISTINCT item.filename;
	GENERATE word, files;
};
STORE index INTO '/home/hdoop/PIG/sample/nplOutput';
quit;
