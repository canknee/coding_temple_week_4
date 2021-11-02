-- Primary keys cannot be duplicated
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(150)
);	

-- Brand table creation
CREATE TABLE brand(
	seller_id SERIAL PRIMARY KEY,
	brand_name VARCHAR(100),
	contact_number VARCHAR(15),
	address VARCHAR(150)
);

-- Inventory table creation
CREATE TABLE inventory(
	upc INTEGER PRIMARY KEY,
	product_amount INTEGER
);

-- Order table creation
CREATE TABLE orders(
	order_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	sub_total NUMERIC(8, 2),
	total_cost NUMERIC(10,2),
	upc INTEGER NOT NULL, --NOT NUTLL contraint means that this cannot be empty	
	FOREIGN KEY(upc) REFERENCES inventory(upc)
);

-- Product table creation
CREATE TABLE product(
	item_id SERIAL PRIMARY KEY,
	amount NUMERIC(5, 2),
	product_name VARCHAR(100),
	upc INTEGER NOT NULL,
	seller_id INTEGER NOT NULL,
	FOREIGN KEY(upc) REFERENCES inventory(upc),
	FOREIGN KEY(seller_id) REFERENCES brand(seller_id)
);

-- Cart table creation
CREATE TABLE cart(
	cart_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	order_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(order_id) REFERENCES orders(order_id)
);



