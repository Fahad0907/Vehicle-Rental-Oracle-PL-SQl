set serveroutput on;
declare
	eml varchar2(30) := '&email';
	pas varchar2(30) := '&password';
	a integer := -1;
	b integer := 50000;
	highestLoc varchar2(30) ;
	lowestLoc varchar2(30) := 'h';
	t integer := &x;
	ad integer := &a;
	dis integer :=&d;
	m integer :=0;
begin
	select id into m from admn where email = eml and pass = pas;
	if t = 1 then 
		for i in (select  place, count(place) as total from (select place from travelList1@site_link
											 union all select place from travelList2@site_link
											 union all select place from travelList3@site_link) group by place) loop
			if a < i.total then
				a := i.total;
				highestLoc := i.place;
			--DBMS_OUTPUT.PUT_LINE(a);
			if b > i.total then
				b := i.total;
				lowestLoc := i.place;
			end if;
			end if;
		end loop;
		--DBMS_OUTPUT.PUT_LINE(lowestLoc);
		--DBMS_OUTPUT.PUT_LINE(highestLoc);
		update location@site_link set addmoney = ad where place = highestLoc;
	elsif t = 2 then
		for i in (select  place, count(place) as total from (select place from travelList1@site_link
											 union all select place from travelList2@site_link
											 union all select place from travelList3@site_link) group by place) loop
			
			if b > i.total then
				b := i.total;
				lowestLoc := i.place;
			
			end if;
		end loop;
		--DBMS_OUTPUT.PUT_LINE(lowestLoc);
		update location@site_link set discount = dis where place = lowestLoc;
	elsif t = 3 then
		update location@site_link set discount = 0 , addmoney = 0 where place = 'Rajshahi';
		update location@site_link set discount = 0 , addmoney = 0 where place = 'Dinajpur';
		update location@site_link set discount = 0 , addmoney = 0 where place = 'Rangamati';
	elsif t = 4 then
		for i in (select  place, count(place) as total from (select place from travelList1@site_link
											 union all select place from travelList2@site_link
											 union all select place from travelList3@site_link) group by place) loop
				DBMS_OUTPUT.PUT_LINE(i.place ||' ' || i.total);
		end loop;
	end if;
	exception 
		when no_data_found then
			DBMS_OUTPUT.PUT_LINE('Enter valid email and password');
end;
/