
-- For each account, determine the average amount of each type of paper they purchased across their orders.
-- Your result should have four columns - one for the account name and one for the average quantity purchased for each of the paper types for each account.
SELECT name,
	   AVG(standard_qty) AS standard_qty,
       AVG(gloss_qty) AS gloss_qty,
       AVG(poster_qty) AS poster_qty
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
GROUP BY name



-- For each account, determine the average amount spent per order on each paper type.
--Your result should have four columns - one for the account name and one for the average amount spent on each paper type.

SELECT name,
	   AVG(standard_amt_usd) AS standard_avg,
       AVG(gloss_amt_usd) AS gloss_avg,
       AVG(poster_amt_usd) AS poster_avg
FROM orders
JOIN accounts
ON orders.account_id = accounts.id
GROUP BY name

--Determine the number of times a particular channel was used in the web_events table for each sales rep. Your final table should have three columns -
-- the name of the sales rep, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.

SELECT sales_reps.name AS sales_rep_name, channel, COUNT(*) AS Count_value
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN sales_reps
ON sales_reps.id = accounts.sales_rep_id
GROUP BY sales_reps.name, channel
ORDER BY Count_value DESC



--Determine the number of times a particular channel was used in the web_events table for each region. Your final table should have three columns
-- the region name, the channel, and the number of occurrences. Order your table with the highest number of occurrences first.

SELECT region.name AS region, channel, COUNT(*) AS Count_value
FROM web_events
JOIN accounts
ON web_events.account_id = accounts.id
JOIN sales_reps
ON sales_reps.id = accounts.sales_rep_id
JOIN region
ON region.id = sales_reps.region_id
GROUP BY region, channel
ORDER BY Count_value DESC
