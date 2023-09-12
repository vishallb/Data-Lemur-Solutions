/* A phone call is considered an international call when the person calling is in a different country than the person receiving the call.

What percentage of phone calls are international? Round the result to 1 decimal.*/

# solution
WITH countries as (
  SELECT  
    caller.country_id AS caller_country,
    receiver.country_id AS receiver_country
  FROM phone_calls AS calls
  LEFT JOIN phone_info AS caller
    ON calls.caller_id = caller.caller_id
  LEFT JOIN phone_info AS receiver
    ON calls.receiver_id = receiver.caller_id)

SELECT
  ROUND(100.0 * COUNT(CASE WHEN caller_country != receiver_country THEN 1 ELSE NULL END) /
  COUNT(*), 1)
FROM
  countries;
