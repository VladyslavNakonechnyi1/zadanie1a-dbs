CREATE OR REPLACE PROCEDURE apply_regional_discount(
    p_region_name VARCHAR, 
    p_discount_rate NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE orders
    SET sales = sales * (1 - p_discount_rate)
    FROM customers
    WHERE orders.customer_id = customers.customer_id
      AND customers.region = p_region_name;

    RAISE NOTICE 'Применена скидка % для региона %', p_discount_rate, p_region_name;
END;
$$;

CALL apply_regional_discount('West', 0.10);