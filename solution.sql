SELECT au.au_id 'ID autor', au.au_lname 'Apellido', au.au_fname 'Nombre', ti.title 'Titulo', pu.pub_name 'Editores'
FROM titleauthor AS ta
INNER JOIN authors au ON ta.au_id = au.au_id 
INNER JOIN titles ti ON ta.title_id = ti.title_id
INNER JOIN publishers pu ON ti.pub_id = pu.pub_id
ORDER BY ti.title asc;

SELECT r.au_id 'ID autor', r.au_lname 'Apellido', r.au_fname 'Nombre', r.pub_name 'Editores', count( r.title) 'Cuenta de titulos' 
FROM (
SELECT au.au_id, au.au_lname, au.au_fname, ti.title , pu.pub_name
FROM titleauthor AS ta
INNER JOIN authors au ON ta.au_id = au.au_id 
INNER JOIN titles ti ON ta.title_id = ti.title_id
INNER JOIN publishers pu ON ti.pub_id = pu.pub_id) AS r
GROUP BY r.au_id, r.au_lname, r.au_fname, r.pub_name
ORDER BY r.au_id desc;

SELECT au.au_id 'ID autor', au.au_lname 'Apellido', au.au_fname 'Nombre',sum( sa.qty) 'Libros vendidos'
FROM titleauthor AS ta
INNER JOIN authors au ON ta.au_id = au.au_id 
INNER JOIN titles ti ON ta.title_id = ti.title_id
LEFT JOIN sales sa ON ti.title_id = sa.title_id
GROUP BY au.au_id
ORDER BY sa.qty desc
LIMIT 3;

SELECT au.au_id 'ID autor', au.au_lname 'Apellido', au.au_fname 'Nombre', IFNULL(SUM(sa.qty), 0) 'Libros vendidos'
FROM titleauthor AS ta
INNER JOIN authors au ON ta.au_id = au.au_id 
INNER JOIN titles ti ON ta.title_id = ti.title_id
LEFT JOIN sales sa ON ti.title_id = sa.title_id
GROUP BY au.au_id
ORDER BY sa.qty desc;




SELECT count(title_id)
FROM titleauthor

SELECT *
FROM titles

SELECT *
FROM publishers

SELECT sum(sales.qty)
FROM sales