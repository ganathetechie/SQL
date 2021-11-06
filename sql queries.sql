SELECT a.name AS acc_name, r.name AS region_name, s.name as sales_rep
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON r.id = s.region_id
WHERE r.name = 'Midwest' 
ORDER BY a.name



SELECT a.name AS acc_name, r.name AS region_name, s.name as sales_rep
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON r.id = s.region_id
WHERE r.name = 'Midwest' AND s.name LIKE 'S%'
ORDER BY a.name


SELECT a.name AS acc_name, r.name AS region_name, s.name as sales_rep
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON r.id = s.region_id
WHERE r.name = 'Midwest' AND s.name LIKE '% K%'
ORDER BY a.name


SELECT a.name AS acc_name, r.name AS region_name, o.total_amt_usd/(o.total+0.0001) AS unit_price
FROM accounts a
JOIN orders o
ON a.id = o.account_id
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id 
WHERE o.standard_qty > 100


SELECT a.name AS acc_name, r.name AS region_name, o.total_amt_usd/(o.total+0.0001) AS unit_price
FROM accounts a
JOIN orders o
ON a.id = o.account_id
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON s.region_id = r.id 
WHERE o.standard_qty > 100 AND o.poster_qty > 50


SELECT DISTINCT accounts.name as acc_name, web_events.channel as channel
FROM accounts
JOIN web_events
ON accounts.id = web_events.account_id
WHERE accounts.id = 1001 


