-- Your First WITH (CTE)
-- The same question as you saw in your first subquery is provided here along with the solution.

-- QUESTION: You need to find the average number of events for each channel per day.

WITH events AS (
          SELECT DATE_TRUNC('day',occurred_at) AS day, 
                        channel, COUNT(*) as events_count
          FROM web_events 
          GROUP BY 1,2)

SELECT channel, AVG(events_count) AS average_events
FROM events
GROUP BY channel
ORDER BY 2 DESC;

-- For the above example, we don't need anymore than the one additional table, but imagine we needed to 
-- create a second table to pull from. We can create an additional table to pull from in the following way:
WITH table1 AS (
          SELECT *
          FROM web_events),

     table2 AS (
          SELECT *
          FROM accounts)


SELECT *
FROM table1
JOIN table2
ON table1.account_id = table2.id;

-- You can add more and more tables using the WITH statement in the same way.