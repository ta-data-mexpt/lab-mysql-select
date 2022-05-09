SELECT * FROM publications.authors;

SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name as PUBLISHER
FROM authors 
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id;


SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, COUNT(DISTINCT(titles.title)) AS TITLE_COUNT, publishers.pub_name as PUBLISHER
FROM authors 
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY AUTHOR_ID, PUBLISHER;

SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, SUM(sales.qty) AS TOTAL
FROM authors 
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY AUTHOR_ID 
ORDER BY TOTAL DESC
LIMIT 3;

SELECT authors.au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, COALESCE(SUM(sales.qty),0) AS TOTAL
FROM authors 
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
INNER JOIN titles ON titleauthor.title_id = titles.title_id
INNER JOIN sales ON titles.title_id = sales.title_id
GROUP BY AUTHOR_ID 
ORDER BY TOTAL DESC;




