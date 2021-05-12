set serveroutput on;
create or replace function totalMoney(a in  integer, b in integer, c in integer)
	return integer is
begin
	return (a+b)-c;
end totalMoney;
/