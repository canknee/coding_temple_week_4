-- 1. How many actors are there with the last name ‘Wahlberg’?
-- Answer: 2
SELECT last_name
FROM actor
WHERE last_name LIKE 'Wahlberg';

-- 2. How many payments were made between $3.99 and $5.99?
-- Answer: 5607
SELECT COUNT(amount)
FROM payment 
WHERE amount BETWEEN 3.99 and 5.99;

-- 3. What film does the store have the most of? (search in inventory)
-- Answer: Multiple films are tied at 8
SELECT COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

-- 4. How many customers have the last name ‘William’?
-- Answer: 0
SELECT last_name
FROM actor
WHERE last_name LIKE 'William';

-- 5. What store employee (get the id) sold the most rentals?
-- Answer: 1 - 8040  // Wouldn't it be employee ID# 2? with 16008 rentals?
SELECT SUM(staff_id)
FROM rental
GROUP BY staff_id;

-- 6. How many different district names are there?
-- Answer: 378
SELECT COUNT(DISTINCT(district))
FROM address;

-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- Answer: film_id 508 - 15 actors
SELECT COUNT(actor_id), film_id
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)
-- Answer: 13
SELECT first_name, last_name, store_id
FROM customer
WHERE store_id = 1 AND last_name LIKE '%es';

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers 
--    with ids between 380 and 430? (use group by and having > 250)
-- Answer: 3
SELECT amount, COUNT(customer_id)
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(customer_id) > 250;

-- 10. Within the film table, how many rating categories are there? And what rating has the most movies total?
-- Answer: 5 ratings, PG-13 has the most
SELECT COUNT(DISTINCT(rating))
FROM film;

SELECT COUNT(film_id), rating
FROM film
GROUP BY rating;


-- SELECT first_name, last_name, order_date, amount
-- FROM customer
-- LEFT JOIN order_
-- ON customer.customer_id = order_.customer_id
-- WHERE order_date IS NOT NULL;

SELECT *
FROM film_actor;

-- inner join on actor and film_actor table
SELECT actor.actor_id, first_name, last_name, film_id
FROM film_actor
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id;

--left join on actor and film_actor
SELECT actor.actor_id, first_name, last_name, film_id
FROM film_actor
LEFT JOIN actor
ON actor.actor_id = film_actor.actor_id
WHERE first_name IS NULL AND last_name IS NULL;


-- Join that will produce info about customers from Country of Angola
SELECT customer.first_name, customer.last_name, customer.email, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Angola';


-- Right join to find out the amount of staff members
SELECT COUNT(staff_id), store.store_id
FROM staff
RIGHT JOIN store
ON staff.store_id = store.store_id
GROUP BY store.store_id;


-- Test with aggregate
SELECT language.name, COUNT(*)
FROM film
LEFT JOIN language
ON film.language_id = language.language_id
GROUP BY language.language_id;



-- SubQuery section: Two separate queries that we can put together 

-- Find a customer_id that has an amount greater of $175 total payments
SELECT customer_id
FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 175
ORDER BY SUM(amount) DESC;


-- SECOND QUERY --
SELECT *
FROM customer;

-- Subquery to find the 6 customers that have a total amount paid greater than $175
SELECT * 
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);


-- Basic subquery example 2: Find all films with the language "English"
SELECT *
FROM film
WHERE language_id IN(
	SELECT language_id
	FROM language
	WHERE name = 'English'
);


-- What film has the most actors? film_actor + film_id

SELECT title, film.film_id, COUNT(film_actor.film_id)
FROM film_actor
LEFT JOIN film
ON film_actor.film_id = film.film_id
GROUP BY title, film.film_id
ORDER BY COUNT(film_actor.film_id) DESC;



SELECT title
FROM film
WHERE film_id IN(
	SELECT film_id
	FROM film_actor
	GROUP BY film_id
	ORDER BY COUNT(film_id) DESC
	LIMIT 1
);









