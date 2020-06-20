select account_id, channel,
	count(id) as events
from web_events
group by account_id,channel
order by account_id, events desc	

-- For each account, determine the average amount of each type of paper they purchased across their orders. Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.

-- For each account, determine the average amount spent per order on each paper type. Your result should have four columns - one for the account name and one for the average amount spent on each paper type.

-- Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.

-- Determine the number of times a particular channel was used in the web_events table for each region. Your final table should have three columns - the region name, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.

select a.name,
		avg(standard_qty) as standard,
        avg(poster_qty) as poster,
        avg(gloss_qty) as gloss
from orders
join accounts a
on a.id = orders.account_id
group by a.name

select a.name,
		avg(standard_amt_usd) as standard,
        avg(poster_amt_usd) as poster,
        avg(gloss_amt_usd) as gloss
from orders
join accounts a
on a.id = orders.account_id
group by a.name
--order by standard desc
        
select a.name,w.channel, count(sales_rep_id) as num_events
from accounts a
join web_events w
on a.id = w.account_id
join sales_reps s
on s.id = a.sales_rep_id
group by a.name,w.channel
order by num_events desc

select r.name,w.channel,count(channel) as events
from accounts a
join web_events w
on w.account_id = a.id
join sales_reps s
on s.id = a.sales_rep_id
join region r
on r.id = s.region_id
group by r.name,w.channel
order by r.name 