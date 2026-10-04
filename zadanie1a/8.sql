SELECT 
    customers.customer_name, 
    COUNT(orders.order_id) AS number_of_orders
FROM 
    customers
LEFT JOIN 
    orders ON customers.customer_id = orders.customer_id
GROUP BY 
    customers.customer_name;