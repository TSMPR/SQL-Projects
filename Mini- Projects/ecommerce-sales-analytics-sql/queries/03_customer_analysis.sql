USE ecommerce_sales;

-- Customer spending
SELECT c.customer_id,c.customer_name,ROUND(SUM(p.price*oi.quantity),2) total_spent
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
JOIN order_items oi ON o.order_id=oi.order_id JOIN products p ON oi.product_id=p.product_id
WHERE o.status='Completed' GROUP BY c.customer_id,c.customer_name ORDER BY total_spent DESC;

-- Top 5 customers
SELECT c.customer_name,ROUND(SUM(p.price*oi.quantity),2) total_spent
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
JOIN order_items oi ON o.order_id=oi.order_id JOIN products p ON oi.product_id=p.product_id
WHERE o.status='Completed' GROUP BY c.customer_id,c.customer_name
ORDER BY total_spent DESC LIMIT 5;

-- Completed orders per customer
SELECT c.customer_name,COUNT(o.order_id) completed_orders
FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id AND o.status='Completed'
GROUP BY c.customer_id,c.customer_name ORDER BY completed_orders DESC;

-- Repeat customers
SELECT c.customer_id,c.customer_name,COUNT(o.order_id) order_count
FROM customers c JOIN orders o ON c.customer_id=o.customer_id
WHERE o.status='Completed' GROUP BY c.customer_id,c.customer_name
HAVING COUNT(o.order_id)>1 ORDER BY order_count DESC;

-- Customers with no completed order
SELECT c.customer_id,c.customer_name FROM customers c
LEFT JOIN orders o ON c.customer_id=o.customer_id AND o.status='Completed'
WHERE o.order_id IS NULL;

-- Customer segmentation
SELECT customer_name,total_spent,
CASE WHEN total_spent>=10000 THEN 'High Value'
WHEN total_spent>=5000 THEN 'Medium Value' ELSE 'Low Value' END customer_segment
FROM (
 SELECT c.customer_id,c.customer_name,
 COALESCE(SUM(CASE WHEN o.status='Completed' THEN p.price*oi.quantity ELSE 0 END),0) total_spent
 FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
 LEFT JOIN order_items oi ON o.order_id=oi.order_id LEFT JOIN products p ON oi.product_id=p.product_id
 GROUP BY c.customer_id,c.customer_name
) x ORDER BY total_spent DESC;
