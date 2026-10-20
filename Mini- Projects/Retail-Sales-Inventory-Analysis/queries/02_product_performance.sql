USE retail_sales_inventory;

-- Revenue, units sold, and estimated gross profit by product
SELECT p.product_name, p.category,
       SUM(s.quantity) AS units_sold,
       ROUND(SUM(s.quantity * s.unit_price), 2) AS revenue,
       ROUND(SUM(s.quantity * (s.unit_price - p.unit_cost)), 2) AS estimated_gross_profit
FROM products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name, p.category
ORDER BY revenue DESC;

-- Category performance
SELECT p.category, SUM(s.quantity) AS units_sold,
       ROUND(SUM(s.quantity * s.unit_price), 2) AS revenue,
       ROUND(SUM(s.quantity * (s.unit_price - p.unit_cost)), 2) AS estimated_gross_profit
FROM products p
JOIN sales s ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY revenue DESC;

-- Products with revenue above 100
SELECT p.product_name, ROUND(SUM(s.quantity * s.unit_price), 2) AS revenue
FROM products p JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING SUM(s.quantity * s.unit_price) > 100
ORDER BY revenue DESC;

-- Products with no recorded sales
SELECT p.product_id, p.product_name
FROM products p LEFT JOIN sales s ON p.product_id = s.product_id
WHERE s.sale_id IS NULL;
