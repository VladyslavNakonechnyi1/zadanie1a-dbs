SELECT 
    customers.customer_name, 
    orders.order_id, 
    orders.sales
FROM 
    customers
FULL JOIN 
    orders ON customers.customer_id = orders.customer_id;