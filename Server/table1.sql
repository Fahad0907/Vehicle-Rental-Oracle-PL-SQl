clear screen;
drop table admn cascade constraints;

create table admn(
	id integer,
	email varchar2(20),
	pass varchar2(20)
);
insert into admn values(1,'admin@gmail.com','123456');