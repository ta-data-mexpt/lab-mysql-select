
## EJERCICIO 1
CREATE TEMPORARY TABLE tabla_1
select a.au_id as AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, p.title AS TITLE,  x.pub_name AS PUBLISHER
from publications.authors as a
join publications.titleauthor as t
on a.au_id = t.au_id
join publications.titles as p
on p.title_id = t.title_id
join publications.publishers as x
on p.pub_id = x.pub_id

## EJERCICIO 2
SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, COUNT(AUTHOR_ID) AS 'TITLE_COUNT'
FROM tabla_1
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER
ORDER BY COUNT(AUTHOR_ID)  DESC;

##EJERCICIO 3 
CREATE TEMPORARY TABLE tabla_2
select a.au_id as AUTHOR_ID, a.au_lname AS LAST_NAME, a.au_fname AS FIRST_NAME, p.title AS TITLE,  x.pub_name AS PUBLISHER, z.qty as VENTAS
from publications.authors as a
join publications.titleauthor as t
on a.au_id = t.au_id
join publications.titles as p
on p.title_id = t.title_id
join publications.publishers as x
on p.pub_id = x.pub_id
join publications.sales as z
on p.title_id = z.title_id 

SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, SUM(VENTAS) AS TOTAL
FROM tabla_2
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC
LIMIT 3;

# EJERCICO 4 

SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, SUM(VENTAS) AS TOTAL
FROM tabla_2
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC
LIMIT 23;