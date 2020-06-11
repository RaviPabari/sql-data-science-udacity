-- Questions

-- 1) Provide a table for all web_events associated with account name of Walmart. 
-- There should be three columns. Be sure to include the primary_poc, time of the event, 
-- and the channel for each event. Additionally, you might choose to add a fourth column to 
-- assure only Walmart events were chosen.
SELECT a.name, w.occurred_at, a.primary_poc, w.channel
FROM accounts AS a
JOIN web_events w
ON a.id = w.account_id
WHERE a.name = 'Walmart';


-- 2) Provide a table that provides the region for each sales_rep along with their associated accounts. 
-- Your final table should include three columns: the region name, the sales rep name, and the account name. 
-- Sort the accounts alphabetically (A-Z) according to account name.
SELECT r.name region_name,
	   s.name sales_rep_name,
       a.name acc_name
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON s.id = a.sales_rep_id
ORDER BY a.name;

-- 3) Provide the name for each region for every order, as well as the account name and the unit price they paid 
-- (total_amt_usd/total) for the order. Your final table should have 3 columns: region name, account name, and 
-- unit price. A few accounts have 0 for total, so I divided by (total + 0.01) to assure not dividing by zero.

SELECT r.name region_name,
		a.name account_name,
        (o.total_amt_usd/(o.total +0.01)) unit_price
FROM orders o
JOIN accounts a
ON o.account_id = a.id
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id;