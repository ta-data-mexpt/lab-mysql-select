CREATE DATABASE publications;

USE publications;

SELECT * FROM titleauthor;

CREATE TABLE author_auid
SELECT au_id, au_lname, au_fname FROM authors
JOIN titleauthor USING(au_id);

SELECT * FROM author_auid;

CREATE TEMPORARY TABLE lab_titulos
SELECT * FROM author_auid
JOIN titleauthor USING(au_id);

SELECT * FROM lab_titulos;

CREATE TEMPORARY TABLE titulo_nombre_ok_ok
SELECT * FROM lab_titulos
JOIN titles USING(title_id);

SELECT * FROM titulo_nombre_ok_ok;

CREATE TABLE tabla_final
SELECT * FROM titulo_nombre_ok_ok
JOIN publishers USING(pub_id);

SELECT * FROM tabla_final;

CREATE TABLE tabla_final_final
SELECT au_id, au_lname, au_fname, title, pub_name FROM tabla_final;


