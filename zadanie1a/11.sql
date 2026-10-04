SELECT 
    customers.region, 
    SUM(orders.sales) AS total_sales,
    AVG(orders.discount) AS average_discount,
    COUNT(orders.order_id) AS number_of_orders
FROM 
    customers
JOIN 
    orders ON customers.customer_id = orders.customer_id
GROUP BY 
    customers.region;