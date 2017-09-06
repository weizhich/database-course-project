a = LOAD 'inputfile/para*.txt' AS (line:chararray);
b = FOREACH a GENERATE FLATTEN(TOKENIZE(REPLACE(line, '', '#'), '#')) AS letter;
c = FOREACH b GENERATE LOWER(letter) AS lowercase;
d = FILTER c BY (lowercase == 'a' OR lowercase == 'e' OR lowercase == 'i' OR lowercase == 'o' OR lowercase == 'u');
e = GROUP d BY lowercase;
f = FOREACH e GENERATE group, COUNT(d);
STORE f INTO 'outputfile' USING PigStorage();