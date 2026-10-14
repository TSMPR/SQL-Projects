# Bank Transaction Analysis (SQL Mini-Project)

A beginner-friendly MySQL project using fictional banking data. It practices table design, filtering, joins, aggregation, `CASE`, subqueries, CTEs, and window functions.

> All names, account numbers, and transactions are fictional and created for learning purposes.

## Project structure
```text
02-Bank-Transaction-Analysis/
├── README.md
├── database/
│   ├── 01_create_database.sql
│   ├── 02_create_tables.sql
│   └── 03_insert_sample_data.sql
├── queries/
│   ├── 01_basic_queries.sql
│   ├── 02_transaction_analysis.sql
│   ├── 03_customer_account_analysis.sql
│   └── 04_beginner_advanced_queries.sql
├── docs/project_overview.md
└── results/screenshots/.gitkeep
```

## Run in MySQL Workbench
1. Connect to your MySQL Server.
2. Open and execute `database/01_create_database.sql`.
3. Open and execute `database/02_create_tables.sql`.
4. Open and execute `database/03_insert_sample_data.sql`.
5. Execute query files from the `queries` folder.

Run scripts in numeric order. The sample-data script clears existing project rows before re-inserting the sample data.

## Tables
- `customers`: fictional customer details.
- `accounts`: account type, open date, and status.
- `transactions`: deposits, withdrawals, transfers, amount, date, and channel.

## Business questions
- Which transaction types have the highest total amounts?
- Which channels have the highest average transaction amount?
- Which customers have multiple accounts?
- Which accounts have the most transaction activity?
- Which transactions are above the overall average?

## Important calculation note
Net transaction movement treats deposits and transfers in as positive, and withdrawals and transfers out as negative. It is **not** a verified current bank balance because opening balances and complete transfer-pair reconciliation are not included.

## Skills
`SELECT`, `WHERE`, `ORDER BY`, `COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING`, `CASE`, `JOIN`, subqueries, CTEs, and `DENSE_RANK()`.
