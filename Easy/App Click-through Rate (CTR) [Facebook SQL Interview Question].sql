/*Assume you have an events table on Facebook app analytics. Write a query to calculate the click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

Definition and note:

Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100.*/

# Solution
WITH cte as (
  SELECT
    app_id,
    SUM(CASE WHEN event_type = 'click' THEN 1 ELSE 0 END) as click_counts,
    SUM(CASE WHEN event_type = 'impression' THEN 1 ELSE 0 END) as impression_counts
  FROM
    events
  WHERE DATE_PART('YEAR', timestamp) = 2022
  GROUP BY 1)

SELECT 
  app_id,
  ROUND(((100.0 * click_counts) / impression_counts), 2)  as ctr
FROM
  cte;
