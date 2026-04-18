# Data Discovery

## Dataset
- **Source:** Kaggle - Superstore Dataset
- **Link:** https://www.kaggle.com/datasets/vivek468/superstore-dataset-final
- **File:** Sample - Superstore.csv
- **Tool Used:** MySQL Workbench

## Basic Information
| Property | Value |
|----------|-------|
| Rows | 9,994 |
| Columns | 21 |
| Earliest Order Date | January 3, 2014 |
| Latest Order Date | December 30, 2017 |
| Missing Values | None |
| Duplicate Rows | 1 true duplicate found and removed |

## Columns & Description
| Column Name | Description | Data Type | Issues |
|-------------|-------------|-----------|--------|
| Row ID | Unique ID for each row | INT | None |
| Order ID | Unique ID for each order | VARCHAR | None |
| Order Date | Date order was placed | VARCHAR | ⚠️ Stored as text, converted to DATE |
| Ship Date | Date order was shipped | VARCHAR | ⚠️ Stored as text, converted to DATE |
| Ship Mode | Shipping mode chosen | VARCHAR | None |
| Customer ID | Unique customer identifier | VARCHAR | None |
| Customer Name | Name of the customer | VARCHAR | None |
| Segment | Customer segment | VARCHAR | None |
| Country | Customer country | VARCHAR | None |
| City | Customer city | VARCHAR | None |
| State | Customer state | VARCHAR | None |
| Postal Code | Customer postal code | VARCHAR | None |
| Region | Customer region | VARCHAR | None |
| Product ID | Unique product identifier | VARCHAR | None |
| Category | Product category | VARCHAR | None |
| Sub-Category | Product sub-category | VARCHAR | None |
| Product Name | Name of the product | VARCHAR | None |
| Sales | Sales amount | DECIMAL | ⚠️ Large range ($0.44 - $22,638) |
| Quantity | Quantity ordered | INT | None |
| Discount | Discount applied | DECIMAL | ⚠️ Goes up to 80% |
| Profit | Profit or loss | DECIMAL | ⚠️ Contains negative values |

## Key Statistics
| Metric | Min | Max | Avg |
|--------|-----|-----|-----|
| Sales | $0.44 | $22,638.48 | $229.86 |
| Profit | -$6,599.98 | $8,399.98 | $28.66 |
| Discount | 0% | 80% | 16% |
| Quantity | 1 | 14 | 3.79 |

## Dimensions
| Dimension | Count | Values |
|-----------|-------|--------|
| Regions | 4 | Central, East, South, West |
| Categories | 3 | Furniture, Office Supplies, Technology |
| Sub-Categories | 17 | Various |
| Segments | 3 | Consumer, Corporate, Home Office |
| Countries | 1 | United States |

## Issues Found
| Issue | Column | Action Taken |
|-------|--------|--------------|
| Wrong data type | Order Date | Converted from text to DATE using STR_TO_DATE() |
| Wrong data type | Ship Date | Converted from text to DATE using STR_TO_DATE() |
| Large value range | Sales | Noted, monitor for outliers in analysis |
| High discounts | Discount | To be investigated in cleaning phase |
| Negative values | Profit | Valid — indicates loss-making orders |

## Duplicate Investigation

### Step 1 - Initial Check
Queried order_id + product_id combinations appearing 
more than once. Found 8 pairs.

### Step 2 - Investigation
Ran a second query grouping by ALL columns to identify 
true duplicates where every value is identical.

### Result
- 7 pairs → Legitimate line items. Same product ordered 
  multiple times in same order with proportionally 
  different quantities, sales and profit values.
- 1 true duplicate → order_id US-2014-150119, 
  product_id FUR-CH-10002965. All values identical 
  across both rows.

### Action Taken
Deleted row_id 3407 (the duplicate entry). 
Kept row_id 3406 (the original entry).
Final row count after deletion: 9,993.

### Key Learning
Never delete duplicates based on 1-2 columns alone. 
Always confirm by checking ALL columns first to 
distinguish true duplicates from legitimate entries.

## Clean Dataset
Final cleaned dataset exported as superstore_clean.csv
Changes from original:
- order_date converted from text to DATE format
- ship_date converted from text to DATE format
- 1 duplicate row removed (row_id 3407)
- Sensitive columns removed (customer_name)
- Final row count: 9,993

## Summary
Data is in good shape overall. No missing values, no true 
duplicates after cleaning. Two date columns needed type 
conversion. Key areas to investigate further in cleaning 
phase: discount impact on profit and large sales outliers.
