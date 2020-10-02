-- 1)Create a column that divides the standard_amt_usd by the standard_qty to find 
-- the unit price for standard paper for each order. 
-- Limit the results to the 10 orders, and include the id and account_id fields.

SELECT (standard_amt_usd/standard_qty) AS standard_paper, id,account_id
FROM orders
LIMIT 10;

--2) Write a query that finds the percentage of revenue that comes from 
-- poster paper for each order. You will need to use only the columns
--  that end with _usd. (Try to do this without using the total column.)
--   Display the id and account_id fields also

SELECT (poster_amt_usd / (standard_amt_usd + gloss_amt_usd + poster_amt_usd))*100 AS poster_revenue,id,account_id
FROM orders
LIMIT 10;
