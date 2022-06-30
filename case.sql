select * from customer;
select customer_id, 
case 
	when customer_id between 1 and 100 then 'premium'
	when customer_id between 101 and 200 then 'plus'
	else 'usual'
end
from customer;

select customer_id,
case customer_id
	when 2 then 'winner'
	when 5 then '2nd place'
	else 'usual'
end as results
from customer
select rating from film;

select sum(
case rating
	when 'R' then 1
	else 0
end ) as r,
sum(
case rating
	when 'PG' then 1
	else 0
end )as pg,
sum(
case rating
	when 'PG-13'  then 1
	else 0
end )as pg13
from film

select cast('5' as integer) as new_int
select '5'::integer as new_int

select * from rental;
select CHAR_LENGTH(inventory_id::varchar) as inventory_id_length from rental;
select CHAR_LENGTH(CAST(inventory_id as varchar)) as inventory_id_length from rental;

select * from customer;

create view customer_info as
select first_name, last_name, address from customer
inner join address
on customer.address_id = address.address_id

select * from customer_info

create or replace view customer_info as
select first_name, last_name, address, district from customer
inner join address
on customer.address_id = address.address_id
