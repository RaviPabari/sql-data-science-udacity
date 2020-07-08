--If you want to pull out all those orders which were placced in the same month
--when the first ever parch and posey order was placced
SELECT *
FROM orders
WHERE DATE_TRUNC('month',occurred_at) =
(SELECT DATE_TRUNC('month',MIN(occurred_at)) AS min_month
FROM orders)
ORDER BY occurred_at;