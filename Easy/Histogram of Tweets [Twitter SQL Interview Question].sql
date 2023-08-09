---Assume you're given a table Twitter tweet data, write a query to obtain a histogram of tweets posted per user in 2022. 
---Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.
---In other words, group the users by the number of tweets they posted in 2022 and count the number of users in each group.

#Solution
SELECT
  a.number_of_tweets as tweet_bucket,
  COUNT(*) as users_num
FROM
  (SELECT user_id, count(tweet_id) as number_of_tweets
  FROM tweets
  WHERE DATE(tweet_date) BETWEEN '01/01/2022' AND '12/31/2022'
  GROUP BY user_id) a  
GROUP BY tweet_bucket;
