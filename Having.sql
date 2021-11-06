/*Questions: HAVING

How many of the sales reps have more than 5 accounts that they manage?

How many accounts have more than 20 orders?

Which account has the most orders?

Which accounts spent more than 30,000 usd total across all orders?

Which accounts spent less than 1,000 usd total across all orders?

Which account has spent the most with us?

Which account has spent the least with us?

Which accounts used facebook as a channel to contact customers more than 6 times?

Which account used facebook most as a channel?

Which channel was most frequently used by most accounts?*/




SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
HAVING COUNT(*) > 5
ORDER BY num_accounts;



SELECT a.id as acc, COUNT(*) num_of_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY acc
HAVING COUNT(*) > 20
ORDER BY num_of_orders;


SELECT a.id as acc, COUNT(*) num_of_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY acc
ORDER BY num_of_orders DESC
LIMIT 1


SELECT a.id as acc, SUM(total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY acc
HAVING SUM(total_amt_usd) > 30000
ORDER BY total_spent


SELECT a.id as acc, SUM(total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY acc
HAVING SUM(total_amt_usd) < 1000
ORDER BY total_spent


SELECT a.id as acc, SUM(total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY acc
ORDER BY total_spent DESC
LIMIT 1


SELECT a.id as acc, SUM(total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY acc
ORDER BY total_spent
LIMIT 1


SELECT a.id, channel, COUNT(*) as attempts
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
WHERE channel = 'facebook'
GROUP BY a.id, channel
HAVING COUNT(*) > 6
ORDER BY a.id


SELECT a.id, channel, COUNT(*) as attempts
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
WHERE channel = 'facebook'
GROUP BY a.id, channel
ORDER BY attempts DESC
LIMIT 1

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10;
