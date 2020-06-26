-- Your First Subquery
-- The first time you write a subquery it might seem really complex. 
-- Let's try breaking it down into its different parts.

-- If you get stuck look again at the video above. We want to find the 
-- average number of events for each day for each channel. The first table 
-- will provide us the number of events for each day and channel, and then 
-- we will need to average these values together using a second query.

-- You try solving this yourself.

SELECT channel,
        AVG(event_count) AS avg_event_count
FROM
    (SELECT DATE_TRUNC('day',occurred_at) AS day,
            channel,
            COUNT(*) AS event_count
        FROM web_events
        --GROUP BY DATE_TRUNC('day',occurred_at),channel
        GROUP BY 1,2
    )sub
GROUP BY channel
--GROUP BY 1  
ORDER BY 2 DESC;
