-- Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?

-- Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?

-- Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?

-- Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?

-- In which month of which year did Walmart spend the most on gloss paper in terms of dollars?

select date_part('year',occurred_at) as "year" ,sum(total_amt_usd) as total_spent
from orders 
group by date_part('year',occurred_at)
order by total_spent desc

OR

select date_part('year',occurred_at) as "year" ,sum(total_amt_usd) as total_spent
from orders 
group by 1
order by 2

---
select date_part('month',occurred_at),sum(total_amt_usd)
from orders
group by 1
order by 2 desc;

--to be fair to the results 
--we must remove the data from 2013 and 2017
select date_part('month',occurred_at),sum(total_amt_usd)
from orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
group by 1
order by 2 desc;

select date_part('year',occurred_at) ,count(total) as total_orders
from orders
group by 1
order by 2 desc

select date_part('month',occurred_at) ,count(total) as total_orders
from orders
group by 1
order by 2 desc


--not here we have to pring the result with the year also so 
--we have used DATE_TRUNC here
select date_trunc('month',o.occurred_at) as "month", a.name as "name",
sum(o.gloss_amt_usd) as total_gloss
from orders o
join accounts a
on a.id = o.account_id
--where a.name='Walmart'  (we can also use WHERE but it comes before GROUP BY)
group by date_trunc('month',o.occurred_at) , a.name
having a.name = 'Walmart'
order by 3 desc;