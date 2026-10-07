USE ecommerce_sales;

DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
 customer_id INT PRIMARY KEY,
 customer_name VARCHAR(100) NOT NULL,
 email VARCHAR(150) UNIQUE NOT NULL,
 city VARCHAR(80) NOT NULL,
 signup_date DATE NOT NULL
);

CREATE TABLE products (
 product_id INT PRIMARY KEY,
 product_name VARCHAR(120) NOT NULL,
 category VARCHAR(80) NOT NULL,
 price DECIMAL(10,2) NOT NULL CHECK (price > 0)
);

CREATE TABLE orders (
 order_id INT PRIMARY KEY,
 customer_id INT NOT NULL,
 order_date DATE NOT NULL,
 status ENUM('Completed','Pending','Cancelled') NOT NULL,
 FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
 order_item_id INT PRIMARY KEY,
 order_id INT NOT NULL,
 product_id INT NOT NULL,
 quantity INT NOT NULL CHECK (quantity > 0),
 FOREIGN KEY (order_id) REFERENCES orders(order_id),
 FOREIGN KEY (product_id) REFERENCES products(product_id)
);

CREATE TABLE payments (
 payment_id INT PRIMARY KEY,
 order_id INT NOT NULL,
 payment_method ENUM('UPI','Credit Card','Debit Card','Net Banking','Cash on Delivery') NOT NULL,
 payment_status ENUM('Paid','Pending','Failed','Refunded') NOT NULL,
 FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
