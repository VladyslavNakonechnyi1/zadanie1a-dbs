WITH OrderDates AS (
    SELECT DISTINCT
        c.customer_id,
        c.customer_name,
        MAX(o.order_darte) OVER (PARTITION BY c.customer_id) AS last_order_date,
        MAX(o.order_darte) OVER () AS latest_order_date
    FROM 
        customers c
    JOIN 
        orders o ON c.customer_id = o.customer_id
)
SELECT 
    customer_id,
    customer_name,
    last_order_date
FROM 
    OrderDates
WHERE 
    last_order_date < latest_order_date - INTERVAL '90 days'
ORDER BY 
    last_order_date ASC;