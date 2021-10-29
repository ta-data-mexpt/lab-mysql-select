# Challenge 1 
SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME",
titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER"
FROM AUTHORS
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id;

# Challenge 2
SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME",
publishers.pub_name AS "PUBLISHER",
COUNT(titles.pub_id) as "TITLE COUNT"
FROM AUTHORS
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY titleauthor.au_id;


# Challenge 3
SELECT authors.au_id AS "AUTHOR ID",
authors.au_fname AS "FIRST NAME",
authors.au_lname AS "LAST NAME",  
SUM(qty) as "TOTAL"
from SALES
LEFT JOIN titleauthor
ON sales.title_id = titleauthor.title_id
LEFT JOIN authors
ON titleauthor.au_id = authors.au_id
GROUP BY authors.au_id
order by SUM(qty)  desc
limit 3;


# Challenge 4
SELECT authors.au_id AS "AUTHOR ID",
authors.au_fname AS "FIRST NAME",
authors.au_lname AS "LAST NAME",  
SUM(qty) as "TOTAL"
from authors
LEFT OUTER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT OUTER JOIN sales
ON titleauthor.title_id = sales.title_id
GROUP BY authors.au_id
order by SUM(qty)  desc;




