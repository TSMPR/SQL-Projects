USE bank_transaction_analysis;

-- 1. Net transaction movement per account (not an actual current balance)
SELECT a.account_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       SUM(CASE WHEN t.transaction_type IN ('DEPOSIT', 'TRANSFER_IN') THEN t.amount
                WHEN t.transaction_type IN ('WITHDRAWAL', 'TRANSFER_OUT') THEN -t.amount
                ELSE 0 END) AS net_transaction_movement
FROM accounts a
JOIN customers c ON a.customer_id = c.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id
GROUP BY a.account_id, c.first_name, c.last_name
ORDER BY net_transaction_movement DESC;

-- 2. Transactions above the overall average amount
SELECT transaction_id, account_id, transaction_type, amount
FROM transactions
WHERE amount > (SELECT AVG(amount) FROM transactions)
ORDER BY amount DESC;

-- 3. CTE: summarize activity per account
WITH account_activity AS (
    SELECT account_id, COUNT(*) AS transaction_count, SUM(amount) AS total_amount
    FROM transactions
    GROUP BY account_id
)
SELECT a.account_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       aa.transaction_count, aa.total_amount
FROM account_activity aa
JOIN accounts a ON aa.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
ORDER BY aa.total_amount DESC;

-- 4. Rank transactions from largest to smallest
SELECT transaction_id, account_id, transaction_type, amount,
       DENSE_RANK() OVER (ORDER BY amount DESC) AS amount_rank
FROM transactions
ORDER BY amount DESC;
