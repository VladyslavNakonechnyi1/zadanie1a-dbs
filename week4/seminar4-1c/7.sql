WITH MonthlySales AS (
    SELECT 
        country,
        DATE_TRUNC('month', invoice_date)::DATE AS month,
        SUM(quantity * unit_price) AS total_amount
    FROM 
        retail_sales
    GROUP BY 
        country,
        DATE_TRUNC('month', invoice_date)::DATE
)
SELECT 
    country,
    month,
    total_amount,
    NTILE(4) OVER (PARTITION BY country ORDER BY total_amount DESC) AS sales_quartile
FROM 
    MonthlySales
ORDER BY 
    country ASC, 
    month ASC;