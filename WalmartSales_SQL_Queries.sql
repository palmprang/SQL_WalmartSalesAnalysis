

-------------------------------------------------
---------- Extract Feature Engineering ----------
-------------------------------------------------


-- Add the ** time_of_day ** column: give insight of sales in the Morning, Afternoon and Evening.
select time,
	case 
        when `time` between '00:00:00' and '12:00:00' then 'Morning'
        when `time` between '12:01:00' and '16:00:00' then 'Afternoon'
        else 'Evening'
  end as time_of_day
from walmartsales;

alter table walmartsales 
  add column time_of_day varchar(20);

update walmartsales
set time_of_day = (
  case 
        when `time` between '00:00:00' and '12:00:00' then 'Morning'
        when `time` between '12:01:00' and '16:00:00' then 'Afternoon'
        else 'Evening'
  end
);


-- Add ** day_name ** column: contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri).
select date, dayname(date)
from walmartsales;

alter table walmartsales 
  add column day_name varchar(10);

update walmartsales
set day_name = dayname(date);


-- Add ** month_name ** column: contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar).
select date, monthname(date)
from walmartsales;

alter table walmartsales 
  add column month_name vachar(10);

update walmartsales
set month_name = monthname(date);


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


-------------------------------------------------
-------- Exploratory Data Analysis (EDA) --------
-------------------------------------------------


-----------------------------
----- Product and Place -----
-----------------------------


-- 1. How many unique product lines does the data have? --
select count(distinct product_line) as product_count
from walmartsales;
-- There are 6 unique product lines-- 


-- 2. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales --
select avg(quantity) AS avg_quantity
from walmartsales;
-- The average quantity is 5.51 -- 

select product_line,
	case 
        when avg(quantity) > 5.51 then 'Good'
        when avg(quantity) < 5.51  then 'Bad'
        else 'Average'
  end as performance 
from walmartsales
group by product_line;


-- 3. Which branch sold more products than average product sold? --
select branch, 
	sum(quantity) as total_quantity 
from walmartsales
group by branch
having sum(quantity) > (select sum(quantity) / count(DISTINCT branch) from walmartsales);


-- 4. What is the most common product line by gender? --
select product_line, 
	gender,
	count(gender) as gender_count
from walmartsales
group by product_line, gender
order by product_line, gender_count desc;


-- 5. What is the average rating of each product line? --
select product_line,
	round(avg(rating),3) as avg_rating
from walmartsales
group by product_line
order by avg_rating desc;


-----------------------------
---------- Finance ----------
-----------------------------


-- 1. What is the total revenue by month? --
select month_name,
	round(sum(total),3) as total_revenue
from walmartsales
group by month_name
order by total_revenue desc;


-- 2. What month had the largest COGS? --
select month_name, 
	round(sum(cogs),3) as total_cogs
from walmartsales
group by month_name
order by total_cogs desc;


-- 3. What product line had the largest gross profit? --
-- Gross profit = Revenue - COGS --
select product_line, 
	round(sum(total)-sum(cogs),3) as total_gross_profit
from walmartsales
group by product_line
ORDER by total_gross_profit DESC;


-----------------------------
----------- Sales -----------
-----------------------------


-- 1. Number of sales made in each time of the day per weekday --
select time_of_day,
	count(*) as total_sales
from walmartsales
where day_name = "Saturday" or "Sunday"
group by time_of_day;

-- 2. Which city has the largest tax percent/ VAT (Value Added Tax)? --
select city,
    ROUND(AVG(tax), 3) as avg_tax
from walmartsales
group by city 
order by avg_tax desc;


-- 3. Which customer type pays the most in VAT? (If VAT = 5%) --
select customer_type,
	round(avg(tax),3) as avg_tax
from walmartsales
group by customer_type
order by avg_tax desc;


-----------------------------
---------- Customer ---------
-----------------------------


-- 1. Which customer type buys the most? --
select customer_type,
	count(*) as total_sales
from walmartsales
group by customer_type
order by total_sales desc;


-- 2. What is the most common payment method? --
select payment, customer_type,
	count(*) as total_sales
from walmartsales
group by payment,customer_type
order by payment,customer_type;


-- 3. What is the gender of most of the customers? --
select gender,
	count(gender) as gender_count
from walmartsales
group by gender
order by gender_count desc;


-- 4. Which time of the day do customers give most ratings per branch? --
select branch, time_of_day, 
	round(avg(rating),3) as avg_rating
from walmartsales
group by branch, time_of_day
order by branch, time_of_day;


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------


