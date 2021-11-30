SELECT * 
FROM customers
LIMIT 10;

SELECT * 
FROM orders
LIMIT 10;

SELECT * 
FROM books
LIMIT 10;

SELECT *
FROM pg_indexes
WHERE tablename = 'customers';

SELECT *
FROM pg_indexes
WHERE tablename = 'orders';

SELECT *
FROM pg_indexes
WHERE tablename = 'books';

EXPLAIN ANALYZE SELECT *
FROM orders
WHERE quantity > 18;

CREATE INDEX orders_quantity_idx ON
orders(quantity)
WHERE quantity > 18;

EXPLAIN ANALYZE SELECT *
FROM orders
WHERE quantity > 18;

ALTER TABLE customers
ADD CONSTRAINT customers_pkey
PRIMARY KEY (customer_id);

SELECT *
FROM pg_indexes
WHERE tablename = 'customers';

EXPLAIN ANALYZE SELECT *
FROM customers
WHERE customer_id < 100;

CLUSTER customers USING
customers_pkey;	

SELECT *
FROM customers
LIMIT 10;

CREATE INDEX
orders_customer_id_book_id_idx ON
orders(customer_id, book_id);

DROP INDEX IF EXISTS orders_customer_id_book_id_idx;

EXPLAIN ANALYZE SELECT *
FROM orders;

SELECT pg_size_pretty
(pg_total_relation_size('orders'));

CREATE INDEX
orders_customer_id_book_id_quantity_idx ON
orders(customer_id, book_id, quantity);

EXPLAIN ANALYZE SELECT *
FROM orders;

SELECT pg_size_pretty
(pg_total_relation_size('orders'));

EXPLAIN ANALYZE SELECT *
FROM books;

CREATE INDEX
books_author_title_idx ON
books(author, title);

EXPLAIN ANALYZE SELECT *
FROM books;


EXPLAIN ANALYZE SELECT *
FROM orders
WHERE (quantity * price_base) > 100;

EXPLAIN ANALYZE SELECT *
FROM orders;

CREATE INDEX
total_price_idx ON
orders((quantity * price_base));

EXPLAIN ANALYZE SELECT *
FROM orders;

SELECT *
FROM pg_indexes
WHERE tablename IN ('customers', 'books', 'orders')
ORDER BY tablename, indexname;

DROP INDEX IF EXISTS books_author_idx;

DROP INDEX IF EXISTS orders_customer_id_quantity;

CREATE INDEX customers_last_name_first_name_email_address ON customers (last_name, first_name, email_address);

SELECT *
FROM pg_indexes
WHERE tablename IN ('customers', 'books', 'orders')
ORDER BY tablename, indexname;