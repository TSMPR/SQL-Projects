# Retail Sales & Inventory Analysis

A MySQL 8+ portfolio project analyzing fictional retail sales, product performance, profitability, and stock risks.

## Business questions
- What are total revenue, orders, units sold, and average order value?
- Which products/categories generate the most revenue and estimated gross profit?
- Which products need replenishment?
- Which products have high stock relative to sample sales?
- How does revenue change month over month?

## Setup
Run these files in order in MySQL Workbench:
1. `database/01_create_database.sql`
2. `database/02_create_tables.sql`
3. `database/03_insert_sample_data.sql`
4. Run query files in `queries/`.

## Structure
- `database/`: database, tables, sample data
- `queries/`: sales overview, product performance, inventory, advanced analysis
- `docs/`: project overview and assumptions
- `results/screenshots/`: add your query-result screenshots here

## Skills demonstrated
SELECT, WHERE, ORDER BY, aggregate functions, GROUP BY, HAVING, JOIN, CASE, CTEs, subqueries, window functions (`LAG`, `DENSE_RANK`).

## Assumptions and limitations
- The dataset is fictional and designed for practice.
- Each sales row is one product line within an order.
- Revenue = quantity × unit price.
- Estimated gross profit = quantity × (transaction unit price − product unit cost). It excludes tax, shipping, discounts, returns, and operating expenses.
- Inventory is a current snapshot, not historical stock at each sale date.
- High-stock/low-sales checks are simple screening rules, not forecasts.

## Suggested GitHub description
Retail sales and inventory analysis using MySQL, covering revenue trends, product profitability, stock monitoring, and replenishment insights.
