/*Assume you're given a table containing information on Facebook user actions. Write a query to obtain number of monthly active users (MAUs) in July 2022, 
including the month in numerical format "1, 2, 3".

Hint:

An active user is defined as a user who has performed actions such as 'sign-in', 'like', or 'comment' in both the current month and the previous month.*/

-- solution
WITH cte as (
  SELECT
    *,
    LAG(event_date) OVER(PARTITION BY user_id ORDER BY event_date) AS xy
  FROM
    user_actions
)

SELECT
  EXTRACT(MONTH FROM event_date),
  SUM(CASE
        WHEN EXTRACT(MONTH FROM event_date) = 7 AND EXTRACT(MONTH FROM xy) = 6 THEN 1 ELSE 0
      END) AS monthly_active_users
FROM
  cte 
WHERE EXTRACT(MONTH FROM event_date) = 7
GROUP BY EXTRACT(MONTH FROM event_date);
