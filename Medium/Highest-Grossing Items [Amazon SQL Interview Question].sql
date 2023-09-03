/* Assume you're given a table containing data on Amazon customers and their spending on products in different category, 
write a query to identify the top two highest-grossing products within each category in the year 2022. 
The output should include the category, product, and total spend. */

# solution
WITH amount_spent as (
  SELECT
    category,
    product,
    sum(spend) as amt_spent,
    ROW_NUMBER() OVER(PARTITION BY category ORDER BY sum(spend) DESC) as rnk
  FROM
    product_spend
  WHERE date_part('year', transaction_date) = 2022
  GROUP BY category, product)

SELECT
  category,
  product,
  amt_spent as total_spend
FROM
  amount_spent
WHERE rnk IN (1, 2);
