CREATE OR REPLACE PACKAGE BODY LIBRARY AS

FUNCTION FINETOPAY(ID IN STUDENT1.SID%TYPE)
	RETURN NUMBER IS

	AMOUNT NUMBER(5,2);
	DAYS NUMBER(3);
	
BEGIN
	SELECT (RDATE-IDATE-15) INTO DAYS
	FROM ISSUE1,RETURN1
	WHERE RDATE-IDATE >15
	AND ISSUE1.I_ID=RETURN1.I_ID
	AND ISSUE1.SID=ID;
	
	IF(DAYS<7) THEN
	RETURN DAYS*1;
	ELSIF(DAYS<15) THEN
	RETURN DAYS*3;
	ELSIF(DAYS>=15) THEN
	RETURN DAYS*5;
	ELSE
	RETURN 0;
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE('SORRY NO RECORD IS FOUND OR NO FINED IS CHARGED');
	RETURN -1;
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('A EXCEPTION IS RAISED IN FINE FUNCTION');
END FINETOPAY;

FUNCTION NOTRETURN RETURN NUMBER IS
	
	CURSOR NOTRETURN_CURSOR IS
	SELECT I_ID,BID,SID,IDATE
	FROM ISSUE1
	WHERE IDATE>SYSDATE-15
	AND I_ID NOT IN(SELECT I_ID FROM RETURN1);

	F_ID ISSUE1.I_ID%TYPE;
	F_BID ISSUE1.BID%TYPE;
	F_SID ISSUE1.SID%TYPE;
	F_IDATE ISSUE1.IDATE%TYPE;
	
BEGIN
	OPEN NOTRETURN_CURSOR;
	LOOP
	FETCH NOTRETURN_CURSOR INTO F_ID,F_BID,F_SID,F_IDATE;
	EXIT WHEN NOTRETURN_CURSOR%NOTFOUND;	
	DBMS_OUTPUT.PUT_LINE('*********************************************************');
	DBMS_OUTPUT.PUT_LINE('BOOK ID:'||F_BID);
	DBMS_OUTPUT.PUT_LINE('STUDENT ID:'||F_SID);
	DBMS_OUTPUT.PUT_LINE('ISSUE ID:'||F_ID);
	DBMS_OUTPUT.PUT_LINE('ISSUE DATE IS='||F_IDATE);
	END LOOP;	
	RETURN 1;

EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('AN EXCEPTION IS RAISED IN FUNCTION-NOTRETURN');
END NOTRETURN;


PROCEDURE BOOK IS

	 CURSOR BOOK_CURSOR IS
	SELECT BID,SID,IDATE FROM ISSUE1
	WHERE ISSUE1.I_ID NOT IN(SELECT I_ID FROM RETURN1);

	F_BID ISSUE1.BID%TYPE;
	F_SID ISSUE1.SID%TYPE;
	F_IDATE ISSUE1.IDATE%TYPE;
	
BEGIN
	OPEN BOOK_CURSOR;
	LOOP
	FETCH BOOK_CURSOR INTO F_BID,F_SID,F_IDATE;
	EXIT WHEN BOOK_CURSOR%NOTFOUND;
	DBMS_OUTPUT.PUT_LINE('******************************************************************');
	DBMS_OUTPUT.PUT_LINE('BOOKNO:-'||F_BID);
	DBMS_OUTPUT.PUT_LINE('STUDENT ID:-'||F_SID);
	DBMS_OUTPUT.PUT_LINE('ISSUE DATE IS:-'||F_IDATE);
	END LOOP;
		
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('AN EXCEPTION IS RAISED IN PROCEDURE-BOOK');
END BOOK;


PROCEDURE ISSUED IS

	CURSOR ISSUED_CURSOR IS
	SELECT BID,COUNT(BID) AS TOT
	FROM ISSUE1
	WHERE BID IN(SELECT BID FROM BOOK1)
	GROUP BY BID;
	
	F_BID BOOK1.BID%TYPE;
	F_TOT NUMBER(2);
BEGIN
	OPEN ISSUED_CURSOR;
	LOOP
	FETCH ISSUED_CURSOR INTO F_BID,F_TOT;
	EXIT WHEN ISSUED_CURSOR%NOTFOUND;
	DBMS_OUTPUT.PUT_LINE('BOOK ID:'||F_BID);
	DBMS_OUTPUT.PUT_LINE('ISSUED TIMES:'||F_TOT);
	END LOOP;
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('AN EXCEPTION IS RAISED IN PROCEDURE-ISSUED');
END ISSUED;

END LIBRARY;


