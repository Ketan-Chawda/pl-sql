CREATE OR REPLACE PROCEDURE ARMSTRONG1(V1 IN NUMBER) IS
	SUM NUMBER(5);
	STORE NUMBER(5);
BEGIN
	STORE:=V1;
	SUM:=0;
	LOOP
	SUM:=SUM+POWER(STORE MOD 10,3);
	STORE:=(STORE-STORE MOD 10)/10;
	EXIT WHEN STORE MOD 10=STORE;
	END LOOP;
	
	IF(STORE=V1) THEN
	DBMS_OUTPUT.PUT_LINE('YES THE INPUTTED NUMBER IS ARMSTRONG');
	ELSE
	DBMS_OUTPUT.PUT_LINE('NO THE INPUTTED NUMBER IS NOT A ARMSTRONG');
	END IF;
EXCEPTION
	WHEN OTHERS THEN
	DBMS_OUTPUT.PUT_LINE(' AN EXCEPTION IS RAISED IN ARMSTRONG1 PROCEDURE');
END ARMSTRONG1;

	

