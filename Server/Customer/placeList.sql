set serveroutput on;


create or replace procedure placeList
		IS
	a varchar(20) :=0;



begin

	for i in (select * from Location@site_link)loop
		a := i.place;
		DBMS_OUTPUT.PUT_LINE(a);
	end loop;
		
end placeList;
/