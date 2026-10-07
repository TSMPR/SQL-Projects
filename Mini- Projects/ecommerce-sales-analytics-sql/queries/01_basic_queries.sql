USE ecommerce_sales;
SELECT * FROM customers;
SELECT * FROM products;
SELECT product_name, category, price FROM products WHERE price > 2000 ORDER BY price DESC;
SELECT * FROM orders WHERE status='Completed';
SELECT customer_id, customer_name, city FROM customers WHERE city='Hyderabad';
SELECT city, COUNT(*) AS customer_count FROM customers GROUP BY city ORDER BY customer_count DESC;
SELECT category, COUNT(*) AS product_count FROM products GROUP BY category ORDER BY product_count DESC;
SELECT product_name, price FROM products ORDER BY price DESC LIMIT 5;
