-- CASE - Expert Tip
-- The CASE statement always goes in the SELECT clause.

-- CASE must include the following components: WHEN, THEN,
-- and END. ELSE is an optional component to catch cases that 
-- didn’t meet any of the other previous CASE conditions.

-- You can make any conditional statement using any conditional 
-- operator (like WHERE) between WHEN and THEN. This includes 
-- stringing together multiple conditional statements using AND and OR.

-- You can include multiple WHEN statements, as well as an ELSE statement again, 
-- to deal with any unaddressed conditions.

-- Example
SELECT id, 
		account_id,
        occurred_at,
        channel,
        CASE WHEN channel='facebook' THEN 'yes'
    	END as is_facebook
FROM web_events
ORDER BY occurred_at;

-- Create a column that divides the standard_amt_usd by the standard_qty to find the 
-- unit price for standard paper for each order. Limit the results to the first 10 orders, 
-- and include the id and account_id fields. NOTE - you will be thrown an error with the 
-- correct solution to this question. This is for a division by zero. You will learn how 
-- to get a solution without an error to this query when you learn about CASE statements in a later section.
--if we divide by zero then we will get error so we can handel by using if else case
SELECT account_id, 
		CASE WHEN standard_amt_usd=0 OR
        		standard_qty IS NULL THEN 0
            ELSE standard_amt_usd/standard_qty
            END AS unit_price
FROM orders
LIMIT 10;

--Example

SELECT account_id,occurred_at,total,
CASE WHEN total>500 THEN 'Over 500'
    WHEN total>300 THEN '301 - 500'
    WHEN total>100 THEN '101 - 300'
    ELSE '100 or under' END AS total_group
FROM orders