SELECT au.au_id as 'Author ID',
au.au_lname as 'Last Name',
au.au_fname as 'First Name',
pu.pub_name as 'Publisher',
COUNT(tis.title) as 'Pub Count'
FROM `b'publications'`.authors au
RIGHT JOIN `b'publications'`.titleauthor ti
ON au.au_id = ti.au_id
LEFT JOIN `b'publications'`.titles tis
ON tis.title_id = ti.title_id
LEFT JOIN `b'publications'`.publishers pu
ON tis.pub_id = pu.pub_id
GROUP BY au.au_fname, pu.pub_name; # la suma de Pub Count es 25, que es el numero de filas en titleauthor