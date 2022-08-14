SELECT au.au_id as 'Author ID',
au.au_lname as 'Last Name',
au.au_fname as 'First Name',
SUM(tis.ytd_sales) as 'YTD Sales'
FROM `b'publications'`.authors au
RIGHT JOIN `b'publications'`.titleauthor ti
ON au.au_id = ti.au_id
LEFT JOIN `b'publications'`.titles tis
ON tis.title_id = ti.title_id
LEFT JOIN `b'publications'`.sales sa
ON sa.title_id = tis.title_id
GROUP BY au.au_id
ORDER BY SUM(tis.ytd_sales) DESC
LIMIT 3; # regresa los 3 autores con mas ventas hasta la fecha