CREATE DATABASE publications;
USE publications;

# Challenge 1
SELECT au.au_id 'Autor_ID',au.au_lname 'Lastname', au.au_fname 'Firstname',ti.title 'Title', pu.pub_name 'Publisher' 
FROM authors AS au
JOIN titleauthor AS tia ON au.au_id=tia.au_id
JOIN titles AS ti ON tia.title_id=ti.title_id
JOIN publishers AS pu ON pu.pub_id=ti.pub_id
ORDER BY au.au_id, ti.title desc;

# Challenge 2
SELECT au.au_id 'Autor_ID',au.au_lname 'Lastname', au.au_fname 'Firstname', pu.pub_name 'Publisher', count(pu.pub_name)
FROM authors AS au
INNER JOIN titleauthor AS tia ON au.au_id=tia.au_id
INNER JOIN titles AS ti ON tia.title_id=ti.title_id
INNER JOIN publishers AS pu ON pu.pub_id=ti.pub_id
GROUP BY Autor_ID, Publisher
ORDER BY Autor_ID DESC, Publisher DESC;

# Challenge 3
SELECT au.au_id 'Autor_ID',au.au_lname 'Lastname', au.au_fname 'Firstname', sum(sa.qty) AS 'Sales'
FROM authors AS au
INNER JOIN titleauthor AS tia ON au.au_id=tia.au_id
INNER JOIN titles AS ti ON tia.title_id=ti.title_id
INNER JOIN sales AS sa ON sa.title_id=ti.title_id
GROUP BY Autor_ID
ORDER BY Sales DESC LIMIT 3;

# Challenge 4
SELECT au.au_id 'Autor_ID',au.au_lname 'Lastname', au.au_fname 'Firstname', coalesce(sa.qty,0) AS 'Sales'
FROM authors AS au
LEFT JOIN titleauthor AS tia ON au.au_id=tia.au_id
LEFT JOIN titles AS ti ON tia.title_id=ti.title_id
LEFT JOIN sales AS sa ON sa.title_id=ti.title_id
GROUP BY Autor_ID
ORDER BY Sales DESC;