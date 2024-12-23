SELECT
  refresh_date AS Day,
  term AS Top_Term,
  rank
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
  rank = 1
  AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) 
GROUP BY Day, Top_Term, rank
ORDER BY Day DESC
  
SELECT
  refresh_date AS Day,
  term AS Top_Term,
  rank
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
  rank <= 3 
  AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) 
GROUP BY Day, Top_Term, rank
ORDER BY Day DESC, rank ASC 
  
SELECT
  refresh_date AS Day,
  term AS Top_Term,
  rank
FROM `bigquery-public-data.google_trends.top_terms`
WHERE
  rank <= 3 
  AND Region = 'United Kingdom'
  AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) 
GROUP BY Day, Top_Term, rank
ORDER BY Day DESC, rank ASC 

SELECT
  t.refresh_date AS Day,
  t.term AS Top_Term,
  t.rank,
  c.category AS Category 
FROM `bigquery-public-data.google_trends.top_terms` AS t
LEFT JOIN `bigquery-public-data.google_trends.term_categories` AS c
  ON t.term = c.term 
WHERE
  t.rank <= 3 
  AND t.refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 1 MONTH) 
GROUP BY Day, Top_Term, t.rank, Category
ORDER BY Day DESC, t.rank ASC 
