-- How many of the sales reps have more than 5 accounts that they manage?

-- How many accounts have more than 20 orders?

-- Which account has the most orders?

-- Which accounts spent more than 30,000 usd total across all orders?

-- Which accounts spent less than 1,000 usd total across all orders?

-- Which account has spent the most with us?

-- Which account has spent the least with us?

-- Which accounts used facebook as a channel to contact customers more than 6 times?

-- Which account used facebook most as a channel?

-- Which channel was most frequently used by most accounts?

select s.id,s.name,count(a.name) as num_accounts
from accounts a
join sales_reps s
on s.id = a.sales_rep_id
group by s.id,s.name
having count(a.name) > 5
order by num_accounts desc

select a.id,a.name, count(o.account_id) as total_orders
from orders o
join accounts a
on a.id = o.account_id
group by a.id,a.name
having count(o.account_id) > 20
order by total_orders desc

select a.id,a.name, count(o.account_id) as total_orders
from orders o
join accounts a
on a.id = o.account_id
group by a.id,a.name
having count(o.account_id) > 20
order by total_orders desc
limit 1;

select a.id,a.name, sum(o.total_amt_usd) as total_amt
from orders o
join accounts a
on a.id = o.account_id
group by a.id,a.name
having sum(o.total_amt_usd) > 30000
order by total_amt desc

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_spent;

select a.id,a.name, sum(o.total_amt_usd) as total_amt
from orders o
join accounts a
on a.id = o.account_id
group by a.id,a.name
order by total_amt desc
limit 1

select a.id,a.name, sum(o.total_amt_usd) as total_amt
from orders o
join accounts a
on a.id = o.account_id
group by a.id,a.name
order by total_amt 
limit 1

select a.id, a.name,w.channel ,count(w.channel) as num_of_count
from accounts a
join web_events w
on a.id = w.account_id
where w.channel='facebook'
group by a.id, a.name,w.channel
having count(w.channel)>6

select a.id, a.name,w.channel ,count(w.channel) as num_of_count
from accounts a
join web_events w
on a.id = w.account_id
where w.channel='facebook'
group by a.id, a.name,w.channel
having count(w.channel)>6
order by num_of_count desc
limit 1;

select a.id,a.name,w.channel,count(w.channel) as no_of_count
from web_events w
join accounts a
on a.id = w.account_id
group by a.id,a.name,w.channel
order by no_of_count desc
limit 10;