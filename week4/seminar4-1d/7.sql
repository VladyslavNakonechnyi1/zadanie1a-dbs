WITH MonthlySales AS (
    SELECT 
        DATE_TRUNC('month', order_darte)::DATE AS month,
        SUM(sales) AS monthly_sales
    FROM 
        orders
    GROUP BY 
        DATE_TRUNC('month', order_darte)::DATE
),
SalesWithPrevious AS (
    SELECT 
        month,
        monthly_sales,
        LAG(monthly_sales) OVER (ORDER BY month ASC) AS prev_month_sales
    FROM 
        MonthlySales
)
SELECT 
    month,
    monthly_sales,
    prev_month_sales,
    (monthly_sales - prev_month_sales) AS sales_change,
    ROUND(
        ((monthly_sales - prev_month_sales) / prev_month_sales) * 100.0, 
        2
    ) AS growth_percentage
FROM 
    SalesWithPrevious
ORDER BY 
    month ASC;