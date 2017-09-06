a = LOAD 'inputfile/para*.txt' AS (line:chararray);
b = FOREACH a GENERATE FLATTEN(TOKENIZE(REPLACE(line, '', '#'), '#')) AS letter;
c = FOREACH b GENERATE LOWER(letter) AS lowercase;
d = GROUP c BY lowercase;
e = FOREACH d GENERATE group, COUNT(c);
STORE e INTO 'outputfile' USING PigStorage();
