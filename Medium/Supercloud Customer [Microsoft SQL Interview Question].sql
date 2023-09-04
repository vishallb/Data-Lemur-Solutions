/* A Microsoft Azure Supercloud customer is defined as a company that purchases at least one product from each product category.

Write a query that effectively identifies the company ID of such Supercloud customers. */

# solution
WITH cte as (
  SELECT
      c.customer_id,
      c.product_id,
      p.product_category,
      ROW_NUMBER() OVER(PARTITION BY c.customer_id, p.product_category ORDER BY c.customer_id)
  FROM customer_contracts c  
  INNER JOIN products p  
  ON c.product_id = p.product_id)

SELECT
  customer_id
FROM
  cte 
GROUP BY customer_id
HAVING COUNT (DISTINCT product_category) = 3;
