USE bank_transaction_analysis;

-- 1. Customer and account details
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       c.city, a.account_id, a.account_type, a.account_status
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
ORDER BY c.customer_id, a.account_id;

-- 2. Number of accounts per customer
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       COUNT(a.account_id) AS number_of_accounts
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY number_of_accounts DESC, customer_name;

-- 3. Transaction activity per account
SELECT a.account_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       COUNT(t.transaction_id) AS transaction_count,
       COALESCE(SUM(t.amount), 0) AS total_transaction_amount
FROM accounts a
JOIN customers c ON a.customer_id = c.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id
GROUP BY a.account_id, c.first_name, c.last_name
ORDER BY transaction_count DESC, total_transaction_amount DESC;

-- 4. Customers with more than one account
SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       COUNT(a.account_id) AS number_of_accounts
FROM customers c
JOIN accounts a ON c.customer_id = a.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING COUNT(a.account_id) > 1;

-- 5. Account counts by type and status
SELECT account_type, account_status, COUNT(*) AS account_count
FROM accounts
GROUP BY account_type, account_status
ORDER BY account_type, account_status;
