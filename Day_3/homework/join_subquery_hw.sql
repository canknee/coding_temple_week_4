-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name, COUNT(amount)
FROM payment
FULL JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99
GROUP BY customer.first_name, customer.last_name
ORDER BY COUNT(amount) DESC;


-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
);


-- 4. List all customers that live in Nepal (use the city table)
SELECT first_name, last_name, country
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id
FULL JOIN city
ON address.city_id = city.city_id
FULL JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal';


-- 5. Which staff member had the most transactions?
SELECT first_name, last_name, COUNT(payment.staff_id)
FROM payment
FULL JOIN staff
ON payment.staff_id = staff.staff_id
GROUP BY first_name, last_name;


-- 6. How many movies of each rating are there?
SELECT COUNT(film_id), rating
FROM film
GROUP BY rating;


-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT first_name, last_name
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id, amount
	HAVING amount > 6.99
);


-- 8. How many free rentals did our stores give away?
SELECT COUNT(amount)
FROM payment
WHERE amount = 0


	