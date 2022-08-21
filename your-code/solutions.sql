-- Challenge 1

SELECT au.au_id, au.au_lname, au.au_fname, t.title, p.pub_name
FROM publications.authors au 
LEFT JOIN publications.titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN publications.titles t ON ta.title_id = t.title_id
LEFT JOIN publications.publishers p ON t.pub_id = p.pub_id
WHERE t.title IS NOT NULL
ORDER BY au.au_id ASC;

SELECT *
FROM publications.titleauthor;

-- Challenge 2
SELECT au.au_id, au.au_lname, au.au_fname, p.pub_name, COUNT(p.pub_name) AS 'title_count'
FROM publications.authors au 
LEFT JOIN publications.titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN publications.titles t ON ta.title_id = t.title_id
LEFT JOIN publications.publishers p ON t.pub_id = p.pub_id
WHERE t.title IS NOT NULL
GROUP BY au.au_lname, au.au_fname, p.pub_name
ORDER BY au.au_id DESC;

-- Challenge 3 
SELECT au.au_id, au.au_lname, au.au_fname, SUM(t.ytd_sales) AS 'Total_Sales'
FROM publications.authors au 
LEFT JOIN publications.titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN publications.titles t ON ta.title_id = t.title_id
LEFT JOIN publications.publishers p ON t.pub_id = p.pub_id
WHERE t.title IS NOT NULL
GROUP BY au.au_id
ORDER BY Total_Sales DESC
LIMIT 3;

-- Challenge 4	
SELECT au.au_id, au.au_lname, au.au_fname, SUM(t.ytd_sales) AS 'Total_Sales'
FROM publications.authors au 
LEFT JOIN publications.titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN publications.titles t ON ta.title_id = t.title_id
LEFT JOIN publications.publishers p ON t.pub_id = p.pub_id
WHERE t.title IS NOT NULL
GROUP BY au.au_id
ORDER BY Total_Sales DESC;

-- Bonus Challenge
SELECT au.au_id, au.au_lname, au.au_fname, SUM(t.royalty*(ta.royaltyper/100)) AS 'Royalty per Sale', (SUM('Royalty per Sale') + SUM(t.advance)) AS 'Profit'
FROM publications.authors au 
LEFT JOIN publications.titleauthor ta ON au.au_id = ta.au_id
LEFT JOIN publications.titles t ON ta.title_id = t.title_id
LEFT JOIN publications.publishers p ON t.pub_id = p.pub_id
WHERE t.title IS NOT NULL
GROUP BY au.au_id
ORDER BY Profit DESC
LIMIT 3;

