/* You're given a table containing the item count for each order on Alibaba, along with the frequency of orders that have the same item count.
Write a query to retrieve the mode of the order occurrences.
Additionally, if there are multiple item counts with the same mode, the results should be sorted in ascending order.*/

# solution
SELECT
  item_count as mode
FROM
  items_per_order
WHERE order_occurrences = (SELECT MAX(order_occurrences) FROM items_per_order)
ORDER BY mode;
