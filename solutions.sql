CREATE DATABASE pubs;

USE pubs;

SELECT * FROM authors;

#au_id, title_id
SELECT * FROM titleauthor;

#title_id, title, pub_id:
SELECT * FROM titles; 

#pub_id, pub_name
SELECT * FROM publishers;

#CHALLENGE 1 - Who Have Publised What At Where?
#What I want: Author ID, last name, first name, title, publisher
#From where:authors, titleauthor, titles, publishers

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, titles.title AS TITLE, publishers.pub_name AS PUBLISHER
FROM authors
LEFT JOIN titleauthor
USING(au_id)
LEFT JOIN titles
USING(title_id)
LEFT JOIN publishers
USING(pub_id)
ORDER BY authors.au_id;

#CHALLENGE 2 - Who Have Published How Many At Where?
#What I want: Author ID, last name, first name,  publisher, Title Count
#From where:authors, titleauthor, titles, publishers

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, publishers.pub_name AS PUBLISHER, COUNT(titles.title) AS TITLE_COUNT
FROM authors
LEFT JOIN titleauthor
USING(au_id)
LEFT JOIN titles
USING(title_id)
LEFT JOIN publishers
USING(pub_id)
GROUP BY authors.au_id, publishers.pub_name
ORDER BY authors.au_id DESC;

#CHALLENGE 3 - Best Selling Authors
#What I want: Author ID, last name, first name,  total (total num of titles sold from author)
#From where:authors, titleauthor, sales.qty

#title_id
SELECT * FROM sales;

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, SUM(sales.qty) AS TOTAL
FROM authors
LEFT JOIN titleauthor
USING(au_id)
LEFT JOIN sales
USING(title_id)
GROUP BY authors.au_id
ORDER BY TOTAL DESC LIMIT 3;

#CHALLENGE 4 - Best Selling Authors Ranking
#What I want: Author ID, last name, first name,  total (total num of titles sold from author)
#From where:authors, titleauthor, sales.qty

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, IFNULL(SUM(sales.qty),0) AS TOTAL
FROM authors
LEFT JOIN titleauthor
USING(au_id)
LEFT JOIN sales
USING(title_id)
GROUP BY authors.au_id
ORDER BY TOTAL DESC;

#BONUS - Most Profiting Authors
#What I want: Author ID, last name, first name,  profit= advance and royalties (high to low only first 3)
#From where:authors, titleauthor, titles.advance, roysched.royalty

#royalty
SELECT * FROM roysched;

SELECT authors.au_id AS AUTHOR_ID, authors.au_lname AS LAST_NAME, authors.au_fname AS FIRST_NAME, (SUM(titles.advance)+SUM(titles.royalty)) AS PROFIT
FROM authors
LEFT JOIN titleauthor
USING(au_id)
LEFT JOIN titles
USING(title_id)

GROUP BY authors.au_id
ORDER BY PROFIT DESC LIMIT 3;


