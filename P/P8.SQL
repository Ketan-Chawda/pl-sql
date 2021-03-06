DECLARE
	CURSOR P8_CURSOR
	IS SELECT ENO,DNO,DESG 
	FROM EMP_MST;
	
	F_ENO EMP_MST.ENO%TYPE;
	F_DNO EMP_MST.DNO%TYPE;
	F_DESG EMP_MST.DESG%TYPE;

	R_DESG RATE.DESG%TYPE;
	R_RATE RATE.RATEPERHR%TYPE;

	W_ENO WRK_HR.ENO%TYPE;
	W_HRS WRK_HR.WORKHRS%TYPE;
	
	U_ENO EMP_MST.ENO%TYPE;
	U_DNO EMP_MST.DNO%TYPE;
	U_DESG EMP_MST.DESG%TYPE;
BEGIN
	U_ENO:='&U_ENO';
	U_DNO:='&U_DNO';
	U_DESG:='&U_DESG';

	OPEN P8_CURSOR;
	LOOP
	FETCH P8_CURSOR INTO F_ENO,F_DNO,F_DESG;

	EXIT WHEN P8_CURSOR%NOTFOUND;	

	SELECT DESG,RATEPERHR INTO R_DESG,R_RATE
	FROM RATE 
	WHERE DESG=U_DESG;

	SELECT ENO,WORKHRS INTO W_ENO,W_HRS  
	FROM WRK_HR
	WHERE ENO=U_ENO;

	IF(F_ENO=U_ENO AND F_DNO=U_DNO AND F_DESG=U_DESG 
	AND R_DESG=U_DESG AND W_ENO=U_ENO) THEN

	UPDATE EMP_MST
	SET SAL=R_RATE*W_HRS
	WHERE ENO=U_ENO;
	IF(SQL%FOUND) THEN
	DBMS_OUTPUT.PUT_LINE('YES THE RECORD IS UPDATED SUCCESSFULLY');
	END IF;

	END IF;	
	END LOOP;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
	DBMS_OUTPUT.PUT_LINE('SORRY NO DATA AVAILABLE ACCORDING TO ENRTY');
END;

