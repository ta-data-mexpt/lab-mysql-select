SELECT Last_Name,
First_Name,
CASE WHEN YTD_Sales IS NULL THEN 0 ELSE YTD_Sales END AS 'YTD_Sales'
FROM (
SELECT au.au_id as Author_ID,
au.au_lname as Last_Name,
au.au_fname as First_Name,
SUM(tis.ytd_sales) as YTD_Sales
FROM `b'publications'`.authors au
LEFT JOIN `b'publications'`.titleauthor ti
ON au.au_id = ti.au_id
LEFT JOIN `b'publications'`.titles tis
ON tis.title_id = ti.title_id
LEFT JOIN `b'publications'`.sales sa
ON sa.title_id = tis.title_id
GROUP BY au.au_id
ORDER BY SUM(tis.ytd_sales) DESC) TAB; # aqui estan todas la ventas de los 23 autores y los valores nulos son 0