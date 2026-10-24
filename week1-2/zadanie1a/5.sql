SELECT 
    products.product_name, 
    SUM(orders.sales) AS total_sales
FROM 
    products
LEFT JOIN 
    orders ON products.product_id = orders.product_id
GROUP BY 
    products.product_name;