# Customer Support Ticket Analysis

A MySQL 8+ portfolio project using fictional support data to study ticket volume, resolution times, agent workload, customer satisfaction, and unresolved backlogs.

## Business questions
- How many tickets are open, active, resolved, or closed?
- Which channels, priorities, and issue categories receive the most tickets?
- What are average first-response and resolution times?
- How does agent workload and customer satisfaction vary?
- How does ticket volume change monthly?

## Run in MySQL Workbench
1. Run `database/01_create_database.sql`
2. Run `database/02_create_tables.sql`
3. Run `database/03_insert_sample_data.sql` once
4. Execute the SQL files under `queries/`

## Structure
`database/` setup and sample data · `queries/` analysis · `docs/` project notes · `results/screenshots/` your result screenshots.

## SQL skills
Filtering, aggregates, `GROUP BY`, `HAVING`, joins, `CASE`, date/time functions, CTEs, `LAG()`, and `DENSE_RANK()`.

## Assumptions
All data is fictional. Resolution time is calculated only for tickets with `resolved_at`. Satisfaction averages include only tickets with feedback. Agent metrics are not definitive quality rankings because ticket complexity may differ.
