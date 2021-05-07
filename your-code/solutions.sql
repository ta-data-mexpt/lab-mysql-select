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
    
 