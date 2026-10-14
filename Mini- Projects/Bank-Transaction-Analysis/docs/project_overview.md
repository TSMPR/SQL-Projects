# Project Overview: Bank Transaction Analysis

## Scenario
A fictional retail bank wants to explore transaction patterns, account activity, and customer account ownership.

## Tables
| Table | Purpose |
|---|---|
| `customers` | Fictional customer details and join dates |
| `accounts` | Account type, opening date, and status |
| `transactions` | Transaction type, amount, date, channel, and description |

## Concepts practiced
- `CREATE TABLE`, primary keys, foreign keys, constraints
- `SELECT`, `WHERE`, `ORDER BY`
- `COUNT`, `SUM`, `AVG`, `GROUP BY`, `HAVING`
- `INNER JOIN`, `LEFT JOIN`
- `CASE`, scalar subqueries, CTEs, `DENSE_RANK()`

## Questions to answer
1. Which transaction type has the largest total amount?
2. Which channel has the highest average transaction value?
3. Which customers own multiple accounts?
4. Which accounts have the most recorded transactions?
5. Which transactions exceed the overall average?

## Limitations
Data is fictional and limited. Opening balances, interest, fees, full transfer-pair reconciliation, and fraud labels are not provided. Net transaction movement must not be described as a verified bank balance.
