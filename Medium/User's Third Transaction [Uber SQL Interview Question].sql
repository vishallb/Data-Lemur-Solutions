/* Assume you are given the table below on Uber transactions made by users. 
Write a query to obtain the third transaction of every user. Output the user id, spend and transaction date. */

-- Solution
SELECT
  user_id,
  spend,
  transaction_date
FROM
  (SELECT
    *,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) as rn 
  FROM transactions) x
WHERE rn = 3;
