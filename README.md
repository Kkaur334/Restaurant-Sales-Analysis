# Restaurant Sales & Menu Analysis (SQL)

## Project Overview
This project analyzes restaurant menu pricing, customer ordering behavior, and revenue patterns using SQL.  
The goal is to extract meaningful business insights from transactional order data.

## Dataset
The analysis is based on two tables:
- **menu_items**: Menu item details including category and price
- **order_details**: Customer orders with order dates and item quantities

## Key Business Questions Answered
- How many items are available on the menu?
- Which menu items are the least and most expensive?
- How do prices vary across categories?
- What is the date range of customer orders?
- How many orders and items were placed?
- Which items are ordered the most and least?
- What are the top 5 highest-spending orders?
- Which categories drive higher revenue?

## Tools Used
- MySQL
- SQL Aggregations (COUNT, SUM, AVG)
- JOINs
- Subqueries
- Sorting & Filtering

## Key Insights
- Italian and Mexican categories have the highest number of menu items.
- Italian dishes tend to have higher average prices.
- Hamburger is the most ordered menu item.
- A small number of large orders contribute significantly to total revenue.
- Italian items dominate high-value orders.

## How to Use
1. Load the `menu_items` and `order_details` tables into your SQL environment.
2. Run the queries in `restaurant_sales_analysis.sql` sequentially.
3. Review comments for business interpretation.

## Author
Kirandeep Kaur

