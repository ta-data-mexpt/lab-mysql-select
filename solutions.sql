#Challenge 1 - Who Have Published What At Where?
SELECT au.au_id AS "AUTHOR ID" , au.au_lname AS "LAST NAME",au.au_fname AS "FIRTS NAME", titles.title AS "TITLE"  , pub.pub_name AS "PUBLISHER"
FROM publications.authors au
INNER JOIN publications.titleauthor titau
ON au.au_id=titau.au_id
INNER JOIN publications.titles titles
ON titau.title_id=titles.title_id
INNER JOIN publications. publishers pub
ON titles.pub_id=pub.pub_id ORDER BY au.au_id;

#Challenge 2 - Who Have Published How Many At Where?
SELECT au.au_id AS "AUTHOR ID" , au.au_lname AS "LAST NAME",au.au_fname AS "FIRTS NAME", 
pub.pub_name AS "PUBLISHER", COUNT(titles.title) AS "TITLE COUNT"
FROM publications.authors au
INNER JOIN publications.titleauthor titau
ON au.au_id=titau.au_id
INNER JOIN publications.titles titles
ON titau.title_id=titles.title_id
INNER JOIN publications. publishers pub
ON titles.pub_id=pub.pub_id 
GROUP BY au.au_lname, au. au_fname, pub.pub_name
ORDER BY au.au_id Desc;

#Challenge 3 - Best Selling Authors
SELECT au.au_id AS "AUTHOR ID" , au.au_lname AS "LAST NAME",au.au_fname AS "FIRTS NAME", SUM(sal.qty) AS "TOTAL"
FROM publications.authors au
INNER JOIN publications.titleauthor titau
ON au.au_id=titau.au_id
INNER JOIN publications.titles titles
ON titau.title_id=titles.title_id
INNER JOIN publications. sales sal
ON titles.title_id=sal.title_id 
GROUP BY au.au_id
ORDER BY TOTAL DESC LIMIT 3;

#Challenge 4 - Best Selling Authors Ranking
SELECT au.au_id AS "AUTHOR ID" , au.au_lname AS "LAST NAME",au.au_fname AS "FIRTS NAME", SUM(sal.qty) AS "TOTAL"
FROM publications.authors au
LEFT JOIN publications.titleauthor titau
ON au.au_id=titau.au_id
LEFT JOIN publications.titles titles
ON titau.title_id=titles.title_id
LEFT JOIN publications. sales sal
ON titles.title_id=sal.title_id 
GROUP BY au.au_id
ORDER BY TOTAL DESC;
