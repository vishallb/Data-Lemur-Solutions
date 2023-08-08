-- Assume you're given the tables containing completed trade orders and user details in a Robinhood trading system.
-- Write a query to retrieve the top three cities that have the highest number of completed trade orders listed in descending order. 
-- Output the city name and the corresponding number of completed trade orders.

# Solution
SELECT u.city, COUNT(status) as completed_orders
FROM trades t  
INNER JOIN users u ON t.user_id = u.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY completed_orders DESC
LIMIT 3;
