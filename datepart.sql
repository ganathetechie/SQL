/*Questions: Working With DATEs

Find the sales in terms of total dollars for all orders in each year, ordered from greatest to least. Do you notice any trends in the yearly sales totals?


Which month did Parch & Posey have the greatest sales in terms of total dollars? Are all months evenly represented by the dataset?


Which year did Parch & Posey have the greatest sales in terms of total number of orders? Are all years evenly represented by the dataset?


Which month did Parch & Posey have the greatest sales in terms of total number of orders? Are all months evenly represented by the dataset?


In which month of which year did Walmart spend the most on gloss paper in terms of dollars?*/


SELECT DATE_PART('year', occurred_at) as year_of_sale, SUM(total_amt_usd) as sum
FROM orders
GROUP BY DATE_PART('year', occurred_at)
ORDER BY DATE_PART('year', occurred_at)


SELECT DATE_PART('month', occurred_at) as month_of_sale, SUM(total_amt_usd) as sum
FROM orders
GROUP BY DATE_PART('month', occurred_at)
ORDER BY sum DESC
LIMIT 1


SELECT DATE_PART('year', occurred_at) as year_of_sale, SUM(total) as total_orders
FROM orders
GROUP BY DATE_PART('year', occurred_at)
ORDER BY total_orders DESC


SELECT DATE_PART('month', occurred_at) as month_of_sale, SUM(total) as total
FROM orders
GROUP BY DATE_PART('month', occurred_at)
ORDER BY total DESC
LIMIT 1


SELECT DATE_TRUNC('month', o.occurred_at) ord_date, SUM(o.gloss_amt_usd) tot_spent
FROM orders o
JOIN accounts a
ON a.id = o.account_id
WHERE a.name = 'Walmart'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;
