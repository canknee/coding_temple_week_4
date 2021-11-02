-- Insert statements for mock_creates

INSERT INTO customer(
	customer_id,
	first_name,
	last_name,
	address,
	billing_info
)
VALUES(
	1,
	'Terrell',
	'McKinney',
	'123 st st',
	'4242-4242-4242-4242 623 06/22'
);


-- Insert into Brand
INSERT INTO brand 
VALUES(
	1,
	'Coding Temple LLC',
	'773-555-4490',
	'123 st st chicago IL'
);


-- Insert into inventory
INSERT INTO inventory(
	upc,
	product_amount
) VALUES(
	1,
	5
);


-- Insert into product
INSERT INTO product VALUES(
	1,
	20.00,
	'Python 101',
	1,
	1
);


-- Insert info for orders
INSERT INTO orders(
	order_id,
	-- order_date is default so don't need to insert it 
	sub_total,
	total_cost,
	upc
) VALUES(
	1,
	40.00,
	43.50,
	1	
);


-- Insert info for cart
INSERT INTO cart VALUES(
	1,
	1,
	1
);


-- Insert into Brand to see SERIAL increment
INSERT INTO brand(
	brand_name,
	address
) VALUES(
	'Adidas',
	'321 st st'
);


SELECT *
FROM brand;









