--In this problem I used Oracle Database 11g Release 2 (11.2.0.1.0)

--1.Firstly, I created table with constraint chk_arrDate to solve the first problem.
CREATE TABLE HotelStays(
	roomNum INTEGER NOT NULL,
	arrDate DATE NOT NULL,
	depDate DATE NOT NULL,
	guestName CHAR(30) NOT NULL,
	PRIMARY KEY (roomNum, arrDate),
	CONSTRAINT chk_arrDate CHECK (arrDate <= depDate)
);

--2.For the second problem, I created a following function.
--This function checks whether there is an overlapping time period with the current guests who have booked that room.
CREATE OR REPLACE FUNCTION checkPeriod(
	room IN INTEGER,
	arr IN DATE,
	dep IN DATE
)
RETURN NUMBER
AS
	num NUMBER;
BEGIN
	SELECT COUNT(*) INTO num
	FROM HotelStays
	WHERE roomNum = room AND NOT(dep <= arrDate OR arr >= depDate);
	
	IF num > 0 THEN
		RETURN 0;
	ELSE
		RETURN 1;
	END IF;
END;
/

--3.Finally I created a trigger to check for the second problem.
--If there is a value that does not meet the condition, the trigger will raise a exception and stop inserting that value.
CREATE TRIGGER tri_guest_available BEFORE INSERT ON HotelStays
FOR EACH ROW
BEGIN
	IF checkPeriod(:NEW.roomNum, :NEW.arrDate, :NEW.depDate) = 0 THEN
		RAISE_APPLICATION_ERROR(-20001, 'It is not a available time period.'); 
	END IF;
END;
/
