/*Given the reviews table, write a query to retrieve the average star rating for each product, grouped by month. 
The output should display the month as a numerical value, product ID, and average star rating rounded to two decimal places. 
Sort the output first by month and then by product ID.*/

-- Solution
SELECT
  mnth,
  product_id,
  ROUND(AVG(stars), 2)
FROM
  (SELECT
    stars,
    DATE_PART('month', submit_date) as mnth,
    product_id
  FROM
    reviews) x
GROUP BY product_id, mnth
ORDER BY mnth, product_id;
