SELECT DISTINCT au.au_id, au.au_lname, au.au_fname, ti.title, pub.pub_name
FROM publications.authors AS au
LEFT JOIN publications.titleauthor AS tit ON au.au_id=tit.au_id
LEFT JOIN publications.titles AS ti ON tit.title_id=ti.title_id
LEFT JOIN publications.publishers AS pub ON ti.pub_id=pub.pub_id;

SELECT a.au_id, a.au_lname, a.au_fname, a.title, a.pub_id
FROM(
SELECT au.au_id, au.au_lname, au.au_fname, ti.title, pub.pub_id, COUNT(au.au_id) AS 'Title_count'
FROM publications.authors AS au
LEFT JOIN publications.titleauthor AS tit ON au.au_id=tit.au_id
LEFT JOIN publications.titles AS ti ON tit.title_id=ti.title_id
LEFT JOIN publications.publishers AS pub ON ti.pub_id=pub.pub_id) AS a
GROUP BY a.au_id;

SELECT au.au_id, au.au_lname, au.au_fname, SUM(ti.title_id) AS 'Number_of_titles'
FROM publications.authors AS au
LEFT JOIN publications.titleauthor AS tit ON au.au_id = tit.au_id
LEFT JOIN publications.titles AS ti ON tit.title_id=ti.title_id
GROUP BY au.au_id 
ORDER BY 'Number_of_titles' DESC LIMIT 3;

SELECT au.au_id, au.au_lname, au.au_fname, SUM(ti.title_id) AS 'Number_of_titles'
FROM publications.authors AS au
LEFT JOIN publications.titleauthor AS tit ON au.au_id = tit.au_id
LEFT JOIN publications.titles AS ti ON tit.title_id=ti.title_id
GROUP BY au.au_id 
ORDER BY 'Number_of_titles' DESC LIMIT 23;


