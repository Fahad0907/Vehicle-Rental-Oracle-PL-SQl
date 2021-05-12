set serveroutput on;
declare
	place varchar2(20) := '&name';
	cost integer := &c;
	addMoney integer := 0;
	discount integer := 0;
	f integer := 0;
begin
	select cost into f from location@site_link where place = place;
	if f != 0 then
		DBMS_OUTPUT.PUT_LINE('This place is already in the database');
	end if;
	exception
	when no_data_found then
		insert into location@site_link values(place, cost, addMoney, discount);
	
end;
/