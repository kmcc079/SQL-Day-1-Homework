-- 1. How many actors are there with the last name 'Wahlberg'?
select count(last_name)
FROM actor
WHERE last_name LIKE 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
select count(amount)
from payment
where amount between 3.99 and 5.99;

-- 3. What film does the store have the most of? (search in inventory)
select film_id, count(film_id)
from inventory
group by film_id 
order by film_id desc;

-- 4. How many customers have the last name ‘William’?
select count(last_name)
from customer
where last_name like 'William';

-- 5. What store employee (get the id) sold the most rentals?
select staff_id, count(staff_id)
from rental
group by staff_id
order by staff_id
fetch first 1 rows only;

-- 6. How many different district names are there?
select count(distinct district)
from address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
select film_id --, count(actor_id)
from film_actor
group by film_id
order by count(actor_id) desc
fetch first 1 rows only;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
select count(customer_id)
from customer
where store_id = 1 and last_name like '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

--1st: list payment the payment amounts with a number of rentals above 250
--select amount, count(amount)
--from payment
--group by amount
--having count(amount) > 250
--order by count(amount) desc;

--2nd: list payment the payment amounts with a number of rentals above 250 for customers with ids between 380 and 430
--select amount, count(amount)
--from payment
--where customer_id between 380 and 430
--group by amount
--having count(amount) > 250
--order by count(amount) desc;

--FINAL:
select count(amount) over() as num_payment_amounts 
from payment
where customer_id between 380 and 430
group by amount
having count(amount) > 250
fetch first 1 rows only;

-- 10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?
select count(distinct rating) as num_of_categories, (select rating from film
group by rating
order by count(rating) desc
limit 1) as most_ratings
from film;

-- as separate queries:

--select count(distinct rating) as num_of_categories
--from film

--select rating as most_ratings
--from film
--group by rating
--order by count(rating) desc
--limit 1;





