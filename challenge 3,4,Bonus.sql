SELECT authors.au_id as Author_ID, authors.au_lname as Last_Name, authors.au_fname as First_Name, 
sum(sales.qty) as TOTAL
FROM publications_labjoinsactions.authors
INNER JOIN  publications_labjoinsactions.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications_labjoinsactions.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications_labjoinsactions.sales
ON titles.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname#, sales.title_id
order by TOTAL desc;

SELECT authors.au_id as Author_ID, authors.au_lname as Last_Name, authors.au_fname as First_Name, 
sum(sales.qty) as TOTAL
FROM publications_labjoinsactions.authors
INNER JOIN  publications_labjoinsactions.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications_labjoinsactions.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications_labjoinsactions.sales
ON titles.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname#, sales.title_id
order by TOTAL desc
limit 5;
# Se muestra 5 debido a que se observa que hay 3 autores que comparten la misma cantidad de libros vendidos

SELECT authors.au_id as Author_ID, authors.au_lname as Last_Name, authors.au_fname as First_Name, 
sum(sales.qty) as TOTAL
FROM publications_labjoinsactions.authors
INNER JOIN  publications_labjoinsactions.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications_labjoinsactions.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications_labjoinsactions.sales
ON titles.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname#, sales.title_id
order by TOTAL desc
limit 23;

# Ejercicio_bonus PROFIT
SELECT authors.au_id as Author_ID, authors.au_lname as Last_Name, authors.au_fname as First_Name, 
sum(sales.qty) as TOTAL, sum(titles.advance + (sales.qty * (titles.royalty / 100))) as PROFIT
FROM publications_labjoinsactions.authors
INNER JOIN  publications_labjoinsactions.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications_labjoinsactions.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications_labjoinsactions.sales
ON titles.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname#, sales.title_id
order by PROFIT desc;

# Trate de hacer la comprobación, pero me no tuve idea de como encontrar que un libro tuvo dos autores y a su vez dividir
# la ganancia entre el número de autores que tiene un libro.
SELECT authors.au_id as Author_ID, authors.au_lname as Last_Name, authors.au_fname as First_Name, 
titles.title as Tittle, sum(sales.qty) as Unid_vendidas, titles.price as Precio_Unidad, 
sum(sales.qty * titles.price) as Venta, titles.royalty as Porcentaje_ganancia,
sum((sales.qty * titles.price) * (titles.royalty / 100)) as Ganancia_de_ventas, 
titles.advance as Adelanto_dinero, 
sum((sales.qty * titles.price) * (titles.royalty / 100) + titles.advance) AS Ganancia_Total
FROM publications_labjoinsactions.authors
INNER JOIN  publications_labjoinsactions.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications_labjoinsactions.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications_labjoinsactions.sales
ON titles.title_id = sales.title_id
group by authors.au_id, authors.au_lname, authors.au_fname
#order by Tittle;
order by Tittle;