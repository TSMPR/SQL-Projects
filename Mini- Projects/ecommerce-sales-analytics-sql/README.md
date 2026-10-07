# E-Commerce Sales Analytics using SQL

A MySQL project analyzing e-commerce sales, customers, products, orders, and payments.

## Objectives
- Analyze total and monthly revenue
- Identify top products and categories
- Find high-value and repeat customers
- Calculate average order value
- Demonstrate joins, aggregations, subqueries, CTEs and window functions

## Technology
MySQL 8+, SQL, MySQL Workbench, Git/GitHub

## Schema
customers -> orders -> order_items -> products
orders -> payments

## Project Structure
```text
database/
  01_create_database.sql
  02_create_tables.sql
  03_insert_data.sql
queries/
  01_basic_queries.sql
  02_sales_analysis.sql
  03_customer_analysis.sql
  04_product_analysis.sql
  05_advanced_queries.sql
results/screenshots/
docs/project_overview.md
README.md
```

## SQL Concepts
SELECT, WHERE, ORDER BY, GROUP BY, HAVING, JOINs, aggregates, subqueries, CTEs, CASE, RANK, ROW_NUMBER, LAG and window aggregates.

## How to Run
Run the three files in `database/` in order, then execute the query files in `queries/`.

## Business Questions
What is total revenue? Which months and categories perform best? Who are the top customers? Which products sell most? Which customers are repeat buyers? How does revenue change month over month?

## Future Improvements
Add a Power BI/Tableau dashboard, inventory analysis, discounts and Python automation.
