set serveroutput on;
declare
	email varchar2(30) := '&email';
	pass varchar2(30) := '&password';
	n integer := 0;
	amn integer := 0;
	a integer := 0;
begin
	select customerId into a from customer@site_link where customerMail = email and customerPassword = pass;
	for i in (select place , discount from location@site_link)loop
		if i.discount > 0 then
			DBMS_OUTPUT.PUT_LINE(i.discount || ' taka discount available for ' || i.place);
		end if;
	end loop;
	select num,amount into n,amn from discount where id = (select max(id) from discount);
	if n > 0 and amn > 0 then
		DBMS_OUTPUT.PUT_LINE('After completing ' || n || ' trips you will get ' || amn || ' taka discount');
	end if;
	DBMS_OUTPUT.PUT_LINE('Your travel History : ');
	for i in (select customerId, place, money from (select  customerId,place, money from travelList1@site_link
											 union all select  customerId,place, money from travelList2@site_link
											 union all select  customerId,place, money from travelList3@site_link) where  customerId = a) loop
		DBMS_OUTPUT.PUT_LINE(i.place || ' ' || i.money);
	end loop;
	exception
	when no_data_found then
		DBMS_OUTPUT.PUT_LINE('Please enter correct mail and password');
end;
/