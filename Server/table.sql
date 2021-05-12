clear screen;
drop table counting cascade constraints;
drop table discount cascade constraints;
create table counting(
	customerID integer,
	place varchar2(20)
);
create table discount(
	id integer,
	num INTEGER,
	amount integer
);
create sequence seq increment by 1 start with 1;
insert into discount values(seq.nextval,0,0);
commit;