USE publications;

/*Challenge 1 - Who Have Published What At Where?*/
SELECT au.au_id, au.au_lname, au.au_fname, ti.title, pu.pub_name
FROM publications.authors au
INNER JOIN publications.titleauthor 
ON au.au_id =titleauthor.au_id
LEFT JOIN publications.titles ti
ON titleauthor.title_id=ti.title_id
LEFT JOIN publications.publishers pu
ON ti.pub_id=pu.pub_id
ORDER BY au.au_id;

/*Challenge 2 - Who Have Published How Many At Where?*/
SELECT au.au_id, au.au_lname, au.au_fname, COUNT(ti.title) AS 'TITLE COUNT', pu.pub_name
FROM publications.authors au
INNER JOIN publications.titleauthor 
ON au.au_id =titleauthor.au_id
LEFT JOIN publications.titles ti
ON titleauthor.title_id=ti.title_id
LEFT JOIN publications.publishers pu
ON ti.pub_id=pu.pub_id
GROUP BY au.au_id,pu.pub_name
ORDER BY au.au_id DESC;

/*Challenge 3 - Best Selling Authors*/
SELECT au.au_id, au.au_lname, au.au_fname, SUM(sa.qty) AS TOTAL
FROM publications.authors au
INNER JOIN publications.titleauthor 
ON au.au_id =titleauthor.au_id
LEFT JOIN publications.titles ti
ON titleauthor.title_id=ti.title_id
LEFT JOIN publications.sales sa
ON ti.title_id=sa.title_id
GROUP BY  au.au_id
ORDER BY TOTAL DESC
LIMIT 3;

/*Challenge 4 - Best Selling Authors Ranking*/
SELECT au.au_id, au.au_lname, au.au_fname, IFNULL(SUM(sa.qty),0) AS TOTAL
FROM publications.authors au
LEFT JOIN publications.titleauthor 
ON au.au_id =titleauthor.au_id
LEFT JOIN publications.titles ti
ON titleauthor.title_id=ti.title_id
LEFT JOIN publications.sales sa
ON ti.title_id=sa.title_id
GROUP BY  au.au_id
ORDER BY TOTAL DESC;


/*Challenge 1 - Who Have Published What At Where?*/
SELECT au.au_id, au.au_lname, au.au_fname, ti.title, pu.pub_name
FROM publications.authors au
INNER JOIN publications.titleauthor 
ON au.au_id =titleauthor.au_id
LEFT JOIN publications.titles ti
ON titleauthor.title_id=ti.title_id
LEFT JOIN publications.publishers pu
ON ti.pub_id=pu.pub_id
ORDER BY au.au_id;


/*Bonus Challenge - Most Profiting Authors*/
/*NOT SURE IF CORRECT*/
SELECT au.au_id, au.au_lname, au.au_fname, IFNULL(((ti.advance)+(IFNULL(SUM(sa.qty),0)*ti.price*ti.royalty/100))*(titleauthor.royaltyper/100),0) AS profit
FROM publications.authors au
INNER JOIN publications.titleauthor 
ON au.au_id =titleauthor.au_id
LEFT JOIN publications.titles ti
ON titleauthor.title_id=ti.title_id
LEFT JOIN publications.sales sa
ON ti.title_id=sa.title_id
GROUP BY au_id
ORDER BY profit DESC
LIMIT 3;
