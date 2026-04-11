## Document Info
- **Status:** In Progress
- **Version:** 1.0
- **Created:** April 11, 2026
- **Author:** Mian Manan Ali Shahid

# Project Requirements

## Business Problem
"We need a dashboard to understand our sales and profitability 
performance. Regional managers want to know how their numbers 
look and where the gaps are."

## Stakeholders
| Name           | Role              |
|----------------|-------------------|
| TBD            | Sales Manager     |
| TBD            | Regional Managers |
| TBD            | Senior Executives |

## Requirements Summary

### In Scope
- US market only
- Last 4 years of data
- Time based trends with YoY and QoQ comparisons

### KPIs
| KPI                  | Priority   |
|----------------------|------------|
| Sales                | Must Have  |
| Profit               | Must Have  |
| Order Volume         | Must Have  |
| Discount Impact      | Must Have  |

### Dimensions & Filters
| Dimension            | Priority   |
|----------------------|------------|
| Region               | Must Have  |
| Product Category     | Must Have  |
| Product Sub-Category | Must Have  |
| Customer Segment     | Must Have  |
| Time Period          | Must Have  |
| Shipping Mode        | Exclude    |

### Dashboard Structure
| Page    | Name                        | Audience            |
|---------|-----------------------------|---------------------|
| Page 1  | Executive Summary           | Senior Executives   |
| Page 2  | Regional Breakdown          | Regional Managers   |
| Page 3  | Category & Discount Analysis| Regional Managers   |

### Out of Scope
- Shipping performance
- Shipping mode analysis
- Individual customer names
- Data older than 4 years

### Benchmarking Approach
- No hardcoded targets exist
- Company averages will be used as benchmarks
- Regions and categories will be compared against averages

## Questions for Stakeholder

### Q1: What time frame are you looking for?
**Question asked:** "Are you looking for a snapshot of current 
performance, or would you like to see trends over time to compare 
against previous periods?"

**Manager's response:** "Both, I want to see where we are today 
but also whether we're improving or declining compared to last 
year. Regional managers will ask if we're doing better than last 
quarter so we need that context."

**My Interpretation:** Dashboard will need time-based trends, 
year-over-year and quarter-over-quarter comparisons, and a 
time period slicer.

### Q2: What dimensions should we analyze beyond region?
**Question asked:** "Besides the regional breakdown, would you 
like to analyze performance by any other dimensions, such as 
product category, customer segment, or shipping mode?"

**Manager's response:** "Yes, product category and sub-category 
for sure. We need to know which product lines are actually 
making us money. Customer segment would be good too. 
Shipping mode isn't a priority right now."

**My Interpretation:** Dashboard must include breakdowns by Product 
Category, Sub-Category, and Customer Segment. Shipping Mode 
will be excluded from this version.

### Q3: Are there any additional KPIs to track?
**Question asked:** "We'll be tracking Sales and Profitability 
across regions and product categories. Are there any additional 
KPIs you'd like to monitor; such as order volume, discount 
impact, or shipping performance?"

**Manager's response:** "Yes, order volume so we know how busy 
each region is. Discount impact would be really valuable,
sometimes we suspect we're discounting too heavily and it's 
eating into our profit. Shipping performance we can skip 
for now."

**My Interpretation:** Add Order Volume (Quantity) and Discount 
Impact on Profit as must-have KPIs. Shipping performance 
excluded from this version.

### Q4: Do we have any targets to measure against?
**Question asked:** "Do we have any sales or profit targets set 
for each region or category that we should be measuring our 
actual performance against?"

**Manager's response:** "We don't have any formally defined 
targets right now. But I'd like to see how each region and 
category is performing relative to the company average. If the 
company average profit margin is 15%, I want to see which 
regions are above and which are below that."

**My Interpretation:** No hardcoded targets exist. Will instead 
calculate company averages as benchmarks and compare regions 
and categories against those averages to surface outliers.

### Q5: Who are the primary users of this dashboard?
**Question asked:** "Who will be the primary users of this 
dashboard; will regional managers be accessing it themselves, 
or will this be presented to them in meetings?"

**Manager's response:** "Both, regional managers will have 
direct access day to day, and it will also be presented in 
monthly leadership meetings to senior executives. It needs to 
be simple enough for self-service but polished enough for 
executive presentations."

**My Interpretation:** Dashboard needs two layers; a clean 
executive summary page for leadership meetings and detailed 
drill-down pages for regional managers to self-serve. Avoid 
technical jargon in labels. Design and visual polish matters.

### Q6: What is the expected timeline?
**Question asked:** "What is the expected timeline for this 
dashboard, is there a specific deadline or presentation date 
I should be working towards?"

**Manager's response:** "Monthly leadership meeting is in 3 
weeks. First draft needed by end of next week covering core 
KPIs and regional breakdown. We'll refine from there before 
the final presentation."

**My Interpretation:** Project will run in phases:
- Week 1: First draft; core KPIs and regional breakdown
- Week 2: Revisions based on manager feedback
- Week 3: Final polish before leadership meeting

### Q7: Are there any constraints or out of scope items?
**Question asked:** "Is there anything that's explicitly out of 
scope or any data limitations I should be aware of before 
I start?"

**Manager's response:** "We only care about the US market. 
Data should be filtered to the last 4 years only as leadership 
is not interested in older data. Individual customer names are 
sensitive and should not be surfaced, keep it at segment 
level."

**My Interpretation:** 
- Filter dataset to US market only
- Filter to last 4 years of data in SQL
- No individual customer names in visuals
- Customer Segment to be used instead of Customer Name



## Deliverables & Timeline
- **Deliverable:** Interactive Power BI Dashboard
  (3 pages: Executive Summary, Regional Breakdown, 
  Category & Discount Analysis)
- **Week 1:** First draft — core KPIs and regional breakdown
- **Week 2:** Revisions based on manager feedback
- **Week 3:** Final polish before leadership meeting
- **Deadline:** Monthly leadership meeting (3 weeks from today)
