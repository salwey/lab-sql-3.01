# Lab 3.01

# Activity 1

# 1. Drop column picture from staff

# review staff table
select * from sakila.staff;


# drop picture column 
alter table sakila.staff
drop column picture;

# confirm it has dropped the picture column
select * from sakila.staff; 


# 2. A new person is hired to help Jon. 
# Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.

# take a look at tammy as a customer
select * from sakila.customer where first_name = 'TAMMY' and last_name = 'SANDERS';

# review staff table
select * 
from sakila.staff;

# insert tammy - gave her a new staff email
insert into sakila.staff values(3, 'Tammy','Sanders', 79, 'Tammy.Sanders@sakilastaff.com', 2, 1, 'Tammy', NULL, now());
delete from sakila.staff where staff_id = 3;

insert into sakila.staff (first_name, last_name,address_id, email, store_id, active, username, password, last_update)
values('Tammy','Sanders', 79, 'Tammy.Sanders@sakilastaff.com', 2, 1, 'Tammy', NULL, now());

select * 
from sakila.staff;

# check insert
select * 
from sakila.staff;


# 3. Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
# You can use current date for the rental_date column in the rental table. Hint: Check the 
# columns in the table rental and see what information you would need to add there. You can 
# query those pieces of information. For eg., you would notice that you need customer_id 
# information as well. To get that you can use the following query:
# select customer_id from sakila.customer
# where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
# Use similar method to get inventory_id, film_id, and staff_id.

select * 
from sakila.staff; # check mike's staff id = 1

select customer_id from sakila.customer
where first_name = 'CHARLOTTE' and last_name = 'HUNTER';
# customer_id = 130

select * from sakila.film where title = 'Academy Dinosaur';
# film_id = 1

# more checks
select * from sakila.rental;
select * from sakila.inventory where film_id = 1; #mike is in store one so we take 1,2,3 or 4 for the inventory_id

# insert statement
insert into sakila.rental (rental_date, inventory_id, customer_id, return_date, staff_id, last_update)
values (now(), 1, 130, null, 1, now());

# check our instert, looks good
select * from sakila.rental where rental_id = (select max(rental_id) from sakila.rental);


