USE bank_transaction_analysis;

-- 1. Count transactions by type
SELECT transaction_type, COUNT(*) AS transaction_count
FROM transactions
GROUP BY transaction_type
ORDER BY transaction_count DESC;

-- 2. Total amount by transaction type
SELECT transaction_type, SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_type
ORDER BY total_amount DESC;

-- 3. Average transaction amount by channel
SELECT channel, ROUND(AVG(amount), 2) AS average_amount, COUNT(*) AS transaction_count
FROM transactions
GROUP BY channel
ORDER BY average_amount DESC;

-- 4. Monthly totals by type
SELECT DATE_FORMAT(transaction_date, '%Y-%m') AS transaction_month,
       transaction_type, COUNT(*) AS transaction_count, SUM(amount) AS total_amount
FROM transactions
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m'), transaction_type
ORDER BY transaction_month, transaction_type;

-- 5. Categorize transaction amounts
SELECT transaction_id, transaction_type, amount,
       CASE WHEN amount >= 30000 THEN 'High Value'
            WHEN amount >= 10000 THEN 'Medium Value'
            ELSE 'Low Value' END AS transaction_size
FROM transactions
ORDER BY amount DESC;
