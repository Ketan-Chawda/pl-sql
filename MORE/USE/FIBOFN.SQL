DECLARE
	USER NUMBER(3);
	RESULT NUMBER(3);
BEGIN
	USER:='&USER';
	RESULT:=FIBO(USER);
	DBMS_OUTPUT.PUT_LINE(RESULT);
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('AN EXCEPTION IS RAISED IN CURRENT PROGRAM');
END;