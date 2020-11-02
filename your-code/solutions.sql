
SELECT
a.au_id AS 'Auhtor ID',
a.au_lname AS 'Last Name',
a.au_fname AS 'First Name',
t.title AS 'Title',
p.pub_name AS 'Publisher'
FROM authors AS a 
INNER JOIN titleauthor AS ta ON ta.au_id = a.au_id
INNER JOIN titles AS t ON t.title_id= ta.title_id
INNER JOIN publishers AS p ON p.pub_id = t.pub_id
order by au_lname;

SELECT
a.au_id AS 'Auhtor ID',
a.au_lname AS 'Last Name',
a.au_fname AS 'First Name',
p.pub_name AS 'Publisher',
COUNT(t.title)
FROM authors AS a 
INNER JOIN titleauthor AS ta ON ta.au_id = a.au_id
INNER JOIN titles AS t ON t.title_id= ta.title_id
INNER JOIN publishers AS p ON p.pub_id = t.pub_id
GROUP bY p.pub_name, a.au_id
ORDER BY a.au_lname;

SELECT 
a.au_id AS 'Auhtor ID',
a.au_lname AS 'Last Name',
a.au_fname AS 'First Name',
SUM(s.qty) AS 'Total'
FROM authors AS a 
INNER JOIN titleauthor AS ta ON ta.au_id = a.au_id
INNER JOIN titles AS t ON t.title_id= ta.title_id
INNER JOIN sales AS s ON s.title_id = t.title_id
GROUP bY  a.au_id
ORDER BY Total DESC
LIMIT 3;

SELECT 
a.au_id AS 'Auhtor ID',
a.au_lname AS 'Last Name',
a.au_fname AS 'First Name',
IFNULL(SUM(s.qty),0) AS 'Total'
FROM authors AS a 
LEFT JOIN titleauthor AS ta ON ta.au_id = a.au_id
LEFT JOIN titles AS t ON t.title_id= ta.title_id
LEFT JOIN sales AS s ON s.title_id = t.title_id
GROUP bY  a.au_id
ORDER BY Total DESC;

SELECT 
a.au_id AS 'Auhtor ID',
a.au_lname AS 'Last Name',
a.au_fname AS 'First Name',
ta.royaltyper*(t.advance+t.royalty*t.price*IFNULL(SUM(s.qty),0)) AS 'Profit',
SUM(Profit) AS 'Total Profit'
FROM authors AS a 
LEFT JOIN titleauthor AS ta ON ta.au_id = a.au_id
LEFT JOIN titles AS t ON t.title_id= ta.title_id
LEFT JOIN sales AS s ON s.title_id = t.title_id
GROUP bY  a.au_id, a.au_lname, a.au_fname, ta.royaltyper, t.advance, t.royalty,t.price,s.qty
ORDER BY Profit DESC;

#NO se imprime la columna de 'Total Profi' falta algo . 
