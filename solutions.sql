#CHALLENGE_1
SELECT publications.authors.au_id AS ID_AUTOR, publications.authors.au_fname AS NOMBRE_AUTOR,publications.authors.au_lname AS APELLIDO_AUTOR, 
 publications.titles.title AS TÍTULO, publications.publishers.pub_name AS EDITORIAL
FROM publications.authors
INNER JOIN publications.titleauthor
ON titleauthor.au_id= authors.au_id
INNER JOIN publications.titles
ON titles.title_id= titleauthor.title_id
INNER JOIN publications.publishers
ON 	publishers.pub_id=titles.pub_id

#CHALLENGE_2
SELECT publications.authors.au_id AS ID_AUTOR, 
publications.authors.au_fname AS NOMBRE_AUTOR,
publications.authors.au_lname AS APELLIDO_AUTOR, 
COUNT(publications.titles.title) AS NÚMERO_DE_TÍTULOS, 
publications.publishers.pub_name AS EDITORIAL
FROM publications.authors
INNER JOIN publications.titleauthor
ON titleauthor.au_id= authors.au_id
INNER JOIN publications.titles
ON titles.title_id= titleauthor.title_id
INNER JOIN publications.publishers
ON 	publishers.pub_id=titles.pub_id
GROUP BY publications.publishers.pub_name

# SUMA LO MISMO QUE EL RESULTADO DE ABAJO, POR LO QUE ES CORRECTO
SELECT COUNT(title_id) FROM titleauthor;

#CHALLENGE 3
ALTER TABLE sales MODIFY qty INT;
SELECT publications.titleauthor.au_id AS ID_AUTOR, 
publications.authors.au_lname AS APELLIDO_AUTOR, 
publications.authors.au_fname AS NOMBRE_AUTOR, 
SUM(publications.sales.qty) AS TOTAL_VENDIDOS
FROM publications.authors
INNER JOIN publications.titleauthor
ON titleauthor.au_id= authors.au_id
INNER JOIN publications.titles
ON titles.title_id= titleauthor.title_id
INNER JOIN publications.sales
ON 	sales.title_id=titles.title_id
GROUP BY publications.titleauthor.au_id
ORDER BY publications.sales.qty ASC LIMIT 3; 

#CHALLENGE 4
SELECT publications.titleauthor.au_id AS ID_AUTOR, 
publications.authors.au_lname AS APELLIDO_AUTOR, 
publications.authors.au_fname AS NOMBRE_AUTOR, 
SUM(publications.sales.qty) AS TOTAL_VENDIDOS
FROM publications.authors
INNER JOIN publications.titleauthor
ON titleauthor.au_id= authors.au_id
INNER JOIN publications.titles
ON titles.title_id= titleauthor.title_id
INNER JOIN publications.sales
ON 	sales.title_id=titles.title_id
GROUP BY publications.titleauthor.au_id
ORDER BY publications.sales.qty ASC;

#BONUS CHALLENGE
SELECT publications.titleauthor.au_id AS ID_AUTOR, 
publications.authors.au_lname AS APELLIDO_AUTOR, 
publications.authors.au_fname AS NOMBRE_AUTOR, 
SUM((((publications.titleauthor.royaltyper/100)*publications.titles.advance))+((publications.titleauthor.royaltyper/100)*publications.titles.ytd_sales*(publications.titles.royalty/100))) AS PROFIT
FROM publications.authors
INNER JOIN publications.titleauthor
ON titleauthor.au_id= authors.au_id
INNER JOIN publications.titles
ON titles.title_id= titleauthor.title_id
GROUP BY publications.titleauthor.au_id
ORDER BY PROFIT DESC LIMIT 3;