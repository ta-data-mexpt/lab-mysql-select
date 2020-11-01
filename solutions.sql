SELECT authors.au_id AS Author_ID, authors.au_lname AS Last_Name, authors.au_fname AS First_Name, titles.title AS Title, publishers.pub_name AS Publisher
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id;

SELECT authors.au_id AS Author_ID, authors.au_lname AS Last_Name, authors.au_fname AS First_Name, COUNT(DISTINCT titles.title) AS Title_Count, publishers.pub_name AS Publisher
FROM authors
INNER JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, publishers.pub_name ;

SELECT  authors.au_id AS Author_ID, authors.au_lname AS Last_Name, authors.au_fname AS First_Name, SUM(sales.qty) AS Total
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id 
ORDER BY Total DESC 
LIMIT 3;

SELECT  authors.au_id AS Author_ID, authors.au_lname AS Last_Name, authors.au_fname AS First_Name, SUM(sales.qty) AS Total
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id 
ORDER BY Total DESC ;

SELECT  authors.au_id AS Author_ID, authors.au_lname AS Last_Name, authors.au_fname AS First_Name, ((SUM(sales.qty) * titles.royalty) + titles.advance) * titleauthor.royaltyper/100 AS Profit
FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titles.title_id = sales.title_id
GROUP BY authors.au_id 
ORDER BY Profit DESC 
LIMIT 3;