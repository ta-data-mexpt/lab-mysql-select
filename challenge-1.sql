SELECT au.au_id as 'Author ID',
au.au_lname as 'Last Name',
au.au_fname as 'First Name',
tis.title as 'Title',
pu.pub_name as 'Publisher'
FROM `b'publications'`.authors au
RIGHT JOIN `b'publications'`.titleauthor ti
ON au.au_id = ti.au_id
LEFT JOIN `b'publications'`.titles tis
ON tis.title_id = ti.title_id
LEFT JOIN `b'publications'`.publishers pu
ON tis.pub_id = pu.pub_id
ORDER BY au.au_fname ASC; # regresa 25 filas que es el mismo numero de filas que en titleauthor