CREATE OR REPLACE PROCEDURE EVENODD1(VAL IN NUMBER) IS
BEGIN
	DBMS_OUTPUT.PUT_LINE('YOU HAVE CALLED A USER-DEFINED FUNCTION NAMED EVENODD');
	IF VAL MOD 2=1 THEN
	DBMS_OUTPUT.PUT_LINE('NO IT IS NOT A EVEN NUMBER');
	ELSE
	DBMS_OUTPUT.PUT_LINE('YES IT IS EVEN NUMBER');
	END IF;

EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE('AN EXCEPTION IS RAISED IN EVENODD1 PROCEDURE');
END EVENODD1;
