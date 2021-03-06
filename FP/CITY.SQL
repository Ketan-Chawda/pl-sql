CREATE OR REPLACE PROCEDURE CITY(SCITY IN VARCHAR) IS

	CURSOR CITY_CURSOR IS
	SELECT SNAME,RNO,PERCENT FROM STUDENT
	WHERE CITY=SCITY;

	F_SNAME STUDENT.SNAME%TYPE;
	F_RNO STUDENT.RNO%TYPE;
	F_PERCENT STUDENT.PERCENT%TYPE;
	TOTAL NUMBER(2);
	
BEGIN
	OPEN CITY_CURSOR;
	LOOP
	FETCH CITY_CURSOR INTO F_SNAME,F_RNO,F_PERCENT;
	EXIT WHEN CITY_CURSOR%NOTFOUND;
	DBMS_OUTPUT.PUT_LINE('*****************************************************************************');
	DBMS_OUTPUT.PUT_LINE('STUDENTS NAME IS='||F_SNAME);
	DBMS_OUTPUT.PUT_LINE('STUDENTS ROLLNO='||F_RNO);
	DBMS_OUTPUT.PUT_LINE('STUDENTS PERCENTAGE ='||F_PERCENT);
	DBMS_OUTPUT.PUT_LINE('STUDENTS CITY IS='||SCITY);
	TOTAL:=12;
	END LOOP;

	IF(TOTAL<>12) THEN
	DBMS_OUTPUT.PUT_LINE('SORRY THERE IS NO RECORD FOUND ');
	END IF;

EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('AN EXCEPTION IS RAISED IN PROCEDURE-CITY');
END CITY;


	