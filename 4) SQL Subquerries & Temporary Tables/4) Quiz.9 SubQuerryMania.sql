-- Provide the name of the sales_rep in each region with the largest amount of total_amt_usd sales.
SELECT t1.sales_name,t2.region_name, t2.total_amt
FROM
    (SELECT region_name , MAX(total_amt) total_amt
        FROM(
            SELECT r.name region_name , s.name sales_name, SUM(o.total_amt_usd) total_amt
            FROM orders o
            JOIN accounts a
            ON a.id = o.account_id
            JOIN sales_reps s
            ON s.id = a.sales_rep_id
            JOIN region r
            ON s.region_id = r.id
            GROUP BY 1,2)t1
    GROUP BY 1)t2
JOIN 
    (SELECT r.name region_name , s.name sales_name, SUM(o.total_amt_usd) total_amt
        FROM orders o
        JOIN accounts a
        ON a.id = o.account_id
        JOIN sales_reps s
        ON s.id = a.sales_rep_id
        JOIN region r
        ON s.region_id = r.id
        GROUP BY 1,2)t1
ON t1.region_name = t2.region_name AND t2.total_amt = t1.total_amt
ORDER BY 3 DESC;

-- For the region with the largest (sum) of sales total_amt_usd, how many total (count) orders were placed?


-- How many accounts had more total purchases than the account name which has bought the most standard_qty paper throughout their lifetime as a customer?


-- For the customer that spent the most (in total over their lifetime as a customer) total_amt_usd, how many web_events did they have for each channel?


-- What is the lifetime average amount spent in terms of total_amt_usd for the top 10 total spending accounts?


-- What is the lifetime average amount spent in terms of total_amt_usd, including only the companies that spent more per order, on average, than the average of all orders.
