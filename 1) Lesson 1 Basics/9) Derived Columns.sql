SELECT account_id,occured_at,standart_qty,
        gloss_qty,poster_qty
        gloss_qty + poster_qty AS gloss_poster_sum
FROM orders
LIMIT 20;