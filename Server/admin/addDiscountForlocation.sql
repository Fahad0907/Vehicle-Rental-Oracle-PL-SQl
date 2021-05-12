set serveroutput on;
declare
	eml varchar2(30) := '&email';
	pas varchar2(30) := '&password';
	plc varchar2(30) := '&place';
	cst integer := &z;
	admoney integer := &x;
	dis integer := &y;
	m integer := 0;
begin
	select id into m from admn where email = eml and pass = pas;
	update location@site_link set  cost = cst, addMoney = admoney, discount = dis where place = plc;
	exception 
		when no_data_found then
			DBMS_OUTPUT.PUT_LINE('Enter valid email and password');
end;
/