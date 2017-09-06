--In this problem I used Oracle Database 11g Release 2 (11.2.0.1.0)

--1.First I create table called Enrollment with (SID, ClassName) as primary key.
CREATE TABLE Enrollment(
	SID INTEGER NOT NULL,
    ClassName CHAR(30) NOT NULL,
    Grade CHAR(1) NOT NULL,
    PRIMARY KEY (SID, ClassName)
);

--2.I add some values
INSERT INTO Enrollment VALUES (123, 'ART123', 'A');
INSERT INTO Enrollment VALUES (123, 'BUS456', 'B');
INSERT INTO Enrollment VALUES (666, 'REL100', 'D');
INSERT INTO Enrollment VALUES (666, 'ECO966', 'A');
INSERT INTO Enrollment VALUES (666, 'BUS456', 'B');
INSERT INTO Enrollment VALUES (345, 'BUS456', 'A');
INSERT INTO Enrollment VALUES (345, 'ECO966', 'F');

--3.I use following query to creat the listing that includes course name and the number of students enrolled in the course
SELECT ClassName, COUNT(DISTINCT SID) AS Total
FROM Enrollment
GROUP BY ClassName
ORDER BY Total;