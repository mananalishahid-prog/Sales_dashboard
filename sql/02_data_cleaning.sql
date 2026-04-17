-- ============================================
-- 02_data_cleaning.sql
-- Purpose: Fix data quality issues found 
-- during data discovery phase
-- Author: Mian Manan Ali Shahid
-- ============================================

USE superstore;

-- Issue 1: Convert date columns from text to DATE format
-- order_date and ship_date were stored as VARCHAR (M/D/YYYY)
-- Added two new clean date columns

ALTER TABLE orders 
ADD COLUMN order_date_clean DATE,
ADD COLUMN ship_date_clean DATE;

SET SQL_SAFE_UPDATES = 0;

UPDATE orders 
SET order_date_clean = STR_TO_DATE(order_date, '%m/%d/%Y'),
    ship_date_clean = STR_TO_DATE(ship_date, '%m/%d/%Y');

-- Verify date conversion
SELECT order_date, order_date_clean, ship_date, ship_date_clean
FROM orders
LIMIT 5;

-- Issue 2: Remove true duplicate row
-- order_id US-2014-150119 + product_id FUR-CH-10002965
-- appeared twice with identical values
-- Keeping row_id 3406, deleting row_id 3407

DELETE FROM orders
WHERE row_id = (
    SELECT max_row FROM (
        SELECT MAX(row_id) AS max_row
        FROM orders
        WHERE order_id = 'US-2014-150119'
        AND product_id = 'FUR-CH-10002965'
    ) AS subquery
);

-- Verify final row count after cleaning
-- Expected: 9,993
SELECT COUNT(*) AS total_rows FROM orders;
