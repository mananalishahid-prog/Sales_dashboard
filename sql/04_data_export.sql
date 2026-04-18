-- ============================================
-- 04_data_export.sql
-- Purpose: Export clean dataset for Power BI
-- Author: Mian Manan Ali Shahid
-- ============================================

USE superstore;

-- Export clean orders table for Power BI connection
-- Excludes: row_id, customer_name (sensitive)
-- Includes: clean date columns instead of original text dates
-- Final row count: 9,993

SELECT 
    order_id,
    order_date_clean AS order_date,
    ship_date_clean AS ship_date,
    ship_mode,
    customer_id,
    segment,
    country,
    city,
    state,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit
FROM orders;