--In this problem I used Oracle Database 11g Release 2 (11.2.0.1.0)

--1.First I create table called Junkmail with ID as primary key.
CREATE TABLE Junkmail(
	Name CHAR(30) NOT NULL,
    Address CHAR(30) NOT NULL,
    ID SMALLINT NOT NULL,
    SameFam SMALLINT,
    PRIMARY KEY (ID)
);

--2.I add some values
INSERT INTO Junkmail VALUES ('Alice', 'A', 10, NULL);
INSERT INTO Junkmail VALUES ('Bob', 'B', 15, NULL);
INSERT INTO Junkmail VALUES ('Carmen', 'C', 22, NULL);
INSERT INTO Junkmail VALUES ('Diego', 'A', 9, 10);
INSERT INTO Junkmail VALUES ('Ella', 'B', 3, 15);
INSERT INTO Junkmail VALUES ('Farkhad', 'D', 11, NULL);

--3.I use following query to delete from table
DELETE FROM Junkmail
WHERE SameFam IS NULL AND ID IN (SELECT A.ID 
                                 FROM Junkmail A, Junkmail B
                                 WHERE A.ID = B.SameFam);