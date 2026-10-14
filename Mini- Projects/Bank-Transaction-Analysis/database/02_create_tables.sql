USE bank_transaction_analysis;

DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS customers;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    city VARCHAR(80) NOT NULL,
    join_date DATE NOT NULL
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type ENUM('Savings', 'Current', 'Fixed Deposit') NOT NULL,
    opened_date DATE NOT NULL,
    account_status ENUM('Active', 'Inactive', 'Closed') NOT NULL DEFAULT 'Active',
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_date DATETIME NOT NULL,
    transaction_type ENUM('DEPOSIT', 'WITHDRAWAL', 'TRANSFER_IN', 'TRANSFER_OUT') NOT NULL,
    amount DECIMAL(12,2) NOT NULL,
    channel ENUM('ATM', 'Branch', 'Online', 'Mobile App', 'POS') NOT NULL,
    description VARCHAR(150),
    FOREIGN KEY (account_id) REFERENCES accounts(account_id),
    CHECK (amount > 0)
);

CREATE INDEX idx_transactions_date ON transactions(transaction_date);
CREATE INDEX idx_transactions_account ON transactions(account_id);
