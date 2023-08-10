/* Given a table of Facebook posts, for each user who posted at least twice in 2021, write a query to find the number of days between each user’s first 
post of the year and last post of the year in the year 2021. 
Output the user and number of the days between each user's first and last post. */

# solution
SELECT
  user_id,
  date_part('day', (MAX(post_date) - MIN(post_date)))
FROM posts
WHERE post_date BETWEEN '01/01/2021' AND '12/31/2021'
GROUP BY user_id
HAVING count(*) > 2;
