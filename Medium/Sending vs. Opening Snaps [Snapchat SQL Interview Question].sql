/* This is the same question as problem #25 in the SQL Chapter of Ace the Data Science Interview!

Assume you're given tables with information on Snapchat users, including their ages and time spent sending and opening snaps.

Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage of total time spent on these activities grouped by age group. 
Round the percentage to 2 decimal places in the output.

Notes:

Calculate the following percentages:
time spent sending / (Time spent sending + Time spent opening)
Time spent opening / (Time spent sending + Time spent opening)
To avoid integer division in percentages, multiply by 100.0 and not 100.*/

# solution
SELECT
  ab.age_bucket,
  ROUND(((SUM(CASE WHEN a.activity_type = 'send' THEN a.time_spent ELSE 0 END) /
  SUM(time_spent)) * 100.0), 2) as send_perc,
  ROUND(((SUM(CASE WHEN a.activity_type = 'open' THEN a.time_spent ELSE 0 END) /
  SUM(time_spent)) * 100.0), 2) as open_perc
FROM 
  activities a  
INNER JOIN age_breakdown ab  
  ON a.user_id = ab.user_id
WHERE a.activity_type IN ('open', 'send')
GROUP BY ab.age_bucket;
