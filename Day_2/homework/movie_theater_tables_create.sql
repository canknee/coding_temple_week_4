CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	phone_number VARCHAR(15)
);	

CREATE TABLE employee(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	routing_number VARCHAR(20),
	account_number VARCHAR(20)
);	

CREATE TABLE concession(
	transaction_id SERIAL PRIMARY KEY,
	snack_type VARCHAR(20),
	quantity INTEGER,
	sold_by INTEGER NOT NULL,
	FOREIGN KEY(sold_by) REFERENCES employee(employee_id)
);

CREATE TABLE movie(
	movie_id INTEGER PRIMARY KEY,
	start_time TIME,
	end_time TIME,
	rating VARCHAR(10)
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY,
	show_date DATE,
	show_time TIME,
	price NUMERIC(5,2),
	sold_by INTEGER NOT NULL,
	sold_to INTEGER NOT NULL,
	movie_id INTEGER NOT NULL,
	FOREIGN KEY(sold_by) REFERENCES employee(employee_id),
	FOREIGN KEY(sold_to) REFERENCES customer(customer_id),
	FOREIGN KEY(movie_id) REFERENCES movie(movie_id)
);

SELECT * 
FROM employee;
