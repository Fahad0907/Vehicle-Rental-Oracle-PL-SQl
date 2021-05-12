set serveroutput on;
declare
	eml varchar2(30) := '&email';
	pas varchar2(30) := '&password';
	m integer :=0;
	n integer := &x;
	amnt integer := &a;
begin
	select id into m from admn where email = eml and pass = pas;
	insert into discount values(seq.nextval,n,amnt);
	exception 
		when no_data_found then
			DBMS_OUTPUT.PUT_LINE('Enter valid email and password');
end;
/