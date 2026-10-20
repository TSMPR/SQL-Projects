USE retail_sales_inventory;

CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_cost DECIMAL(10,2) NOT NULL,
    selling_price DECIMAL(10,2) NOT NULL,
    reorder_level INT NOT NULL DEFAULT 10,
    CHECK (unit_cost >= 0),
    CHECK (selling_price >= 0),
    CHECK (reorder_level >= 0)
);

CREATE TABLE IF NOT EXISTS inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT NOT NULL,
    warehouse VARCHAR(50) NOT NULL,
    stock_quantity INT NOT NULL,
    last_updated DATE NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    CHECK (stock_quantity >= 0),
    UNIQUE (product_id, warehouse)
);

-- One row per product line in an order
CREATE TABLE IF NOT EXISTS sales (
    sale_id INT PRIMARY KEY,
    order_id VARCHAR(20) NOT NULL,
    sale_date DATE NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    CHECK (quantity > 0),
    CHECK (unit_price >= 0)
);

CREATE INDEX idx_sales_date ON sales(sale_date);
CREATE INDEX idx_sales_product ON sales(product_id);
