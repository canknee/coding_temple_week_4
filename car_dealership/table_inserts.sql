INSERT INTO customer
VALUES(
	1,
	'Ken',
	'Lin',
	'617-555-5555',
	'1 Aubuchon Hardware Ln',
	'4444-4444-4444-4444'
);

INSERT INTO customer
VALUES(
	2,
	'Cam',
	'Bailey',
	'617-666-6666',
	'2 Aubuchon Hardware Ln',
	'4343-4343-4343-4343'
);

CREATE OR REPLACE FUNCTION add_customer(_customer_id INTEGER, _first_name VARCHAR, _last_name VARCHAR, _phone_num VARCHAR, _address VARCHAR, _billing_info VARCHAR)
	RETURNS VOID
	AS $MAIN$
	BEGIN
		INSERT INTO customer VALUES(_customer_id, _first_name, _last_name, _phone_num, _address, _billing_info);
	END;
	$MAIN$
	LANGUAGE plpgsql;


SELECT add_customer(3, 'Ohad', 'Macaroni', '617-777-7777', '3 Aubuchon Hardware Ln', '4242-4242-4242-4242');
SELECT add_customer(4, 'Dan', 'Macaroni', '617-888-8888', '3 Aubuchon Hardware Ln', '5555-5555-5555-5555');


INSERT INTO salesperson
VALUES(
	1,
	'Alex',
	'Aubuchon'
);

INSERT INTO salesperson
VALUES(
	2,
	'Selene',
	'Aubuchon'
);


INSERT INTO manufacturedcar
VALUES(
	00000001,
	'Toyota',
	'Camry',
	2011
);

INSERT INTO manufacturedcar
VALUES(
	00000002,
	'Tesla',
	'X',
	2022
);


INSERT INTO mechanic
VALUES(
	1,
	'Justin',
	'Chen'
);

INSERT INTO mechanic
VALUES(
	2,
	'Albert',
	'Xu'
);


INSERT INTO dealershipcar
VALUES(
	1,
	00000001,
	TRUE,
	1,
	1
);

INSERT INTO dealershipcar
VALUES(
	2,
	00000002,
	TRUE,
	2,
	4
);


INSERT INTO invoice
VALUES(
	1,
	1,
	2399.99,
	1,
	1,
	1
);

INSERT INTO invoice
VALUES(
	2,
	2,
	4399.99,
	2,
	2,
	4
);


INSERT INTO service
VALUES(
	1,
	'Oil change',
	49.99,
	1
);

INSERT INTO service
VALUES(
	2,
	'Tire change',
	449.99,
	1
);



INSERT INTO part
VALUES(
	1,
	1,
	'Oil',
	1,
	49.99
);

INSERT INTO part
VALUES(
	2,
	2,
	'Tires',
	4,
	449.99
);


INSERT INTO service_ticket
VALUES(
	1,
	1,
	49.99,
	1,
	1,
	00000001
);

INSERT INTO service_ticket
VALUES(
	2,
	2,
	449.99,
	2,
	1,
	00000001
);















