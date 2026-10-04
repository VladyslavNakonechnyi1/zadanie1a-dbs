SELECT 
    customers.region,
    COUNT(CASE WHEN orders.sales > 1000 THEN 1 END) AS high_value_orders,
    COUNT(CASE WHEN orders.sales <= 1000 THEN 1 END) AS low_value_orders
FROM 
    customers
JOIN 
    orders ON customers.customer_id = orders.customer_id
GROUP BY 
    customers.region;