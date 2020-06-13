-- When was the earliest order ever placed? You only need to return the date.
SELECT MIN(occurred_at) AS date
FROM orders;

-- Try performing the same query as in question 1 without using an aggregation function.
SELECT occurred_at
FROM orders
ORDER BY occurred_at 
LIMIT 1;

-- When did the most recent (latest) web_event occur?
SELECT MAX(occurred_at) AS date
FROM orders;

-- Try to perform the result of the previous query without using an aggregation function.
SELECT occurred_at
FROM orders
ORDER BY occurred_at DESC 
LIMIT 1;

-- Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean 
-- amount of each paper type purchased per order. Your final answer should have 6 values - 
-- one for each paper type for the average number of sales, as well as the average amount.
SELECT AVG(standard_qty) mean_standard, AVG(gloss_qty) mean_gloss, 
           AVG(poster_qty) mean_poster, AVG(standard_amt_usd) mean_standard_usd, 
           AVG(gloss_amt_usd) mean_gloss_usd, AVG(poster_amt_usd) mean_poster_usd
FROM orders;

-- Via the video, you might be interested in how to calculate the MEDIAN. Though this is more 
-- advanced than what we have covered so far try finding - what is the MEDIAN total_usd spent 
-- on all orders?
SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;