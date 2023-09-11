/* New TikTok users sign up with their emails. They confirmed their signup by replying to the text confirmation to activate their accounts. 
Users may receive multiple text messages for account confirmation until they have confirmed their new account.

A senior analyst is interested to know the activation rate of specified users in the emails table. 
Write a query to find the activation rate. Round the percentage to 2 decimal places.*/

# solution
SELECT 
  ROUND(((COUNT(texts.email_id) * 1.0)
    /COUNT(DISTINCT emails.email_id)) , 2) AS activation_rate
FROM emails
LEFT JOIN texts
  ON emails.email_id = texts.email_id
  AND texts.signup_action = 'Confirmed';
