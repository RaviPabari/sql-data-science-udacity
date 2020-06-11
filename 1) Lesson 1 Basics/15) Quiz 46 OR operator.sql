-- 1) Find list of orders ids where either gloss_qty or poster_qty is greater than 4000. 
-- Only include the id field in the resulting table.
SELECT id
FROM orders
WHERE gloss_qty > 4000 OR poster_qty > 4000; 

-- 2) Write a query that returns a list of orders where the standard_qty is zero and either 
-- the gloss_qty or poster_qty is over 1000.
SELECT *
FROM orders
WHERE standard_qty=0 AND(gloss_qty>1000 OR poster_qty > 1000); 

-- Find all the company names that start with a 'C' or 'W', and the primary contact contains
--  'ana' or 'Ana', but it doesn't contain 'eana'.

SELECT *
FROM accounts
WHERE name LIKE 'C%' OR name LIKE'%W' 
		AND ((primary_poc LIKE '%ana%' 
             OR primary_poc LIKE'%Ana%') 
             AND primary_poc NOT LIKE '%eana%');