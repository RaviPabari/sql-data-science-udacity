--1)
SELECT a.name acc_name,
		s.name sales_name,
        r.name region_name
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON s.region_id = r.id
WHERE r.name = 'Midwest'
ORDER BY a.name;

--2)
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE s.name LIKE 'S%'
	AND r.name = 'Midwest' 
ORDER BY a.name;

--3)
SELECT r.name region, s.name rep, a.name account
FROM sales_reps s
JOIN region r
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
WHERE s.name LIKE '% K%'
	AND r.name = 'Midwest' 
ORDER BY a.name;

--4)
SELECT a.name acc_name,
	(o.total_amt_usd/o.total + 0.01) unit_price,
          r.name region_name
FROM accounts a
JOIN orders o
ON o.account_id = a.id
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id
WHERE standard_qty > 100

-- 5)
SELECT a.name acc_name,
	(o.total_amt_usd/o.total + 0.01) unit_price,
          r.name region_name
FROM accounts a
JOIN orders o
ON o.account_id = a.id
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id
WHERE standard_qty > 100
	AND poster_qty > 50
ORDER BY unit_price ;

-- 6)
SELECT a.name acc_name,
	(o.total_amt_usd/o.total + 0.01) unit_price,
          r.name region_name
FROM accounts a
JOIN orders o
ON o.account_id = a.id
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id
WHERE standard_qty > 100
	AND poster_qty > 50
ORDER BY unit_price DESC ;

-- 7)
SELECT DISTINCT w.channel,a.name
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE a.id = 1001;

-- 8)
SELECT o.occurred_at,
		a.name ,
        o.total ,
        o.total_amt_usd 
FROM accounts a
JOIN orders o
ON o.account_id = a.id
WHERE o.occurred_at
		BETWEEN '2015-01-01' AND '2016-01-01'
ORDER BY o.occurred_at DESC;