SELECT orders.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;


--some timepass
SELECT orders.*,accounts.*
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
WHERE (accounts.name LIKE '%x%' OR accounts.name LIKE '%w%') AND (orders.occurred_at BETWEEN '2016-01-01' AND '2016-02-01') 
ORDER BY orders.occurred_at DESC
LIMIT 60;

--
SELECT accounts.name, orders.occurred_at
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;
--
-- 1)Try pulling all the data from the accounts table, and all the data from the orders table.
SELECT accounts.*,orders.*
FROM accounts
JOIN orders
ON accounts.id = orders.account_id
LIMIT 10;
-- 2) Try pulling standard_qty, gloss_qty, and poster_qty from the orders table, and the website 
-- and the primary_poc from the accounts table.
SELECT orders.standard_qty,orders.gloss_qty,orders.poster_qty,accounts.website,accounts.primary_poc
FROM accounts
JOIN orders
ON orders.account_id = accounts.id
LIMIT 20;