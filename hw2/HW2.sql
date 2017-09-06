--In this problem I used Oracle Database 11g Release 2 (11.2.0.1.0)

--1.Create a table for the locations in the map.
CREATE TABLE locations(
id INTEGER PRIMARY KEY,
name VARCHAR2(15),
point SDO_GEOMETRY);

--2.Insert 9 points into the table.
INSERT INTO locations VALUES(1, 'My Apartment', SDO_GEOMETRY(2001, NULL, SDO_POINT_TYPE(-118.2730139, 34.02805, NULL), NULL, NULL));
INSERT INTO locations VALUES(2, 'Jeff/Verm', SDO_GEOMETRY(2001, NULL, SDO_POINT_TYPE(-118.2913528,34.01846944, NULL), NULL, NULL));
INSERT INTO locations VALUES(3, 'Figu/Expo', SDO_GEOMETRY(2001, NULL, SDO_POINT_TYPE(-118.2824333,34.01842778, NULL), NULL, NULL));
INSERT INTO locations VALUES(4, 'Jeff/Figu', SDO_GEOMETRY(2001, NULL, SDO_POINT_TYPE(-118.2802444,34.02179444, NULL), NULL, NULL));
INSERT INTO locations VALUES(5, 'Verm/Jeff', SDO_GEOMETRY(2001, NULL, SDO_POINT_TYPE(-118.2913667,34.02535833, NULL), NULL, NULL));
INSERT INTO locations VALUES(6, 'SGM', SDO_GEOMETRY(2001, NULL, SDO_POINT_TYPE(-118.2892056,34.02111944, NULL), NULL, NULL));
INSERT INTO locations VALUES(7, 'KAL', SDO_GEOMETRY(2001, NULL, SDO_POINT_TYPE(-118.2908722222,34.022075, NULL), NULL, NULL));
INSERT INTO locations VALUES(8, 'Leavy', SDO_GEOMETRY(2001, NULL, SDO_POINT_TYPE(-118.2830361111,34.02164444444, NULL), NULL, NULL));
INSERT INTO locations VALUES(9, 'Dining Hall', SDO_GEOMETRY(2001, NULL, SDO_POINT_TYPE(-118.2862416667,34.02023333333, NULL), NULL, NULL));

--3.Compute the convex hull.
SELECT SDO_AGGR_CONVEXHULL(SDOAGGRTYPE(point, 0.005))
FROM locations;

--4.Below is the result.
SDO_AGGR_CONVEXHULL(SDOAGGRTYPE(POINT,0.005))(SDO_GTYPE, SDO_SRID, SDO_POINT(X,
--------------------------------------------------------------------------------
SDO_GEOMETRY(2003, NULL, NULL, SDO_ELEM_INFO_ARRAY(1, 1003, 1), SDO_ORDINATE_ARR
AY(-118.28243, 34.0184278, -118.27301, 34.02805, -118.29137, 34.0253583, -118.29
135, 34.0184694, -118.28243, 34.0184278))

--5.Use the result above to generate the kml file.

--6.Using the same data inserted before, select 3 nearest points from my apartment.
SELECT * FROM(
	SELECT B.name AS name, SDO_GEOM.SDO_DISTANCE(A.point, B.point, 0.005) AS distance
	FROM locations A, locations B
	WHERE A.id = 1 AND B.id <> A.id
	ORDER BY distance)
WHERE ROWNUM <= 3;

--7.Below is the result.
NAME              DISTANCE
--------------- ----------
Jeff/Figu       .009560971
Leavy           .011894362
Figu/Expo       .013465222

--8.Use the result above to generate the kml file.