##Challenge 1

SELECT a.au_id AS 'AUTHOR ID',
a.au_lname AS 'LAST NAME',
a.au_fname AS 'FIRST NAME',
t.title AS 'TITLE',
p.pub_name AS 'PUBLISHER'
FROM authors a
JOIN titleauthor ta USING(au_id)
JOIN titles t USING(title_id)
JOIN publishers p USING(pub_id);

##Challenge 2

SELECT a.au_id AS 'AUTHOR ID',
a.au_lname AS 'LAST NAME',
a.au_fname AS 'FIRST NAME',
p.pub_name AS 'PUBLISHER',
COUNT(t.title) AS 'TITLE COUNT'
FROM authors a
JOIN titleauthor ta USING(au_id)
JOIN titles t USING(title_id)
JOIN publishers p USING(pub_id)
GROUP BY title;

##Challenge 3

SELECT a.au_id AS 'AUTHOR ID',
a.au_lname AS 'LAST NAME',
a.au_fname AS 'FIRST NAME',
SUM(s.qty) AS 'TOTAL'
FROM authors a
JOIN titleauthor ta USING(au_id)
JOIN titles t USING(title_id)
JOIN sales s USING(title_id)
GROUP BY a.au_id
ORDER BY 'TOTAL' DESC
LIMIT 3;

## Chanllenge 4

SELECT a.au_id AS 'AUTHOR ID',
a.au_lname AS 'LAST NAME',
a.au_fname AS 'FIRST NAME',
SUM(IFNULL(s.qty,0)) AS 'TOTAL'
FROM authors a
JOIN titleauthor ta USING(au_id)
JOIN titles t USING(title_id)
JOIN sales s USING(title_id)
GROUP BY a.au_id
ORDER BY 'TOTAL' DESC
LIMIT 23;

SELECT a.au_id AS 'AUTHOR ID',
a.au_lname AS 'LAST NAME',
a.au_fname AS 'FIRST NAME',
p.pub_name AS 'PUBLISHER',
t.title AS 'TITLE COUNT'
FROM authors a
JOIN titleauthor ta USING(au_id)
JOIN titles t USING(title_id)
JOIN publishers p USING(pub_id)
ORDER BY a.au_id DESC;

SELECT COUNT(*) FROM titleauthor;










