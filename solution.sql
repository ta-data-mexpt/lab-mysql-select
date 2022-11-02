
SELECT titleauthor.au_id AS "AUTHOR ID" ,  authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER" 
FROM authors
JOIN titleauthor
USING (au_ID)
JOIN titles
USING (title_id)
JOIN publishers
USING (pub_id);

SELECT titleauthor.au_id AS "AUTHOR ID" ,  authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", COUNT(titles.title) AS "TITLE", publishers.pub_name AS "PUBLISHER" 
FROM authors
JOIN titleauthor
USING (au_ID)
JOIN titles
USING (title_id)
JOIN publishers
USING (pub_id)
GROUP BY titleauthor.au_id, publishers.pub_name;

SELECT authors.au_id AS "AUTHOR ID" ,  authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",  SUM(sales.qty) AS "TOTAL"
FROM authors
JOIN titleauthor
USING (au_ID)
JOIN roysched
USING (title_id)
JOIN sales
USING (title_id)
GROUP BY au_id 
ORDER BY SUM(sales.qty) DESC
LIMIT 3;


SELECT authors.au_id AS "AUTHOR ID" ,  authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME",  IFNULL(SUM(sales.qty),0) AS "TOTAL"
FROM authors
LEFT JOIN titleauthor
USING (au_ID)
LEFT JOIN roysched
USING (title_id)
LEFT JOIN sales
USING (title_id)
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC;