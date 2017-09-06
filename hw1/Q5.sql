--In this problem I used Oracle Database 11g Release 2 (11.2.0.1.0)

--1.First I create table called Menu with (Chef, Dish) as primary key.
CREATE TABLE Menu(
	Chef CHAR(30) NOT NULL,
    Dish CHAR(30) NOT NULL,
    PRIMARY KEY (Chef, Dish)
);

--2.I add some values
INSERT INTO Menu VALUES ('A', 'Mint chocolate brownie');
INSERT INTO Menu VALUES ('B', 'Upside down pineapple cake');
INSERT INTO Menu VALUES ('B', 'Creme brulee');
INSERT INTO Menu VALUES ('B', 'Mint chocolate brownie');
INSERT INTO Menu VALUES ('C', 'Upside down pineapple cake');
INSERT INTO Menu VALUES ('C', 'Creme brulee');
INSERT INTO Menu VALUES ('D', 'Apple pie');
INSERT INTO Menu VALUES ('D', 'Upside down pineapple cake');
INSERT INTO Menu VALUES ('D', 'Creme brulee');
INSERT INTO Menu VALUES ('E', 'Apple pie');
INSERT INTO Menu VALUES ('E', 'Upside down pineapple cake');
INSERT INTO Menu VALUES ('E', 'Creme brulee');
INSERT INTO Menu VALUES ('E', 'Bananas Foster');
	   
--3.I create table called Party with (Dish) as Primary key for query.
CREATE TABLE Party(
	Dish CHAR(30) NOT NULL,
    PRIMARY KEY (Dish)
);

--4.I add some values to Party
INSERT INTO Party VALUES ('Apple pie');
INSERT INTO Party VALUES ('Upside down pineapple cake');
INSERT INTO Party VALUES ('Creme brulee');
	   
--5.I used following query to select all those chefs who can make every item in party table.
SELECT Chef
FROM (SELECT COUNT(*) AS Num, Chef
      FROM (SELECT DISTINCT Chef, Dish FROM Menu WHERE Dish IN (SELECT * FROM Party))
      GROUP BY Chef)
WHERE Num >= (SELECT COUNT(Dish) FROM Party);