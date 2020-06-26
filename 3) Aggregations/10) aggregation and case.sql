-- This one is pretty tricky. Try running the query yourself to make sure 
-- you understand what is happening. The next concept will give you some 
-- practice writing CASE statements on your own. In this video, we showed 
-- that getting the same information using a WHERE clause means only being 
-- able to get one set of data from the CASE at a time.

-- There are some advantages to separating data into separate columns like this 
-- depending on what you want to do, but often this level of separation might be 
-- easier to do in another programming language - rather than with SQL.

SELECT CASE WHEN total > 500 THEN 'Over 500'
        ELSE '500 or under' END AS total_group,
    COUNT(*) AS order_group
FROM orders
GROUP BY 1;

--OUTPUT
--  total_group	        order_group
--    Over 500	            3196
--    500 or under	        3716