-- In the accounts table, there is a column holding the website for each company. 
-- The last three digits specify what type of web address they are using. A list of extensions 
-- (and pricing) is provided here. Pull these extensions and provide how many of each website type 
-- exist in the accounts table.
SELECT RIGHT(website,3) as domain, COUNT(*) as domain_count
FROM accounts
GROUP BY 1
ORDER BY 2 DESC;

-- There is much debate about how much the name (or even the first letter of a company name) matters. 
-- Use the accounts table to pull the first letter of each company name to see the distribution of 
-- company names that begin with each letter (or number).
SELECT LEFT(name,1) as first_char, COUNT(*) as starting_char_count
FROM accounts
GROUP BY 1
ORDER BY 2 desc;

-- Use the accounts table and a CASE statement to create two groups: one group of company names that 
-- start with a number and a second group of those company names that start with a letter. What proportion 
-- of company names start with a letter?
WITH first as (SELECT LEFT(name,1) as first_char
				FROM accounts),
    is_num as ( SELECT CASE WHEN first_char IN 	('0','1','2','3','4','5','6','7','8','9')
                THEN 'number' ELSE 'letter' END AS num,
                COUNT(*) as num_count
                FROM first
                GROUP BY 1)
SELECT num as starting_with,num_count as num_of_companies 
FROM is_num

OR

SELECT SUM(num) nums, SUM(letter) letters
FROM (SELECT name, CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') 
                       THEN 1 ELSE 0 END AS num, 
         CASE WHEN LEFT(UPPER(name), 1) IN ('0','1','2','3','4','5','6','7','8','9') 
                       THEN 0 ELSE 1 END AS letter
      FROM accounts) t1;
-- Consider vowels as a, e, i, o, and u. What proportion of company names start with a vowel, and what 
-- percent start with anything else?

WITH vow as (SELECT name, CASE WHEN LEFT(UPPER(name),1) IN ('A','E','I','O','U')
            THEN 1 ELSE 0 END AS vowels,
            CASE WHEN  LEFT(UPPER(name),1) IN ('A','E','I','O','U')
            THEN 0 ELSE 1 END AS other
    FROM accounts)

SELECT SUM(vowels),SUM(other) 
FROM vow;