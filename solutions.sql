USE mysql_select;
-----------------------------------------------------------------------------------------------------------------
/*
Challenge 1 - Who Have Published What At Where?
*/

SELECT aut.au_id AS 'Author ID'
	, aut.au_lname AS 'Lastname'
    , aut.au_fname AS 'Firstname'
    , tit.title AS 'Title'
    , pub.pub_name AS 'Publisher'
FROM authors AS aut
INNER JOIN titleauthor AS tit_a
	ON aut.au_id = tit_a.au_id
INNER JOIN titles AS tit
	ON tit.title_id = tit_a.title_id
INNER JOIN publishers AS pub
	ON tit.pub_id = pub.pub_id;

-----------------------------------------------------------------------------------------------------------------
/*
Challenge 2 - Who Have Published How Many At Where?
*/

SELECT aut.au_id AS 'Author ID'
	, aut.au_lname AS 'Lastname'
    , aut.au_fname AS 'Firstname'
    , pub.pub_name AS 'Publisher'
    , COUNT(DISTINCT tit.title_id) AS 'Title_Count'
FROM authors AS aut
INNER JOIN titleauthor AS tit_a
	ON aut.au_id = tit_a.au_id
INNER JOIN titles AS tit
	ON tit.title_id = tit_a.title_id
INNER JOIN publishers AS pub
	ON tit.pub_id = pub.pub_id
GROUP BY aut.au_id
	, aut.au_lname
    , aut.au_fname
    , pub.pub_name
ORDER BY Title_Count DESC;

-----------------------------------------------------------------------------------------------------------------
/*
Challenge 3 - Best Selling Authors
*/

SELECT aut.au_id AS 'Author ID'
	, aut.au_lname AS 'Lastname'
    , aut.au_fname AS 'Firstname'
    , SUM(qty) AS 'Total'
FROM authors AS aut
INNER JOIN titleauthor AS tit_a
	ON aut.au_id = tit_a.au_id
INNER JOIN titles AS tit
	ON tit.title_id = tit_a.title_id
INNER JOIN sales as sal
	ON sal.title_id = tit.title_id
GROUP BY aut.au_id
	, aut.au_lname
    , aut.au_fname
ORDER BY Total DESC
LIMIT 3;

-----------------------------------------------------------------------------------------------------------------
/*
Challenge 4 - Best Selling Authors Ranking
*/

SELECT aut.au_id AS 'Author ID'
	, aut.au_lname AS 'Lastname'
    , aut.au_fname AS 'Firstname'
    , IFNULL(SUM(qty), 0) AS 'Total'
FROM authors AS aut
LEFT JOIN titleauthor AS tit_a
	ON aut.au_id = tit_a.au_id
LEFT JOIN titles AS tit
	ON tit.title_id = tit_a.title_id
LEFT JOIN sales as sal
	ON sal.title_id = tit.title_id
GROUP BY aut.au_id
	, aut.au_lname
    , aut.au_fname
ORDER BY Total DESC;
    
-----------------------------------------------------------------------------------------------------------------
/*
Bonus Challenge - Most Profiting Authors
*/

SELECT aut.au_id
	, aut.au_lname
    , aut.au_fname
    , ((tit.price * sal.qty * (tit.royalty/100)) + tit.advance) * (tit_a.royaltyper/100) AS 'Profit'
FROM authors AS aut
LEFT JOIN titleauthor AS tit_a
	ON aut.au_id = tit_a.au_id
LEFT JOIN titles AS tit
	ON tit.title_id = tit_a.title_id
LEFT JOIN sales AS sal
	ON sal.title_id = tit.title_id
LEFT JOIN stores AS sto
	ON sto.stor_id = sal.stor_id
GROUP BY aut.au_id
	, aut.au_lname
    , aut.au_fname
ORDER BY Profit DESC
LIMIT 3;





------------------------------------------------------------------------------------------------------
#Fooling around

SELECT aut.au_id
	, aut.au_lname
    , aut.au_fname
    , tit_a.title_id
    , tit.advance
    , tit_a.royaltyper
    , tit.royalty
    , tit.price
    , sal.qty
    , ((tit.price * sal.qty * (tit.royalty/100)) + tit.advance) * (tit_a.royaltyper/100) AS 'Profit'
    , (SELECT COUNT(TA.au_id) AS num_authors FROM titles AS T INNER JOIN titleauthor AS TA ON TA.title_id = T.title_id WHERE T.title_id = tit_a.title_id GROUP BY TA.title_id) AS num_authors
FROM authors AS aut
INNER JOIN titleauthor AS tit_a
	ON aut.au_id = tit_a.au_id
INNER JOIN titles AS tit
	ON tit.title_id = tit_a.title_id
INNER JOIN sales AS sal
	ON sal.title_id = tit.title_id
INNER JOIN stores AS sto
	ON sto.stor_id = sal.stor_id
INNER JOIN discounts AS dis
	ON dis.stor_id = sto.stor_id
GROUP BY aut.au_id
	, aut.au_lname
    , aut.au_fname
    , tit_a.title_id
    , tit.advance
    , tit_a.royaltyper
    , tit.royalty
    , tit.price
    , sal.qty
ORDER BY Profit DESC;

