BEGIN
	EXECUTE IMMEDIATE 'INSERT INTO MASTER
	VALUES("&SID","&SNAME")';

	EXECUTE IMMEDIATE 'INSERT INTO DETAIL
	 VALUES("&SID","&SCITY")';

END;
