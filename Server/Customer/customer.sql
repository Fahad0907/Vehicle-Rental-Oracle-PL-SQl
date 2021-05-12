set serveroutput on;
declare
	id integer := 0;
	flag integer := 0;
	name varchar2(20) := '&name';
	phone varchar2(11) := '&phone';
	email varchar2(30) := '&email';
	address varchar2(30) := '&address';
	pass varchar2(30) := '&password';
begin
	select  customerId into flag from customer@site_link where customerMail = email;
	
	if flag !=0 then
		DBMS_OUTPUT.PUT_LINE('This email address is used');
	end if;
	exception
	when no_data_found then
		--select customerId into id from customer@site_link where customerId = (select max(customerId) 
		--from customer@site_link);
		--id := id + 1;
		insert into customer@site_link values(cusid.nextval@site_link, name, phone, email,address,pass);
		
		
end;
/