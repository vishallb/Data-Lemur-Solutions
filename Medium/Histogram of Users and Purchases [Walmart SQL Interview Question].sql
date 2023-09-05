/* Assume you're given a table on Walmart user transactions. 
Based on their most recent transaction date, write a query that retrieve the users along with the number of products they bought.

Output the user's most recent transaction date, user ID, and the number of products, sorted in chronological order by the transaction date.*/

# solution
WITH cte as (
  SELECT
    user_id,
    spend,
    transaction_date,
    RANK() OVER(PARTITION BY user_id ORDER BY transaction_date DESC) AS rnk
  FROM
    user_transactions)

SELECT
  transaction_date,
  user_id,
  count(spend) as purchase_count
FROM 
  cte  
WHERE rnk = 1
GROUP BY user_id, transaction_date
ORDER BY 1;
