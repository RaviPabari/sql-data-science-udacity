
-- Which account (by name) placed the earliest order? Your solution should have the account name and the date of the order.

-- Find the total sales in usd for each account. You should include two columns - the total sales for each company's orders in usd and the company name.

-- Via what channel did the most recent (latest) web_event occur, which account was associated with this web_event? Your query should return only three values - the date, channel, and account name.

-- Find the total number of times each type of channel from the web_events was used. Your final table should have two columns - the channel and the number of times the channel was used.

-- Who was the primary contact associated with the earliest web_event?

-- What was the smallest order placed by each account in terms of total usd. Provide only two columns - the account name and the total usd. Order from smallest dollar amounts to largest.

-- Find the number of sales reps in each region. Your final table should have two columns - the region and the number of sales_reps. Order from fewest reps to most reps.

select a.name,SUM(total_amt_usd) total_usd
from orders o
join accounts a
on a.id = o.account_id
--where a.name = 'Walmart'
group by a.name
order by a.name desc;

select a.name,o.occurred_at 
from accounts a 
join orders o 
on a.id = o.account_id 
order by o.occurred_at;

select w.occurred_at,w.channel,a.name
from accounts a
join web_events w
on a.id = w.account_id
order by w.occurred_at;

select channel , count(channel) as channel_count
from web_events
group by channel

select a.name , min(total_amt_usd) smallest_order
from accounts a
join orders o
on a.id = o.account_id
group by a.name
order by smallest_order

