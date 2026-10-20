# Project Overview

## Business context
A fictional retailer wants to understand sales results and current stock levels. SQL queries summarize transactions and flag products that may need replenishment or further inventory review.

## Tables
- `products`: product names, categories, unit cost, selling price, reorder level.
- `inventory`: current stock snapshot by product and warehouse.
- `sales`: order dates, order IDs, product IDs, quantities, and transaction unit prices.

## Analysis
1. Sales KPIs: orders, units sold, revenue, average order value.
2. Product/category performance: revenue, estimated gross profit.
3. Inventory: reorder flags, suggested replenishment, inventory cost value.
4. Advanced SQL: CTEs, `LAG()`, `DENSE_RANK()`, and revenue contribution.

## Limitations
The data is fictional and small. Inventory is a current snapshot rather than a dated stock ledger. High-stock flags are simple screening rules, not demand forecasts. Estimated gross profit excludes discounts, taxes, returns, shipping, and operating costs.
