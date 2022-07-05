create table car (
	car_id SERIAL primary key
);

create table invoice (
	invoice_id SERIAL primary key,
	invoice_sold NUMERIC(8, 2),
	invoice_bought NUMERIC(8, 2)
);

create table parts (
	new_parts_id SERIAL primary key,
	new_parts VARCHAR(100)
);

create table mechanic (
	mechanic_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	new_parts_id INTEGER,
	foreign key(new_parts_id) references parts(new_parts_id)
);

create table service (
	service_ticket_id SERIAL primary key,
	service_history NUMERIC(8, 2),
	car_id INTEGER,
	mechanic_id INTEGER,
	new_parts_id INTEGER,
	foreign key(car_id) references car(car_id),
	foreign key(mechanic_id) references mechanic(mechanic_id),
	foreign key(new_parts_id) references parts(new_parts_id)
);


create table customer (
	customer_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	car_id INTEGER,
	invoice_id INTEGER,
	foreign key(car_id) references car(car_id),
	foreign key(invoice_id) references invoice(invoice_id)
);

create table salesperson (
	salesperson_id SERIAL primary key,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	invoice_id INTEGER,
	car_id INTEGER,
	foreign key(invoice_id) references invoice(invoice_id),
	foreign key(car_id) references car(car_id)
);


insert into car (
	car_id 
) values (
	1564
);

insert into invoice (
	invoice_id,
	invoice_sold,
	invoice_bought
) values (
	1549,
	15,
	49
);

insert into parts (
	new_parts_id,
	new_parts
) values (
	1548,
	'You need new parts'
);

insert into mechanic (
	mechanic_id,
	first_name,
	last_name,
	new_parts_id
) values (
	1942,
	'Jim',
	'Bob',
	1548
);

insert into service (
	service_ticket_id,
	service_history,
	car_id,
	mechanic_id,
	new_parts_id
) values (
	0328,
	503.01,
	1564,
	1942,
	1548
);

insert into salesperson (
	salesperson_id,
	first_name,
	last_name,
	invoice_id,
	car_id
) values (
	16780,
	'Jim',
	'Bean',
	1549,
	1564
);

insert into customer (
	customer_id,
	first_name,
	last_name,
	car_id,
	invoice_id
) values (
	1,
	'Jack',
	'daniels',
	1564,
	1549
);


create or replace function add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns void
as $MAIN$
begin 
	insert into customer(customer_id, first_name, last_name)
	values(_customer_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

select add_customer(200, 'Jack', 'Lantern');

select * from customer;


create or replace function add_salesperson(_salesperson_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns void
as $MAIN$
begin 
	insert into salesperson(salesperson_id, first_name, last_name)
	values(_salesperson_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

select add_salesperson(100, 'Katazora', 'Shugoro');
select add_salesperson(1312, 'Dran', 'Grafton');


select * from salesperson;


create or replace function add_mechanic(_mechanic_id INTEGER, _first_name VARCHAR, _last_name VARCHAR)
returns void
as $MAIN$
begin 
	insert into mechanic(mechanic_id, first_name, last_name)
	values(_mechanic_id, _first_name, _last_name);
end;
$MAIN$
language plpgsql;

select add_mechanic(4576, 'Cory', 'Collamore');

select * from mechanic;


















