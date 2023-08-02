--- Assume you're given the table on user viewership categorised by device type where the three types are laptop, tablet, and phone.
--Write a query that calculates the total viewership for laptops and mobile devices where mobile is defined as the sum of tablet and phone viewership. 
-- Output the total viewership for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.

# Solution
WITH mobile_view as (
  SELECT count(*) as mobile_views
  FROM viewership
  WHERE device_type IN ('tablet', 'phone'))
SELECT count(*) as laptop_views,
       (SELECT * FROM mobile_view)
FROM viewership
WHERE device_type = 'laptop';
