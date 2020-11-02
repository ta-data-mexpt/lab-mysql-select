#Challenge 1
#What titles each author has published at which publishers
SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', titles.title AS 'Title', publishers.pub_name AS 'Publisher'
FROM authors
LEFT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles 
ON titles.title_id = titleauthor.title_id 
INNER JOIN publishers 
ON  titles.pub_id = publishers.pub_id 
GROUP BY authors.au_id, titles.title, publishers.pub_name
ORDER BY authors.au_id;

#Challenge 2
# How many titles each author has published at each publisher
SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', titles.title AS 'Title', publishers.pub_name AS 'Publisher', count(titles.title) as 'Title_Count'
FROM authors
LEFT JOIN titleauthor 
ON authors.au_id = titleauthor.au_id 
inner JOIN titles 
ON titles.title_id = titleauthor.title_id
INNER JOIN publishers 
ON publishers.pub_id  = titles.pub_id 
GROUP BY 'Title_count', titles.title, publishers.pub_name, authors.au_id
ORDER BY authors.au_id DESC;

#Challenge 3
#Top 3 authors who have sold the highest number of titles
SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', sum(sales.qty) AS 'Total'
FROM authors 
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titles.title_id = titleauthor.title_id 
JOIN sales 
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY Total DESC
LIMIT 3;

#Challenge 4
#Best selling 23 authors ranking
SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', sum(sales.qty) AS 'Total'
FROM authors 
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id 
INNER JOIN sales 
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY Total DESC
LIMIT 23;

#Bonus challenge
# 3 Most profiting authors
SELECT authors.au_id AS 'Author ID', authors.au_lname AS 'Last Name', authors.au_fname AS 'First Name', SUM(titles.advance + titles.royalty) AS 'Profit'
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titles.title_id = titleauthor.title_id 
GROUP BY authors.au_id
ORDER BY Profit DESC
LIMIT 3;