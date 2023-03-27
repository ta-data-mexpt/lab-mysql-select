SELECT au_id AS 'AUTHOR ID', au_lname AS 'LAST NAME', au_fname AS 'FIRST NAME' FROM authors;
SELECT title AS 'TITLE' FROM titles;
SELECT pub_name AS 'PUBLISHER' FROM publishers;

CREATE TEMPORARY TABLE tabla
SELECT au_id, au_lname, au_fname FROM authors
JOIN titles ON titles.title
JOIN publishers ON publishers.pub_name;

SELECT * FROM tabla  