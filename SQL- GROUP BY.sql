SELECT *
FROM
(SELECT MIN(occurred_at) AS earliest_date, name as customer_name
FROM orders
JOIN accounts
ON accounts.id = orders.account_id
GROUP BY name) AS table1
ORDER BY earliest_date
LIMIT 1


SELECT SUM(total_amt_usd) AS total_sales, name
FROM orders
JOIN accounts
ON accounts.id = orders.account_id
GROUP BY Name
ORDER BY total_sales


SELECT MAX(occurred_at) AS latest_date, name, channel
FROM web_events
JOIN accounts
ON accounts.id = web_events.account_id
GROUP BY channel, name
ORDER BY latest_date
LIMIT 1



SELECT COUNT(*) , channel
FROM web_events
GROUP BY channel


SELECT primary_poc, MIN(occurred_at) as earliest
FROM web_events
JOIN accounts
ON accounts.id = web_events.account_id
GROUP BY primary_poc
ORDER BY earliest
LIMIT 1


SELECT MIN(total_amt_usd) AS total_usd, name
FROM orders
JOIN accounts
ON accounts.id = orders.account_id
GROUP BY name
ORDER BY total_usd

SELECT COUNT(sales_reps.name) AS number_of_sales_reps, region.name
FROM region
JOIN sales_reps
ON sales_reps.region_id = region.id
GROUP BY region.name
ORDER BY number_of_sales_reps