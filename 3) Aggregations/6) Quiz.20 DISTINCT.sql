-- Use DISTINCT to test if there are any accounts associated with more than one region.

-- Have any sales reps worked on more than one account?


select distinct a.id as "account id",
		r.id as "region id"
from accounts a
join sales_reps s
on a.sales_rep_id = s.id
join region r
on r.id = s.region_id

SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY num_accounts;