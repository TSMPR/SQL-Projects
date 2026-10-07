USE ecommerce_sales;

-- Total revenue
SELECT ROUND(SUM(p.price*oi.quantity),2) AS total_revenue
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id WHERE o.status='Completed';

-- Completed orders
SELECT COUNT(*) AS completed_orders FROM orders WHERE status='Completed';

-- Average order value
SELECT ROUND(AVG(order_total),2) AS average_order_value FROM (
 SELECT o.order_id,SUM(p.price*oi.quantity) order_total
 FROM orders o JOIN order_items oi ON o.order_id=oi.order_id
 JOIN products p ON oi.product_id=p.product_id
 WHERE o.status='Completed' GROUP BY o.order_id
) x;

-- Monthly revenue
SELECT DATE_FORMAT(o.order_date,'%Y-%m') sales_month,
ROUND(SUM(p.price*oi.quantity),2) revenue
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id
WHERE o.status='Completed'
GROUP BY DATE_FORMAT(o.order_date,'%Y-%m') ORDER BY sales_month;

-- Revenue by city
SELECT c.city,ROUND(SUM(p.price*oi.quantity),2) revenue
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
JOIN order_items oi ON o.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id
WHERE o.status='Completed' GROUP BY c.city ORDER BY revenue DESC;

-- Revenue by category
SELECT p.category,ROUND(SUM(p.price*oi.quantity),2) revenue
FROM orders o JOIN order_items oi ON o.order_id=oi.order_id
JOIN products p ON oi.product_id=p.product_id
WHERE o.status='Completed' GROUP BY p.category ORDER BY revenue DESC;

SELECT status,COUNT(*) order_count FROM orders GROUP BY status;
SELECT payment_method,COUNT(*) payment_count FROM payments
WHERE payment_status='Paid' GROUP BY payment_method ORDER BY payment_count DESC;
