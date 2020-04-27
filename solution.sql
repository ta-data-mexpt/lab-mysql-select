USE Solutions;

SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM Solutions.authors
INNER JOIN Solutions.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN Solutions.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN Solutions.publishers
ON titles.pub_id = publishers.pub_id;

SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name,
COUNT(authors.au_id) as TITLE_COUNT
FROM Solutions.authors
INNER JOIN  Solutions.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN Solutions.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN Solutions.publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name;

SELECT authors.au_id, authors.au_lname, authors.au_fname, 
SUM(sales.qty) as TOTAL
FROM Solutions.authors
INNER JOIN  Solutions.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN Solutions.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN Solutions.sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC
LIMIT 3;

SELECT authors.au_id, authors.au_lname, authors.au_fname, 
IFNULL(SUM(sales.qty), 0) as TOTAL
FROM Solutions.authors
INNER JOIN  Solutions.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN Solutions.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN Solutions.sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id, authors.au_lname, authors.au_fname
ORDER BY TOTAL DESC;

