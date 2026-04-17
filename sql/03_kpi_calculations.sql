-- ============================================
-- 03_kpi_calculations.sql
-- Purpose: Calculate KPIs to answer business
-- questions from stakeholders
-- Author: Mian Manan Ali Shahid
-- ============================================

USE superstore;

-- ============================================
-- SECTION 1: REGIONAL PERFORMANCE
-- ============================================

-- 1.1 Total Sales, Profit and Orders by Region
SELECT
    region,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM orders
GROUP BY region
ORDER BY total_sales DESC;


-- 1.2 Company average profit margin (benchmark)
SELECT
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS company_avg_margin
FROM orders;


-- ============================================
-- SECTION 2: TIME BASED ANALYSIS
-- ============================================

-- 2.1 Yearly performance
SELECT
    YEAR(order_date_clean) AS year,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM orders
GROUP BY YEAR(order_date_clean)
ORDER BY year ASC;


-- 2.2 Quarterly performance
SELECT
    YEAR(order_date_clean) AS year,
    QUARTER(order_date_clean) AS quarter,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM orders
GROUP BY YEAR(order_date_clean), QUARTER(order_date_clean)
ORDER BY year ASC, quarter ASC;


-- ============================================
-- SECTION 3: DISCOUNT IMPACT ANALYSIS
-- ============================================

-- 3.1 Profit margin by discount level
SELECT
    discount,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct
FROM orders
GROUP BY discount
ORDER BY discount ASC;


-- 3.2 Discount impact by region
SELECT
    region,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_pct,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct,
    SUM(CASE WHEN discount >= 0.3 THEN 1 ELSE 0 END) AS orders_above_30pct_discount
FROM orders
GROUP BY region
ORDER BY avg_discount_pct DESC;


-- ============================================
-- SECTION 4: CATEGORY PERFORMANCE
-- ============================================

-- 4.1 Sales and Profit by Category
SELECT
    category,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_pct
FROM orders
GROUP BY category
ORDER BY total_sales DESC;


-- 4.2 Sales and Profit by Sub-Category
SELECT
    category,
    sub_category,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_pct
FROM orders
GROUP BY category, sub_category
ORDER BY total_profit ASC;


-- ============================================
-- SECTION 5: CUSTOMER SEGMENT PERFORMANCE
-- ============================================

-- 5.1 Sales and Profit by Segment
SELECT
    segment,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_pct,
    ROUND(AVG(discount) * 100, 2) AS avg_discount_pct
FROM orders
GROUP BY segment
ORDER BY total_profit DESC;