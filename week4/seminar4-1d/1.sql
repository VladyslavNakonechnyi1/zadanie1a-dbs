WITH RankedOrders AS (
    SELECT 
        c.customer_name,
        o.order_id,
        o.order_darte,
        ROW_NUMBER() OVER (
            PARTITION BY o.customer_id 
            ORDER BY o.order_darte DESC
        ) AS order_rank
    FROM 
        orders o
    JOIN 
        customers c ON o.customer_id = c.customer_id
)
SELECT 
    customer_name,
    order_id,
    order_darte
FROM 
    RankedOrders
WHERE 
    order_rank <= 2
ORDER BY 
    customer_name ASC, 
    order_rank ASC;