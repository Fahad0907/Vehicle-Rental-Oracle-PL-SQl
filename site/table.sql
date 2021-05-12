clear screen;
drop table customer cascade constraints;
--drop table customerLoginInfo cascade constraints;
drop table location cascade constraints;
drop table travelList1 cascade constraints;
drop table travelList2 cascade constraints;
drop table travelList3 cascade constraints;
create table customer(
	customerId integer,
	customerName varchar2(20),
	customerPhone varchar2(11),
	customerMail varchar2(30),
	customerAddress varchar2(30),
	customerPassword varchar2(20),
	primary key(customerId)
);
--create sequence customer_id increment by 1 start with 1;
create table location(
	place varchar2(20),
	cost integer,
	addMoney integer,
	discount integer,
	primary key(place)
);
create table travelList1(
	id integer,
	customerId integer,
	place varchar2(20),
	money integer,
	primary key(id),
	foreign key(customerId) references customer(customerId),
	foreign key(place) references location(place)
);
create table travelList2(
	id integer,
	customerId integer,
	place varchar2(20),
	money integer,
	primary key(id),
	foreign key(customerId) references customer(customerId),
	foreign key(place) references location(place)
);

create table travelList3(
	id integer,
	customerId integer,
	place varchar2(20),
	money integer,
	primary key(id),
	foreign key(customerId) references customer(customerId),
	foreign key(place) references location(place)
);

--insert into customer values (1,'Fakhrul Islam Fahad', '01627174307','f@gmail.com','Mohammadpur','123456');

insert into location values('Rajshahi',10000,0,0);
insert into location values('Dinajpur',12000,0,0);
insert into location values('Rangamati',14000,0,0);


commit;
