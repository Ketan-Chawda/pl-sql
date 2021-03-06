CREATE OR REPLACE FUNCTION WORKNO(NO IN NUMBER)
 RETURN VARCHAR IS
	
	INCOME NUMBER(6,2);

BEGIN
	SELECT WAGEPERHR INTO INCOME
	FROM WORKER
	WHERE WKNO=NO;

	IF(INCOME>100 AND SQL%FOUND) THEN
	RETURN 'YES INCOME IS MORE THAN 100 PER HOUR' ;
	ELSE
	RETURN 'NO THE INCOME IS NOT MORE THAN 100 PER HOUR';
	END IF;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	RETURN 'NO RECORD FOUND';
	WHEN OTHERS THEN
	RETURN 'AN EXCEPTION IS RAISED IN FUNCTION WORKNO';
END WORKNO;