-- ============================================
-- 01_data_discovery.sql
-- Purpose: Profile the orders table to 
-- understand structure, quality and ranges
-- Author: Mian Manan Ali Shahid
-- ============================================

USE superstore;

-- 1. Row count
SELECT COUNT(*) AS total_rows 
FROM orders;

-- 2. Date range
SELECT 
    MIN(order_date_clean) AS earliest_order,
    MAX(order_date_clean) AS latest_order
FROM orders;

-- 3. Check for missing values
SELECT
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS missing_order_id,
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS missing_order_date,
    SUM(CASE WHEN ship_date IS NULL THEN 1 ELSE 0 END) AS missing_ship_date,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS missing_customer_id,
    SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS missing_region,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS missing_category,
    SUM(CASE WHEN sales IS NULL THEN 1 ELSE 0 END) AS missing_sales,
    SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END) AS missing_profit,
    SUM(CASE WHEN discount IS NULL THEN 1 ELSE 0 END) AS missing_discount
FROM orders;

-- 4. Initial duplicate check (by order_id + product_id)
SELECT 
    order_id, 
    product_id, 
    COUNT(*) AS occurrences
FROM orders
GROUP BY order_id, product_id
HAVING COUNT(*) > 1;

-- 5. True duplicate check (by ALL columns)
-- Only rows where every value is identical are true duplicates
SELECT 
    order_id,
    product_id,
    sales,
    quantity,
    discount,
    profit,
    COUNT(*) AS occurrences
FROM orders
GROUP BY 
    order_id,
    product_id,
    sales,
    quantity,
    discount,
    profit
HAVING COUNT(*) > 1;

-- 6. Basic stats for key columns
SELECT
    ROUND(MIN(sales), 2) AS min_sales,
    ROUND(MAX(sales), 2) AS max_sales,
    ROUND(AVG(sales), 2) AS avg_sales,
    ROUND(MIN(profit), 2) AS min_profit,
    ROUND(MAX(profit), 2) AS max_profit,
    ROUND(AVG(profit), 2) AS avg_profit,
    ROUND(MIN(discount), 2) AS min_discount,
    ROUND(MAX(discount), 2) AS max_discount,
    ROUND(AVG(discount), 2) AS avg_discount,
    MIN(quantity) AS min_quantity,
    MAX(quantity) AS max_quantity,
    ROUND(AVG(quantity), 2) AS avg_quantity
FROM orders;

-- 7. Distinct values in key dimensions
SELECT 
    COUNT(DISTINCT region) AS regions,
    COUNT(DISTINCT category) AS categories,
    COUNT(DISTINCT sub_category) AS sub_categories,
    COUNT(DISTINCT segment) AS segments,
    COUNT(DISTINCT country) AS countries
FROM orders;

-- 8. List all regions
SELECT DISTINCT region FROM orders;

-- 9. List all categories
SELECT DISTINCT category FROM orders;

-- 10. List all segments
SELECT DISTINCT segment FROM orders;

-- 11. Discount distribution
SELECT DISTINCT discount 
FROM orders 
ORDER BY discount DESC;
