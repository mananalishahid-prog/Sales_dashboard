# KPI Findings

## Overview
This document summarizes the key business insights derived 
from the KPI calculations in 03_kpi_calculations.sql.
Company average profit margin benchmark: **12.47%**

## 1. Regional Performance

| Region | Orders | Sales | Profit | Margin | vs Benchmark |
|--------|--------|-------|--------|--------|--------------|
| West | 1,611 | $725,457 | $108,418 | 14.94% | ✅ +2.47% |
| East | 1,401 | $678,499 | $91,534 | 13.49% | ✅ +1.02% |
| South | 822 | $391,721 | $46,749 | 11.93% | 🔴 -0.54% |
| Central | 1,175 | $501,239 | $39,706 | 7.92% | 🔴 -4.55% |

### Key Finding
Central region is significantly underperforming; 4.55% below 
company average. Investigation revealed this is driven by 
excessive discounting (see Section 3).

---

## 2. Time Based Analysis

### Yearly Performance
| Year | Orders | Sales | Profit | Margin |
|------|--------|-------|--------|--------|
| 2014 | 969 | $483,966 | $49,556 | 10.24% |
| 2015 | 1,038 | $470,532 | $61,618 | 13.10% |
| 2016 | 1,315 | $609,205 | $81,795 | 13.43% |
| 2017 | 1,687 | $733,215 | $93,439 | 12.74% |

### Key Findings
- Sales grew 51% over 4 years; strong business growth
- Profit margin recovered strongly from weak 2014 (10.24%)
- 2017 shows slight margin dip despite record sales; worth monitoring

### Quarterly Pattern
- Q4 is consistently the strongest quarter every year
- Q1 is consistently the weakest quarter every year
- Q4 2017 is a red flag, record sales of $280K but worst 
  Q4 margin ever at 9.80%, suggests heavy discounting 
  to drive volume

---

## 3. Discount Impact Analysis

### Key Finding — Discount Tipping Point
Any discount above 20% results in negative or near-zero profit.
Any discount above 30% results in guaranteed losses.

| Discount Level | Margin | Verdict |
|----------------|--------|---------|
| 0% | 29.51% | ✅ Excellent |
| 10% | 16.61% | ✅ Good |
| 20% | 11.82% | ✅ Acceptable |
| 30% | -10.06% | 🔴 Loss making |
| 50% | -34.80% | 🔴 Loss making |
| 80% | -180.03% | 🔴 Catastrophic |

### Discount by Region
| Region | Avg Discount | Margin | Orders Above 30% |
|--------|-------------|--------|-----------------|
| Central | 24.04% | 7.92% | 643 |
| South | 14.73% | 11.93% | 171 |
| East | 14.53% | 13.49% | 460 |
| West | 10.93% | 14.94% | 118 |

### Key Finding
Central region has more than double the average discount 
of West region and 643 orders above the 30% loss threshold. 
This directly explains Central's poor profit margin.

---

## 4. Category Performance

### By Category
| Category | Sales | Profit | Margin | Avg Discount |
|----------|-------|--------|--------|--------------|
| Technology | $836K | $145K | 17.40% | 13.23% |
| Furniture | $741K | $18K | 2.49% | 17.39% |
| Office Supplies | $719K | $122K | 17.04% | 15.73% |

### Key Finding
Furniture generates $741K in sales but only $18K profit,  
a margin of just 2.49%. Technology and Office Supplies both 
deliver strong margins above 17%.

### Loss Making Sub-Categories
| Sub-Category | Sales | Profit | Margin | Avg Discount |
|--------------|-------|--------|--------|--------------|
| Tables | $206K | -$17,725 | -8.56% | 26.13% |
| Bookcases | $114K | -$3,472 | -3.02% | 21.11% |
| Supplies | $46K | -$1,189 | -2.55% | 7.68% |

### Top Performing Sub-Categories
| Sub-Category | Profit | Margin |
|--------------|--------|--------|
| Copiers | $55,617 | 37.20% |
| Phones | $44,515 | 13.49% |
| Accessories | $41,936 | 25.05% |
| Paper | $34,053 | 43.39% |

### Key Finding
Tables is the single biggest loss maker, $206K in sales 
but losing $17,725. Driven by 26% average discount, 
above the 20% safe threshold.

---

## 5. Customer Segment Performance

| Segment | Orders | Sales | Profit | Margin | Avg Discount |
|---------|--------|-------|--------|--------|--------------|
| Consumer | 2,586 | $1.16M | $134K | 11.55% | 15.81% |
| Corporate | 1,514 | $706K | $91K | 13.03% | 15.82% |
| Home Office | 909 | $429K | $60K | 14.05% | 14.70% |

### Key Finding
Home Office is the most efficient segment despite lowest 
volume, highest margin at 14.05% and lowest average 
discount at 14.70%. Consumer segment is below company 
average despite generating the most orders and sales.

---

## Summary of Key Insights

1. **Central region needs urgent attention**:  7.92% margin 
   driven by excessive discounting. 643 orders above the 
   30% loss threshold.

2. **Discount policy needs review**: anything above 20% 
   significantly hurts margins. Above 30% guarantees losses.

3. **Tables sub-category is actively losing money**: 
   $17,725 in losses despite $206K in sales.

4. **Business is growing strongly**: 51% sales growth 
   over 4 years but margin needs protecting.

5. **Q4 2017 margin collapse**: record sales but worst 
   Q4 margin ever suggests unsustainable discounting 
   to hit volume targets.

6. **Home Office and Copiers are hidden gems**: high 
   margins, low discounts, worth prioritizing.
