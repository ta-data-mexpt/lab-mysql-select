USE publications;

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, ts.title AS TITLE, pub_name AS PUBLISHER
FROM authors a
LEFT JOIN titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN titles ts
ON ta.title_id = ts.title_id
LEFT JOIN publishers pu
ON ts.pub_id = pu.pub_id
GROUP BY 1, 5;


SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, pub_name AS PUBLISHER , COUNT(ts.title) AS TITLE_COUNT
FROM authors a
LEFT JOIN titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN titles ts
ON ta.title_id = ts.title_id
LEFT JOIN publishers pu
ON ts.pub_id = pu.pub_id
GROUP BY 1, 4;


SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, COUNT(s.qty) TOTAL 
FROM authors a
LEFT JOIN titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN titles ts
ON ta.title_id = ts.title_id
LEFT JOIN sales s
ON ts.title_id = s.title_id
GROUP BY 1
ORDER BY 4 DESC
LIMIT 3;

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, COUNT(s.qty) TOTAL 
FROM authors a
LEFT JOIN titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN titles ts
ON ta.title_id = ts.title_id
LEFT JOIN sales s
ON ts.title_id = s.title_id
GROUP BY 1
ORDER BY 4 DESC;

SELECT a.au_id AS AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, SUM(ts.royalty + ts.advance) PROFIT
FROM authors a
LEFT JOIN titleauthor ta
ON a.au_id = ta.au_id
LEFT JOIN titles ts
ON ta.title_id = ts.title_id
GROUP BY 1
ORDER BY 4 DESC
LIMIT 3;

