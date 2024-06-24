use pizzasales;
SELECT * FROM pizzasales.pizza_sales;

#1) 1. Total Revenue:
select sum(total_price) as Total_Revenue from pizza_sales;

#2)Average order value:
select sum(total_price) / count(distinct order_id) as Avg_order_value from pizza_sales;

#3)Total quantity sold:
select sum(quantity) as Total_quantity_sold from pizza_sales;

#4)Total order placed:
select count(distinct order_id) as Total_order_placed from pizza_sales;

#5)Average pizzas per order:
select sum(quantity) / count(distinct order_id) as Average_pizzas_per_order from pizza_sales;

#6)Daily trends for total order:
SELECT DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day,
COUNT(DISTINCT order_id) AS Total_order FROM pizza_sales GROUP BY DAYNAME(STR_TO_DATE(order_date, '%Y-%m-%d'));

#7)Monthly trends for total order
SELECT MONTHNAME(STR_TO_DATE(order_date, '%Y-%m-%d')) AS order_day,
COUNT(DISTINCT order_id) AS Total_order FROM pizza_sales GROUP BY MONTHNAME(STR_TO_DATE(order_date, '%Y-%m-%d'));

#8)Percentage of total sales by pizza category
select pizza_category, sum(total_price) * 100 / (select sum(total_price)  from pizza_sales)  as PCT_of_pizza_sales
from pizza_sales group by pizza_category;

#9)PCT of total sales by pizza size
select pizza_size,sum(total_price), sum(total_price) *100/ (select sum(total_price)  from pizza_sales)
as PCT_of_pizza_sales from pizza_sales group by pizza_size order by PCT_of_pizza_sales desc;

#10)top 5 best sellers by revenue
select  pizza_name,sum(total_price)as total_revenue from pizza_sales group by pizza_name order by total_revenue desc  limit 5;

#11)top 5 best sellers by quantity
select  pizza_name,sum(quantity)as total_quantity from pizza_sales group by pizza_name order by total_quantity desc limit 5;

#12)top 5 best sellers by order_id
select  pizza_name,count(distinct order_id)as total_order from pizza_sales group by pizza_name order by total_order desc limit 5;



