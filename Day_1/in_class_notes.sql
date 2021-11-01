-- Hello world SQL query, SELECT all records from actor table
SELECT *
FROM actor; 

-- Query for first_name and last_name in the actor table
SELECT first_name, last_name
FROM actor;

-- Query for a first_name that equals Nick using the WHERE clause
SELECT last_name, first_name
FROM actor
WHERE first_name = 'Nick';

-- Query for first_name that is LIKE Nick using LIKE and WHERE
SELECT last_name, first_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Query for all first_names that start with 'J' using LIKE and WHERE and wildcard '%' (anything after J)
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- Query for all first_name data that starts with K and has 2 letters after the K with LIKE WHERE and underscore
select first_name, actor_id
from actor
where first_name like 'K__';


-- Query for first_name data that starts with K and ends with 'th'
-- Using LIKE, WHERE WILDCARD, and UNDERSCORE
select *
from actor
where first_name like 'K__%th';


-- Comparing operators: 
-- Greater than >, Less than <
-- Greater or equal (>=) (<=)
-- Not equal <>

-- Explore data with SELECT * Query (do this when you change to a new table)
SELECT * 
FROM payment;

-- Query for data that shows customers who paid an amount greater than $2
SELECT customer_id, amount
from payment
WHERE amount > 2.00;

-- Query for data that shows customers who paid an amount less than $7.99
SELECT customer_id, amount
FROM payment
WHERE amount < 7.99;

-- Query for data that shows customers who less than or equal to $7.99
SELECT customer_id, amount
FROM payment
WHERE amount <= 7.99;

-- Query for data showing customers who paid greater than or equal to 2
SELECT customer_id, amount
FROM payment
WHERE amount >= 2.00
-- in ascending order (descending order is DESC)
ORDER BY amount ASC; 

-- Query for data that shows customers who paid an amount between $2 and $7.99
SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2.00 and 7.99;


-- Query for data that shows customers who paid amounts not equal to 0
SELECT customer_id, amount
FROM payment
WHERE amount <> 0
ORDER BY amount DESC;


-- SQL aggregations: SUM(), AVG(), COUNT(), MIN(), MAX()
-- Query to display sum of amounts paid that are greater than 5.99
SELECT SUM(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display average of amounts greater than 5.99
SELECT AVG(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display count of amounts greater than 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount > 5.99;

-- Query to display count of DISTINCT amounts paid greater than 5.99
SELECT COUNT(DISTINCT(amount))
FROM payment
WHERE amount > 5.99;


-- Query to display min amount greater than 7.99
SELECT MIN(amount) AS min_num_payments
FROM payment
WHERE amount > 7.99;

-- Query to display max amount greater than 7.99
SELECT MAX(amount) AS max_num_payments
FROM payment
WHERE amount > 7.99;


-- Query to display different amounts grouped together and counts the amounts
SELECT amount, COUNT(amount)
FROM payment
GROUP BY amount
ORDER BY amount;


-- Query to display customer_id across from the summed amount paid
SELECT customer_id, SUM(amount) AS total_paid
from payment
GROUP BY customer_id
ORDER BY total_paid DESC;

-- Query to display same as above but differently 
SELECT customer_id, amount
from payment
GROUP BY amount, customer_id
ORDER BY customer_id DESC;



-- Select all from customer to see the table
SELECT *
FROM customer;

-- SQL HAVING clause

-- Query to display customer_ids that show up more than 5 times
-- group them by customer email
SELECT COUNT(customer_id), email
FROM customer
GROUP BY email
HAVING COUNT(customer_id) > 0;

-- Query to display customer emails WHERE first_name is Lisa
SELECT first_name, email
FROM customer
WHERE first_name LIKE 'Lisa';









