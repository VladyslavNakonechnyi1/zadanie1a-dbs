WITH FirstPurchases AS (
    SELECT 
        customer_id, 
        DATE_TRUNC('month', MIN(order_darte))::DATE AS first_purchase_month
    FROM 
        orders
    GROUP BY 
        customer_id
)
SELECT 
    COUNT(customer_id) AS returning_customers
FROM 
    FirstPurchases fp
WHERE 
    first_purchase_month = '2024-06-01'
    AND EXISTS (
        SELECT 1 
        FROM orders o 
        WHERE o.customer_id = fp.customer_id 
          AND DATE_TRUNC('month', o.order_darte)::DATE > fp.first_purchase_month
    );