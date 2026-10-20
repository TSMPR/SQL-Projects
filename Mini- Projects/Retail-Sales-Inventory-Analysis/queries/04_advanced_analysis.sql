USE retail_sales_inventory;

-- Rank products by revenue using a CTE and window function
WITH product_revenue AS (
    SELECT p.product_id, p.product_name, p.category,
           SUM(s.quantity * s.unit_price) AS revenue
    FROM products p JOIN sales s ON p.product_id = s.product_id
    GROUP BY p.product_id, p.product_name, p.category
)
SELECT product_name, category, ROUND(revenue, 2) AS revenue,
       DENSE_RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM product_revenue
ORDER BY revenue_rank, product_name;

-- Month-over-month revenue comparison
WITH monthly_sales AS (
    SELECT DATE_FORMAT(sale_date, '%Y-%m') AS sales_month,
           SUM(quantity * unit_price) AS revenue
    FROM sales
    GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
),
monthly_comparison AS (
    SELECT sales_month, revenue,
           LAG(revenue) OVER (ORDER BY sales_month) AS previous_month_revenue
    FROM monthly_sales
)
SELECT sales_month, ROUND(revenue, 2) AS revenue,
       ROUND(previous_month_revenue, 2) AS previous_month_revenue,
       ROUND(revenue - previous_month_revenue, 2) AS revenue_change,
       CASE
           WHEN previous_month_revenue IS NULL THEN 'First month'
           WHEN revenue > previous_month_revenue THEN 'Increased'
           WHEN revenue < previous_month_revenue THEN 'Decreased'
           ELSE 'No change'
       END AS trend
FROM monthly_comparison
ORDER BY sales_month;

-- Products contributing over 10% of revenue
WITH product_revenue AS (
    SELECT p.product_id, p.product_name, SUM(s.quantity * s.unit_price) AS revenue
    FROM products p JOIN sales s ON p.product_id = s.product_id
    GROUP BY p.product_id, p.product_name
),
total_revenue AS (
    SELECT SUM(quantity * unit_price) AS all_revenue FROM sales
)
SELECT pr.product_name, ROUND(pr.revenue, 2) AS revenue,
       ROUND(100 * pr.revenue / tr.all_revenue, 2) AS revenue_percentage
FROM product_revenue pr CROSS JOIN total_revenue tr
WHERE pr.revenue / tr.all_revenue > 0.10
ORDER BY revenue_percentage DESC;

-- Average units per order by category
SELECT p.category,
       ROUND(SUM(s.quantity) / COUNT(DISTINCT s.order_id), 2) AS units_per_order
FROM products p JOIN sales s ON p.product_id = s.product_id
GROUP BY p.category
ORDER BY units_per_order DESC;
