# SQL_WalmartSalesAnalysis

This SQL project explore into Walmart's sales data to identify top-performing branches and products, analyze finance and sales trends, and understand customer behavior.

This project's questions and instructions were sourced from this link:
[https://github.com/Princekrampah/WalmartSalesAnalysis](https://github.com/Princekrampah/WalmartSalesAnalysis)


### Contents
[Data Dictionary](#walmart-sales-data-dictionary) <br/>
[Approach Used](#approach-used) <br/>
[Business Questions To Answer](#business-questions-to-answer)

<br/>


### Walmart Sales Data Dictionary
| Column                     | Description                                | Data type        |
| -------------------------  | ------------------------------------------ | ---------------- |
| invoice_id                 | Invoice of the sales made                  | VARCHAR(30)      |
| branch                     | Branch at which sales were made            | VARCHAR(5)       | 
| city                       | The location of the branch	                | VARCHAR(30)      |
| customer_type	             | The type of the customer	                  | VARCHAR(30)      |
| gender	                    | Gender of the customer making purchase	    | VARCHAR(10)      |
| product_line	              | Product line of the product solf	          | VARCHAR(100)     |
| unit_price                 | The price of each product	                 | DECIMAL(10, 2)   |
| quantity	                  | The amount of the product sold	            | INT              |
| vat	                       | The amount of tax on the purchase	         | FLOAT(6, 4)      |
| total	                     | The total cost of the purchase	            | DECIMAL(10, 2)   |
| date	                      | The date on which the purchase was made	   | DATE             |
| time	                      | The time at which the purchase was made	   | TIMESTAMP        |
| payment_method             | The total amount paid	                     | DECIMAL(10, 2)   |
| cogs	                      | Cost Of Goods sold	                        | DECIMAL(10, 2)   |
| gross_margin_percentage	   | Gross margin percentage	                   | FLOAT(11, 9)     |
| gross_income	              | Gross Income	                              | DECIMAL(10, 2)   |
| rating	                    | Rating  	                                  | FLOAT(2, 1)      |

<br/>


### Approach Used
1. **Feature Engineering:** This will help use generate some new columns from existing ones.

> 1. Add a new column named `time_of_day` to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.

> 2. Add a new column named `day_name` that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each branch is busiest.

> 3. Add a new column named `month_name` that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.

2. **Exploratory Data Analysis (EDA):** Exploratory data analysis is done to answer the listed questions and aims of this project.

3. **Conclusion:** Summarize results and provide recommendations.
 
<br/>


### Business Questions To Answer

## Product and Place
1. How many unique product lines does the data have?
2. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
3. Which branch sold more products than average product sold?
4. What is the most common product line by gender?
5. What is the average rating of each product line?

## Finance
1. What is the total revenue by month?
2. What month had the largest COGS?
3. What product line had the largest revenue?

## Sales
1. Number of sales made in each time of the day per weekday
2. Which city has the largest tax percent/ VAT (**Value Added Tax**)?
3. Which customer type pays the most in VAT? (**If VAT = 5\%**)

## Customer
1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. Which customer type buys the most?
4. What is the gender of most of the customers?
5. Which day fo the week has the best avg ratings?



