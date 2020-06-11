/*
1) Pulls the first 5 rows and all columns from the orders table that have a dollar amount 
of gloss_amt_usd greater than or equal to 1000.
*/
SELECT *
FROM orders
WHERE gloss_amt_usd >= 1000
ORDER BY total DESC
LIMIT 5;

/*
2)Pulls the first 10 rows and all columns from the orders table that have a total_amt_usd less than 500
*/
SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;