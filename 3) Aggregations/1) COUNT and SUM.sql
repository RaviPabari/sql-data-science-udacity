-- COUNT the Number of Rows in a Table
-- Try your hand at finding the number of rows in each table. 
-- Here is an example of finding all the rows in the accounts table.

SELECT COUNT(*)
FROM accounts;

-- But we could have just as easily chosen a column to drop into the aggregation function:

SELECT COUNT(accounts.id)
FROM accounts;

-- Notice that COUNT does not consider rows that have NULL values. Therefore, this can be useful 
-- for quickly identifying which rows have missing data. You will learn GROUP BY in an upcoming 
-- concept, and then each of these aggregators will become much more useful.

---

-- Unlike COUNT, you can only use SUM on numeric columns. However, SUM will ignore NULL values, 
-- as do the other aggregation functions you will see in the upcoming lessons.

-- Aggregation Reminder
-- An important thing to remember: aggregators only aggregate vertically - the values of a column. 
-- If you want to perform a calculation across rows, you would do this with simple arithmetic.

-- We saw this in the first lesson if you need a refresher, but the quiz in the next concept should 
-- assure you still remember how to aggregate across rows.

SELECT SUM(standard_qty) AS standard,
        SUM(gloss_qty) AS gloss,
        SUM(poster_qty) AS poster
FROM orders;