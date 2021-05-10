CREATE DATABASE publications;
USE publications;

CREATE TABLE CHALLENGE_1
SELECT a.au_id, au_fname, au_lname, t.title, pub_name 
FROM authors a
JOIN titleauthor ta
	ON a.au_id = ta.au_id
JOIN titles t
	ON ta.title_id = t.title_id
JOIN publishers p
	ON t.pub_id = p.pub_id;

CREATE TABLE CHALLENGE_2    
SELECT a.au_id, au_lname, au_fname, pub_name, COUNT(title)
FROM authors a
JOIN titleauthor ta
	ON a.au_id = ta.au_id
JOIN titles t
	ON ta.title_id = t.title_id
JOIN publishers p
	ON t.pub_id = p.pub_id
GROUP BY a.au_id
ORDER BY au_id DESC;

CREATE TABLE CHALLENGE_3
SELECT a.au_id, a.au_lname, a.au_fname, sum(t.ytd_sales) AS total
FROM authors a
JOIN titleauthor ta
	ON a.au_id = ta.au_id
JOIN titles t
	ON ta.title_id = t.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY total DESC   
LIMIT 3;

CREATE TABLE CHALLENGE_4
SELECT authors.au_id, authors.au_lname, authors.au_fname, IFNULL(SUM(sales.qty),0) AS 'TOTAL'
FROM publications.authors
JOIN publications.titleauthor
	ON authors.au_id=titleauthor.au_id
JOIN publications.titles
	ON titleauthor.title_id=titles.title_id
JOIN publications.sales
	ON titles.title_id=sales.title_id
GROUP BY publications.authors.au_id
ORDER BY SUM(sales.qty) DESC;
 