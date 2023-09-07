/* Assume you're given a table with measurement values obtained from a Google sensor over multiple days with measurements taken multiple times within each day.

Write a query to calculate the sum of odd-numbered and even-numbered measurements separately for a particular day and display the results in two different columns. 

Definition:
Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements, and measurements taken at 2nd, 4th, and 6th times are considered 
even-numbered measurements.*/

# solution
WITH cte as (
  SELECT
    measurement_time,
    DATE_TRUNC('DAY', measurement_time) as measurement_day,
    measurement_value,
    ROW_NUMBER() OVER(PARTITION BY date_part('day', measurement_time) ORDER BY measurement_time) as rnk
  FROM
    measurements)
    
    
SELECT
  measurement_day,
  SUM(CASE WHEN rnk % 2 != 0 THEN measurement_value ELSE 0 END) as odd_sum,
  SUM(CASE WHEN rnk % 2 = 0 THEN measurement_value ELSE 0 END) as even_sum
FROM
  cte
GROUP BY 1
ORDER BY 1;
