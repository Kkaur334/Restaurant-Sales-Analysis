/*
Project: Restaurant Sales & Menu Analysis
Database Tables:
- menu_items
- order_details
*/

-- ===============================
-- MENU ANALYSIS
-- ===============================

USE restaurant_db;

-- Viewing both the tables
SELECT * FROM menu_items;
SELECT * FROM order_details;

-- Number of items on the menu
SELECT 
	Count(menu_item_id) AS number_of_items
FROM menu_items;

-- RESULT: There are 32 items on the menu

-- Least and most expensive menu items
SELECT *
FROM menu_items
ORDER BY price;

SELECT *
FROM menu_items
ORDER BY price DESC;

-- RESULT: Edamame with Category Asian is the least expensive and Shrimp Scampi with Category Italian is the most expensive

-- Items per category with average price
SELECT 
	category,
	COUNT(menu_item_id) AS number_of_items,
    ROUND(AVG(price), 3) AS average_price
FROM menu_items
GROUP BY category;

-- RESULT: Italian and Mexican has most number of items but the average price is higher in Italian than Mexican

-- Italian menu item analysis
SELECT *
FROM menu_items
WHERE category = 'Italian';

SELECT *
FROM menu_items
WHERE category = 'Italian'
ORDER BY price;

-- RESULT: Lease expensive items are Spaghetti and Fettuccine Alfredo and most expensive items are Chicken Parmesan and Shrimp Scampi

-- ===============================
-- ORDER ANALYSIS
-- ===============================

-- Order date range
SELECT 
	MIN(order_date) AS minimum_date, 
    MAX(order_date) AS maximum_date
FROM order_details;

-- Total number of unique orders
SELECT
	COUNT(DISTINCT order_id) AS number_of_order
FROM order_details;

-- RESULT: There are 5370 orders made within this data range

-- Total number of items ordered
SELECT 
	COUNT(order_details_id) AS number_of_items
FROM order_details;

-- RESULT: There are 12,234 items ordered within this date range

-- Number of items per order
SELECT 
	order_id, 
    COUNT(item_id) AS number_of_items
FROM order_details
GROUP BY order_id
ORDER BY number_of_items DESC;

-- Looking from this table, most of the orders has ordered 12 number of items

-- Orders with more than 12 items
SELECT COUNT(*) FROM
(SELECT 
	order_id, 
    COUNT(item_id) AS number_of_items
FROM order_details
GROUP BY order_id
HAVING number_of_items > 12) AS num_orders;

-- RESULT: There are 20 orders who have ordered 12 items

-- ===============================
-- SALES & ITEM PERFORMANCE
-- ===============================

-- Combining data for further analysis
SELECT 
	*
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id;

-- Most and least ordered items
SELECT 
	mi.item_name, 
    COUNT(od.order_details_id) AS purchases
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name
ORDER BY purchases;

-- RESULT: Chicken Tacos were least ordered and Hamburger were the most ordered item.

-- Item popularity by category
SELECT 
	mi.item_name,
    mi.category,
    COUNT(od.order_details_id) AS purchases
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY mi.item_name, mi.category
ORDER BY purchases;

-- ===============================
-- REVENUE ANALYSIS
-- ===============================

-- Top 5 highest spending orders
SELECT 
	od.order_id,
    SUM(price) as total_price
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
GROUP BY od.order_id
ORDER BY total_price DESC
limit 5;

-- RESULT: Order with ID 440 has spend $192.15 the highest.

-- Category contribution for top spending order

SELECT 
	order_id,
	category,
    COUNT(item_id) AS num_items
FROM order_details od
LEFT JOIN menu_items mi
ON od.item_id = mi.menu_item_id
WHERE order_id in (440,2075,1957,330,2675)
GROUP BY category, order_id;