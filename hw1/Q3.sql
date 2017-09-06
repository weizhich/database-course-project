--In this problem I used Oracle Database 11g Release 2 (11.2.0.1.0)

--1.First I create table called WorkList with (ProjectID, Step) as primary key.
CREATE TABLE WorkList(
	ProjectID CHAR(30) NOT NULL,
    Step SMALLINT NOT NULL,
    Status CHAR(1) NOT NULL,
    PRIMARY KEY (ProjectID, Step)
);

--2.I add some values
INSERT INTO WorkList VALUES ('P100', 0, 'C');
INSERT INTO WorkList VALUES ('P100', 1, 'W');
INSERT INTO WorkList VALUES ('P100', 2, 'W');
INSERT INTO WorkList VALUES ('P201', 0, 'C');
INSERT INTO WorkList VALUES ('P201', 1, 'C');
INSERT INTO WorkList VALUES ('P333', 0, 'W');
INSERT INTO WorkList VALUES ('P333', 1, 'W');
INSERT INTO WorkList VALUES ('P333', 2, 'W');
INSERT INTO WorkList VALUES ('P333', 3, 'W');
	   
--3.I use following query to creat the answer
SELECT DISTINCT ProjectID
FROM WorkList
WHERE Step = 0 AND Status = 'C' AND ProjectID NOT IN (SELECT ProjectID
                                                      From WorkList
                                                      Where Step <> 0 AND Status = 'C');