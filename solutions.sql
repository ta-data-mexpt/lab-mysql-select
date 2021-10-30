SELECT t.title AS 'TITLE', p.pub_name as 'PUBLISHER', au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME'
FROM titles AS t
INNER JOIN publishers AS p
ON t.pub_id=p.pub_id
INNER JOIN titleauthor as ta
USING(title_id)
INNER JOIN authors as a
USING(au_id);

SELECT p.pub_name as 'PUBLISHER', au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME',COUNT(t.title) AS 'TITLE COUNT'
FROM titles AS t
INNER JOIN publishers AS p
ON t.pub_id=p.pub_id
INNER JOIN titleauthor as ta
USING(title_id)
INNER JOIN authors as a
USING(au_id)
GROUP BY au_id, p.pub_id;

SELECT au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', SUM(s.qty) AS 'TOTAL'
FROM sales AS s
INNER JOIN titleauthor
USING(title_id)
RIGHT JOIN authors AS a
USING(au_id)
GROUP BY au_id
ORDER BY TOTAL desc
LIMIT 3;

SELECT au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', COALESCE(SUM(s.qty), 0) AS 'TOTAL'
FROM sales AS s
INNER JOIN titleauthor
USING(title_id)
RIGHT JOIN authors AS a
USING(au_id)
GROUP BY au_id
ORDER BY TOTAL desc;

SELECT a.au_id AS 'AUTHOR ID', a.au_lname AS 'LAST NAME', a.au_fname AS 'FIRST NAME', (ta.royaltyper/100)*t.advance + (ta.royaltyper/100)*SUM(s.qty)*t.price AS 'PROFIT'
FROM authors AS a
LEFT JOIN titleauthor as ta
ON a.au_id = ta.au_id
LEFT JOIN titles as t
ON ta.title_id = t.title_id
LEFT JOIN sales as s
ON s.title_id = ta.title_id
GROUP BY a.au_id
ORDER BY PROFIT desc
LIMIT 3;

