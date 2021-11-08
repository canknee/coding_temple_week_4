CREATE TABLE customer (
	customer_id SERIAL PRIMARY KEY,
 	first_name VARCHAR(150),
  	last_name VARCHAR(150),
  	phone_num VARCHAR(50),
  	address VARCHAR(150),
  	billing_info VARCHAR(20)
);

CREATE TABLE salesperson (
	salesperson_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150)
);

CREATE TABLE manufacturedcar (
	serial_number VARCHAR(8) PRIMARY KEY,
	make VARCHAR(20),
 	model VARCHAR(20),
	year_ INTEGER
);

CREATE TABLE mechanic (
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150)
);

CREATE TABLE dealershipcar (
	car_id SERIAL PRIMARY KEY,
	serial_number VARCHAR(8) NOT NULL,
	FOREIGN KEY(serial_number) REFERENCES manufacturedcar(serial_number),
	status BOOL,
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE invoice (
	invoice_id SERIAL PRIMARY KEY,
	invoice_num INTEGER,
	invoice_price NUMERIC(6,2),
	car_id INTEGER NOT NULL,
	FOREIGN KEY(car_id) REFERENCES dealershipcar(car_id),
	salesperson_id INTEGER NOT NULL,
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
 	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE service (
	service_id SERIAL PRIMARY KEY,
	service VARCHAR(150),
	service_price NUMERIC(6,2),
	mechanic_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);
	
CREATE TABLE part (
	part_id SERIAL PRIMARY KEY,
	service_id INTEGER NOT NULL,
	FOREIGN KEY(service_id) REFERENCES service(service_id),
	part_name VARCHAR(100),
	part_quantity INTEGER,
	part_price NUMERIC(6,2)
);

CREATE TABLE service_ticket (
	service_ticket_id SERIAL PRIMARY KEY,
	service_id INTEGER NOT NULL,
	FOREIGN KEY(service_id) REFERENCES service(service_id),
	service_ticket_price NUMERIC(6,2),
	part_id INTEGER NOT NULL,
	FOREIGN KEY(part_id) REFERENCES part(part_id),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	serial_number VARCHAR(8) NOT NULL,
	FOREIGN KEY(serial_number) REFERENCES manufacturedcar(serial_number)
);






