USE bank_transaction_analysis;

-- 1. View all customers
SELECT * FROM customers;

-- 2. View all accounts
SELECT * FROM accounts;

-- 3. Latest transactions first
SELECT * FROM transactions ORDER BY transaction_date DESC;

-- 4. Count rows in each table
SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_accounts FROM accounts;
SELECT COUNT(*) AS total_transactions FROM transactions;

-- 5. Transactions greater than 5,000
SELECT transaction_id, account_id, transaction_type, amount, transaction_date
FROM transactions
WHERE amount > 5000
ORDER BY amount DESC;
