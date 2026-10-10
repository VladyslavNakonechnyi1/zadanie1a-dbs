CREATE INDEX IF NOT EXISTS idx_orders_order_date ON orders (order_darte);
SELECT 
    DATE_TRUNC('month', order_darte) AS month,
    SUM(sales) AS sum
FROM 
    orders
GROUP BY 
    DATE_TRUNC('month', order_darte)
ORDER BY 
    month ASC;