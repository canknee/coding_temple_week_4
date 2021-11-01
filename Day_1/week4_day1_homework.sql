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




