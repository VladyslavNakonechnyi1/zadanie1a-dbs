SELECT 
    products.category, 
    AVG(orders.discount) AS average_discount
FROM 
    products
JOIN 
    orders ON products.product_id = orders.product_id
GROUP BY 
    products.category;