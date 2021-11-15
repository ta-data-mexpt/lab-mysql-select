CREATE TABLE Publications_3;
USE Publications_3;

#Challenge 1
SELECT a.au_id, a.au_lname, a.au_fname, t.title, p.pub_name
FROM authors AS a
JOIN titleauthor ta 
ON a.au_id = ta.au_id 
JOIN titles AS t	
ON t.title_id = ta.title_id 
JOIN publishers AS p
on p.pub_id = t.pub_id;

#Challenge 2
SELECT au_id, a.au_lname, a.au_fname, p.pub_name,COUNT(t.title) AS 'title_count'
FROM titles AS t
JOIN publishers AS p
ON t.pub_id = p.pub_id
INNER JOIN titleauthor as ta
USING (title_id)
INNER JOIN authors as a
USING (au_id)
GROUP BY au_id, p.pub_id;

#Challenge 3 
SELECT a.au_id, a.au_lname, a.au_fname, SUM(s.qty) as total
FROM authors AS a
INNER JOIN titleauthor AS ta
USING (au_id) #ON (id_data1 = id_data2) 
JOIN titles t
USING (title_id) 
JOIN sales AS s 
USING (title_id)
GROUP BY a.au_id
ORDER BY total desc
limit 3;

#Challenge 4
SELECT au_id, a.au_lname, a.au_fname, COALESCE(SUM(s.qty), 0) AS 'total' #ISNULL/COALESCE
FROM sales AS s
LEFT JOIN titleauthor AS ta
USING(title_id)
RIGHT JOIN authors AS a
USING( au_id)
GROUP BY au_id
ORDER BY total desc;

#Bonus
