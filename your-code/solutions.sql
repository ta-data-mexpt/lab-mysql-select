SELECT DISTINCT au.au_id, au.au_lname, au.au_fname, ti.title, pub.pub_name
FROM publications.authors AS au
LEFT JOIN publications.titleauthor AS tit ON au.au_id=tit.au_id
LEFT JOIN publications.titles AS ti ON tit.title_id=ti.title_id
LEFT JOIN publications.publishers AS pub ON ti.pub_id=pub.pub_id;


SELECT DISTINCT au.au_id, au.au_lname, au.au_fname, ti.title, pub.pub_name, COUNT(pub.pub_name) AS 'Title_count'
FROM publications.authors AS au
LEFT JOIN publications.titleauthor AS tit ON au.au_id=tit.au_id
LEFT JOIN publications.titles AS ti ON tit.title_id=ti.title_id
LEFT JOIN publications.publishers AS pub ON ti.pub_id=pub.pub_id;
GROUP BY au.au_id;

