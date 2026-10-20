USE retail_sales_inventory;

-- Flag stock below the product's reorder level
SELECT p.product_name, p.category, i.warehouse, i.stock_quantity, p.reorder_level,
       CASE
           WHEN i.stock_quantity = 0 THEN 'Out of stock'
           WHEN i.stock_quantity <= p.reorder_level THEN 'Reorder now'
           ELSE 'Stock sufficient'
       END AS stock_status
FROM products p JOIN inventory i ON p.product_id = i.product_id
ORDER BY CASE
             WHEN i.stock_quantity = 0 THEN 1
             WHEN i.stock_quantity <= p.reorder_level THEN 2
             ELSE 3
         END,
         i.stock_quantity;

-- Suggested replenishment to reach twice the reorder level
SELECT p.product_name, i.stock_quantity, p.reorder_level,
       GREATEST((2 * p.reorder_level) - i.stock_quantity, 0) AS suggested_replenishment
FROM products p JOIN inventory i ON p.product_id = i.product_id
WHERE i.stock_quantity <= p.reorder_level
ORDER BY suggested_replenishment DESC;

-- Simple high-stock vs sample-sales screening
SELECT p.product_name, i.stock_quantity,
       COALESCE(SUM(s.quantity), 0) AS units_sold_in_sample,
       CASE
           WHEN COALESCE(SUM(s.quantity), 0) = 0 THEN 'No recorded sales'
           WHEN i.stock_quantity > 3 * SUM(s.quantity) THEN 'High stock relative to sample sales'
           ELSE 'Review normally'
       END AS inventory_observation
FROM products p
JOIN inventory i ON p.product_id = i.product_id
LEFT JOIN sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name, i.stock_quantity
ORDER BY i.stock_quantity DESC;

-- Inventory cost value by category
SELECT p.category, ROUND(SUM(i.stock_quantity * p.unit_cost), 2) AS inventory_cost_value
FROM products p JOIN inventory i ON p.product_id = i.product_id
GROUP BY p.category
ORDER BY inventory_cost_value DESC;
