set serveroutput on;
declare
	email varchar2(30) := '&email';
	pass varchar2(30) := '&password';
	plc varchar2(20) := '&Enter_place';
	a integer := 0;
	taka integer := 0;
	ad integer :=0;
	dis integer :=0;
	dis1 integer :=0; 
	n integer := 0;
	amn integer :=0;
	t integer :=0;
	z integer :=0;
	p integer := 0;
	
begin
	select customerId into a from customer@site_link where customerMail = email and customerPassword = pass;
	
	if plc = 'Rajshahi' then
		--DBMS_OUTPUT.PUT_LINE(taka);
		select num,amount into n,amn from discount where id = (select max(id) from discount);
		--DBMS_OUTPUT.PUT_LINE(n);
		select customerId, count(customerId) as total into t,z from counting where customerId = a group by customerId ;
		DBMS_OUTPUT.PUT_LINE(n || ' ' || amn || '' || t);
		if t >= n then
			dis1 := amn;
			delete from counting where customerID = a;
			--DBMS_OUTPUT.PUT_LINE(dis1);
		end if;
		select cost,addMoney,discount into taka,  ad,  dis from location@site_link where place = plc;
		DBMS_OUTPUT.PUT_LINE('Your total Cost is ' || (totalMoney(taka,ad,dis) - dis1));
		p := (totalMoney(taka,ad,dis) - dis1);
		insert into travelList1@site_link values(travel1.nextval@site_link, a, plc, p);
		insert into counting values(a,plc);
		
	elsif plc = 'Dinajpur' then
		--DBMS_OUTPUT.PUT_LINE('Cle');
		select num,amount into n,amn from discount where id = (select max(id) from discount);
		select customerId, count(customerId) as total into t,z from counting where customerId = a group by customerId ;
		if t >= n then
			dis1 := amn;
			delete from counting where customerID = a;
			--DBMS_OUTPUT.PUT_LINE(dis1);
		end if;
		select cost,addMoney,discount into taka,  ad,  dis from location@site_link where place = plc;
		DBMS_OUTPUT.PUT_LINE('Your total Cost is ' || (totalMoney(taka,ad,dis) - dis1));
		p := (totalMoney(taka,ad,dis) - dis1);
		insert into travelList2@site_link values(travel2.nextval@site_link, a, plc, p);
		insert into counting values(a,plc);
	elsif plc = 'Rangamati' then
		--DBMS_OUTPUT.PUT_LINE('Cl');
		select num,amount into n,amn from discount where id = (select max(id) from discount);
		select customerId, count(customerId) as total into t,z from counting where customerId = a group by customerId ;
		if t >= n then
			dis1 := amn;
			delete from counting where customerID = a;
			--DBMS_OUTPUT.PUT_LINE(dis1);
		end if;
		select cost,addMoney,discount into taka,  ad,  dis from location@site_link where place = plc;
		DBMS_OUTPUT.PUT_LINE('Your total Cost is ' || (totalMoney(taka,ad,dis) - dis1));
		p := (totalMoney(taka,ad,dis) - dis1);
		insert into travelList3@site_link values(travel3.nextval@site_link, a, plc, p);
		insert into counting values(a,plc);
	else
		DBMS_OUTPUT.PUT_LINE('Please enter place from ');
		placeList();
	end if;
	
	
exception
	when no_data_found then
		DBMS_OUTPUT.PUT_LINE('Please give correct userEmail and password');
end;
/