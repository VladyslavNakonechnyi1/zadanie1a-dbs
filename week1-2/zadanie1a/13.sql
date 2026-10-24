SELECT 
    customers.customer_name,
    SUM(orders.sales) AS total_sales,
    AVG(orders.discount) AS average_discount,
    COUNT(orders.order_id) AS number_of_orders,
    CASE 
        WHEN SUM(orders.sales) > 2500 THEN 'VIP'
        ELSE 'REGULAR'
    END AS customer_type
FROM 
    customers
LEFT JOIN 
    orders ON customers.customer_id = orders.customer_id
GROUP BY 
    customers.customer_name
ORDER BY 
    total_sales DESC;