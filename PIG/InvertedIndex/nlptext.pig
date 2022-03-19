REGISTER '/home/hdoop/codebase/hadoop/PIG/InvertedIndex/target/nlp-0.0.1-SNAPSHOT.jar';
DEFINE IsStopWord com.niit.pig.IsStopWord();
A = LOAD '/home/hdoop/codebase/hadoop/PIG/InvertedIndex/sample.txt' AS (string:chararray);
A = FOREACH A GENERATE 'doc1' AS filename, FLATTEN(TOKENIZE(string)) AS word;
B = LOAD '/home/hdoop/codebase/hadoop/PIG/InvertedIndex/sample2.txt' AS (string:chararray);
B = FOREACH B GENERATE 'doc2' AS filename, FLATTEN(TOKENIZE(string)) AS word;
allWords = UNION A,B;
allWords = FOREACH allWords GENERATE filename, REPLACE(word,'([^\\w]+)','') AS word;
allWords = FILTER allWords BY word IS NOT NULL AND NOT IsStopWord(word);
wordGroup = GROUP allWords BY word;
result = FOREACH wordGroup GENERATE group AS word, allWords.filename AS item;
index = FOREACH result {
	files = DISTINCT item.filename;
	GENERATE word, files;
};
STORE index INTO '/home/hdoop/PIG/sample/nplOutput';
quit;
