USE ecommerce_sales;

-- Units sold
SELECT p.product_name,SUM(oi.quantity) units_sold
FROM order_items oi JOIN products p ON oi.product_id=p.product_id
JOIN orders o ON oi.order_id=o.order_id WHERE o.status='Completed'
GROUP BY p.product_id,p.product_name ORDER BY units_sold DESC;

-- Product revenue
SELECT p.product_name,p.category,ROUND(SUM(p.price*oi.quantity),2) revenue
FROM order_items oi JOIN products p ON oi.product_id=p.product_id
JOIN orders o ON oi.order_id=o.order_id WHERE o.status='Completed'
GROUP BY p.product_id,p.product_name,p.category ORDER BY revenue DESC;

-- Top 5 products
SELECT p.product_name,ROUND(SUM(p.price*oi.quantity),2) revenue
FROM order_items oi JOIN products p ON oi.product_id=p.product_id
JOIN orders o ON oi.order_id=o.order_id WHERE o.status='Completed'
GROUP BY p.product_id,p.product_name ORDER BY revenue DESC LIMIT 5;

SELECT category,ROUND(AVG(price),2) average_price FROM products
GROUP BY category ORDER BY average_price DESC;

SELECT p.category,SUM(oi.quantity) units_sold
FROM products p JOIN order_items oi ON p.product_id=oi.product_id
JOIN orders o ON oi.order_id=o.order_id WHERE o.status='Completed'
GROUP BY p.category ORDER BY units_sold DESC;

-- Products never sold in completed orders
SELECT p.product_id,p.product_name FROM products p
LEFT JOIN order_items oi ON p.product_id=oi.product_id
LEFT JOIN orders o ON oi.order_id=o.order_id AND o.status='Completed'
WHERE o.order_id IS NULL;
