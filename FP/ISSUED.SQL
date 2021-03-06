CREATE OR REPLACE PROCEDURE ISSUED IS

	CURSOR ISSUED_CURSOR IS
	SELECT BID,COUNT(BID) AS TOT
	FROM ISSUE1
	WHERE BID IN(SELECT BID FROM BOOK1)
	GROUP BY BID;
	
	F_BID BOOK1.BID%TYPE;
	F_TITLE BOOK1.TITLE%TYPE;
	F_TOT NUMBER(2);
	TOTAL NUMBER(2);
BEGIN
	OPEN ISSUED_CURSOR;
	LOOP
	FETCH ISSUED_CURSOR INTO F_BID,F_TOT;
	EXIT WHEN ISSUED_CURSOR%NOTFOUND;
	DBMS_OUTPUT.PUT_LINE('******************************************************************');
	DBMS_OUTPUT.PUT_LINE('BOOK ID:'||F_BID);
	DBMS_OUTPUT.PUT_LINE('ISSUED TIMES:'||F_TOT);
	TOTAL:=12;
	END LOOP;
	IF(TOTAL<>12) THEN
	DBMS_OUTPUT.PUT_LINE('SORRY NO BOOKS AVAILABLE');
	END IF;
		
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('AN EXCEPTION IS RAISED IN PROCEDURE-ISSUED');
END ISSUED;