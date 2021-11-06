/* Questions: DISTINCT

1. Use DISTINCT to test if there are any accounts associated with more than one region.

2. Have any sales reps worked on more than one account? */


SELECT a.id, r.name AS region
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
JOIN region r
ON r.id = s.region_id
GROUP BY a.id, r.name
ORDER BY a.id


SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY num_accounts;


SELECT DISTINCT id, name
FROM sales_reps;
