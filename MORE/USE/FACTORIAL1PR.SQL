DECLARE
	USER NUMBER(3);
BEGIN
	USER:='&USER';
	FACTORIAL1(USER);
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('SORRY THE EXCEPTION IS RAISED IN CURRENT PROGRAM');
END;
