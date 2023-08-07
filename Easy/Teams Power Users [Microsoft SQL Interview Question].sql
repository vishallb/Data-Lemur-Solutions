/*Write a query to identify the top 2 Power Users who sent the highest number of messages on Microsoft Teams in August 2022. 
Display the IDs of these 2 users along with the total number of messages they sent. Output the results in descending order based on the count of the messages.*/

#solution
SELECT sender_id, COUNT(content) as sent_messages
FROM messages
WHERE date(sent_date) BETWEEN '08/01/2022' AND '08/31/2022'
GROUP BY sender_id
ORDER BY sent_messages DESC
LIMIT 2; 
