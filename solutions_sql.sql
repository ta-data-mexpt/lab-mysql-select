#CHALLENGE 1

#author_id es au_id de tabla authors 
#last name es au_lname de tabla authors 
#first name es au_fname de tabla authors 
#title es title de tabla titles
#publisher es pub_name de tabla publishers 

#titleauthor y authors se conectan con key author_id
#titles y titleauthors se conectan con key title_id
#publishers y titles se conectan con key pub_id

SELECT aut.au_id AS "AUTHOR_ID", 
aut.au_lname AS "LAST_NAME",
aut.au_fname AS "FIRST_NAME", 
tit.title AS "TITLE", 
pub.pub_name AS "PUBLISHER"

FROM publications.authors AS aut
INNER JOIN publications.titleauthor AS titaut ON aut.au_id = titaut.au_id 
LEFT JOIN publications.titles AS tit ON titaut.title_id = tit.title_id 
LEFT JOIN publications.publishers AS pub ON tit.pub_id = pub.pub_id

GROUP BY 
AUTHOR_ID, 
TITLE,
PUBLISHER

ORDER BY 
PUBLISHER DESC
;


#CHALLENGE 2 
#mismo query que arriba pero con count 

SELECT aut.au_id AS "AUTHOR_ID", 
aut.au_lname AS "LAST_NAME",
aut.au_fname AS "FIRST_NAME", 
tit.title AS "TITLE", 
pub.pub_name AS "PUBLISHER",
COUNT(tit.title) AS "TITLE_COUNT"

FROM publications.authors AS aut
INNER JOIN publications.titleauthor AS titaut ON aut.au_id = titaut.au_id 
LEFT JOIN publications.titles AS tit ON titaut.title_id = tit.title_id 
LEFT JOIN publications.publishers AS pub ON tit.pub_id = pub.pub_id

GROUP BY 
AUTHOR_ID,
TITLE, 
PUBLISHER

ORDER BY 
AUTHOR_ID DESC
;

#para comprobar la suma de title_count debe ser igual a las filas en la tabla de titleauthor 
#LA RESPUESTA ES 25 

SELECT SUM(subquery.TITLE_COUNT)

FROM(
SELECT aut.au_id AS "AUTHOR_ID", 
aut.au_lname AS "LAST_NAME",
aut.au_fname AS "FIRST_NAME", 
tit.title AS "TITLE", 
pub.pub_name AS "PUBLISHER",
COUNT(DISTINCT(tit.title)) AS "TITLE_COUNT"

FROM publications.authors AS aut
INNER JOIN publications.titleauthor AS titaut ON aut.au_id = titaut.au_id 
LEFT JOIN publications.titles AS tit ON titaut.title_id = tit.title_id 
LEFT JOIN publications.publishers AS pub ON tit.pub_id = pub.pub_id

GROUP BY 
AUTHOR_ID,
TITLE, 
PUBLISHER

ORDER BY 
AUTHOR_ID DESC
) AS subquery
;

#CHALLENGE 3

#author_id es au_id de tabla authors 
#last name es au_lname de tabla authors 
#first name es au_fname de tabla authors 
#total es la suma de los libros vendidos por el autor 

#las unidades es qty y viene en tabla sales 
#el precio es price y viene en tabla titles 
#ventas por título es la suma de las unidades vendidas multiplicado por el precio

#titleauthor y authors se conectan con key author_id
#titleauthor y titles se conectan con key title_id
#sales y titles se conectan con key title_id


SELECT aut.au_id AS "AUTHOR_ID", 
aut.au_lname AS "LAST_NAME",
aut.au_fname AS "FIRST_NAME",  
SUM(sal.qty) AS "TOTAL"

FROM publications.authors AS aut
INNER JOIN publications.titleauthor AS titaut ON aut.au_id = titaut.au_id 
LEFT JOIN publications.titles AS tit ON titaut.title_id = tit.title_id 
LEFT JOIN publications.sales AS sal ON tit.title_id = sal.title_id

GROUP BY 
AUTHOR_ID

ORDER BY 
TOTAL DESC

LIMIT 3
;


#CHALLENGE 4 
#solo es quitar limit para que muestre todo 

SELECT aut.au_id AS "AUTHOR_ID", 
aut.au_lname AS "LAST_NAME",
aut.au_fname AS "FIRST_NAME",  
SUM(sal.qty) AS "TOTAL"

FROM publications.authors AS aut
INNER JOIN publications.titleauthor AS titaut ON aut.au_id = titaut.au_id 
LEFT JOIN publications.titles AS tit ON titaut.title_id = tit.title_id 
LEFT JOIN publications.sales AS sal ON tit.title_id = sal.title_id

GROUP BY 
AUTHOR_ID

ORDER BY 
TOTAL DESC
;

#BONUSSSS
#An advance is the money that the publisher pays the author before the book comes out. 
#The royalties the author will receive is typically a percentage of the entire book sales. 
#The total profit an author receives by publishing a book is the sum of the advance and the royalties.
#advance viene en tabla titles y es una cantidad ligada al royaltyper de tabla titleauthor
#tabla titles tiene royalty, ytd_sales por lo tanto royalties es = royalty * ytd_sales


SELECT aut.au_id AS "AUTHOR_ID", 
aut.au_lname AS "LAST_NAME",
aut.au_fname AS "FIRST_NAME",  
(titaut.royaltyper/100)*tit.advance AS "ADVANCE", #dividir entre 100 porque es porcentaje 
(tit.royalty/100)*tit.ytd_sales AS "ROYALTY",
ADVANCE + ROYALTY AS "PROFIT"


FROM publications.authors AS aut
INNER JOIN publications.titleauthor AS titaut ON aut.au_id = titaut.au_id 
LEFT JOIN publications.titles AS tit ON titaut.title_id = tit.title_id 

GROUP BY 
AUTHOR_ID, ADVANCE, ROYALTY, PROFIT

ORDER BY 
PROFIT DESC
;

