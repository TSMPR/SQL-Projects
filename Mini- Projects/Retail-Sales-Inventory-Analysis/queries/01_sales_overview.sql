USE retail_sales_inventory;

-- Overall sales KPIs
SELECT COUNT(DISTINCT order_id) AS total_orders,
       SUM(quantity) AS units_sold,
       ROUND(SUM(quantity * unit_price), 2) AS total_revenue,
       ROUND(SUM(quantity * unit_price) / COUNT(DISTINCT order_id), 2) AS average_order_value
FROM sales;

-- Monthly sales summary
SELECT DATE_FORMAT(sale_date, '%Y-%m') AS sales_month,
       COUNT(DISTINCT order_id) AS total_orders,
       SUM(quantity) AS units_sold,
       ROUND(SUM(quantity * unit_price), 2) AS revenue
FROM sales
GROUP BY DATE_FORMAT(sale_date, '%Y-%m')
ORDER BY sales_month;

-- Daily revenue
SELECT sale_date, COUNT(DISTINCT order_id) AS orders,
       ROUND(SUM(quantity * unit_price), 2) AS daily_revenue
FROM sales
GROUP BY sale_date
ORDER BY sale_date;
