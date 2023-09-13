/* Assume you're given a table containing information about Wayfair user transactions for different products. 
Write a query to calculate the year-on-year growth rate for the total spend of each product, grouping the results by product ID.

The output should include the year in ascending order, product ID, current year's spend, previous year's spend and year-on-year growth percentage,
rounded to 2 decimal places.*/

# solution
WITH cte as (
  SELECT
    date_part('year', transaction_date) as year,
    product_id,
    SUM(spend) as curr_year_spend
  FROM
    user_transactions
  GROUP BY 2, 1
  ORDER BY 2, year),
    
cte2 as (SELECT
  year,
  product_id,
  curr_year_spend,
  LAG(curr_year_spend) OVER(PARTITION BY product_id) as prev_year_spend
FROM
  cte)
  
SELECT
  *,
  CASE
    WHEN prev_year_spend IS NULL THEN NULL
    ELSE ROUND((100 * ((curr_year_spend - prev_year_spend) / prev_year_spend)), 2)
  END AS yoy_rate
FROM
  cte2;
