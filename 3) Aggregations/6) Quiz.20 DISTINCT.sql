-- Use DISTINCT to test if there are any accounts associated with more than one region.

-- Have any sales reps worked on more than one account?


select distinct a.id as "account id",
		r.id as "region id"
from accounts a
join sales_reps s
on a.sales_rep_id = s.id
join region r
on r.id = s.region_id

