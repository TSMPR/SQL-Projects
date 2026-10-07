USE ecommerce_sales;

-- Customers spending above average
WITH customer_sales AS (
 SELECT c.customer_id,c.customer_name,SUM(p.price*oi.quantity) total_spent
 FROM customers c JOIN orders o ON c.customer_id=o.customer_id
 JOIN order_items oi ON o.order_id=oi.order_id JOIN products p ON oi.product_id=p.product_id
 WHERE o.status='Completed' GROUP BY c.customer_id,c.customer_name
)
SELECT * FROM customer_sales
WHERE total_spent>(SELECT AVG(total_spent) FROM customer_sales)
ORDER BY total_spent DESC;

-- Overall product rank
WITH product_revenue AS (
 SELECT p.product_id,p.product_name,p.category,SUM(p.price*oi.quantity) revenue
 FROM products p JOIN order_items oi ON p.product_id=oi.product_id
 JOIN orders o ON oi.order_id=o.order_id WHERE o.status='Completed'
 GROUP BY p.product_id,p.product_name,p.category
)
SELECT product_name,category,ROUND(revenue,2) revenue,
RANK() OVER(ORDER BY revenue DESC) revenue_rank
FROM product_revenue ORDER BY revenue_rank;

-- Rank within category
WITH product_revenue AS (
 SELECT p.product_id,p.product_name,p.category,SUM(p.price*oi.quantity) revenue
 FROM products p JOIN order_items oi ON p.product_id=oi.product_id
 JOIN orders o ON oi.order_id=o.order_id WHERE o.status='Completed'
 GROUP BY p.product_id,p.product_name,p.category
)
SELECT product_name,category,ROUND(revenue,2) revenue,
RANK() OVER(PARTITION BY category ORDER BY revenue DESC) category_rank
FROM product_revenue ORDER BY category,category_rank;

-- Latest order per customer
WITH ranked_orders AS (
 SELECT c.customer_name,o.order_id,o.order_date,o.status,
 ROW_NUMBER() OVER(PARTITION BY c.customer_id ORDER BY o.order_date DESC) rn
 FROM customers c LEFT JOIN orders o ON c.customer_id=o.customer_id
)
SELECT customer_name,order_id,order_date,status FROM ranked_orders WHERE rn=1;

-- Month over month revenue
WITH monthly_sales AS (
 SELECT DATE_FORMAT(o.order_date,'%Y-%m') sales_month,
 SUM(p.price*oi.quantity) revenue
 FROM orders o JOIN order_items oi ON o.order_id=oi.order_id
 JOIN products p ON oi.product_id=p.product_id WHERE o.status='Completed'
 GROUP BY DATE_FORMAT(o.order_date,'%Y-%m')
)
SELECT sales_month,ROUND(revenue,2) revenue,
ROUND(LAG(revenue) OVER(ORDER BY sales_month),2) previous_month_revenue,
ROUND(revenue-LAG(revenue) OVER(ORDER BY sales_month),2) revenue_change
FROM monthly_sales ORDER BY sales_month;

-- High-value orders
WITH order_totals AS (
 SELECT o.order_id,c.customer_name,SUM(p.price*oi.quantity) order_total
 FROM orders o JOIN customers c ON o.customer_id=c.customer_id
 JOIN order_items oi ON o.order_id=oi.order_id JOIN products p ON oi.product_id=p.product_id
 WHERE o.status='Completed' GROUP BY o.order_id,c.customer_name
)
SELECT * FROM order_totals WHERE order_total>7000 ORDER BY order_total DESC;

-- Category contribution
WITH category_sales AS (
 SELECT p.category,SUM(p.price*oi.quantity) revenue
 FROM products p JOIN order_items oi ON p.product_id=oi.product_id
 JOIN orders o ON oi.order_id=o.order_id WHERE o.status='Completed'
 GROUP BY p.category
)
SELECT category,ROUND(revenue,2) revenue,
ROUND(revenue*100/SUM(revenue) OVER(),2) revenue_percentage
FROM category_sales ORDER BY revenue DESC;

-- Customer frequency
SELECT c.customer_name,COUNT(o.order_id) order_count,
CASE WHEN COUNT(o.order_id)>=3 THEN 'Frequent Customer'
WHEN COUNT(o.order_id)=2 THEN 'Repeat Customer'
ELSE 'One-Time Customer' END customer_type
FROM customers c LEFT JOIN orders o
ON c.customer_id=o.customer_id AND o.status='Completed'
GROUP BY c.customer_id,c.customer_name ORDER BY order_count DESC;
