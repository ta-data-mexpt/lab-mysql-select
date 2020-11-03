# Challenge 1 - Who Have Published What At Where?

SELECT au.au_id AS `AUTHOR ID`, au.au_lname AS `LAST NAME`, au.au_fname AS `FIRST NAME`, 
titles.title AS TITLE, pub.pub_name AS PUBLISHER 
FROM publications.authors au
INNER JOIN publications.titleauthor tau
ON au.au_id = tau.au_id
INNER JOIN publications.titles titles
ON tau.title_id = titles.title_id
INNER JOIN publications.publishers pub
ON titles.pub_id = pub.pub_id
ORDER BY au.au_id;

# Checking result

SELECT * FROM publications.titleauthor;

# Challenge 2 - Who Have Published How Many At Where?

SELECT au.au_id AS `AUTHOR ID`, au.au_lname AS `LAST NAME`, au.au_fname AS `FIRST NAME`, 
pub.pub_name AS PUBLISHER, COUNT(au.au_id) AS `TITLE COUNT`
FROM publications.authors au
INNER JOIN publications.titleauthor tau
ON au.au_id = tau.au_id
INNER JOIN publications.titles titles
ON tau.title_id = titles.title_id
INNER JOIN publications.publishers pub
ON titles.pub_id = pub.pub_id
GROUP BY au.au_id, pub.pub_name, au.au_lname, au.au_fname
ORDER BY au.au_id DESC;

# Checking result

CREATE TEMPORARY TABLE check_sum(
SELECT au.au_id AS `AUTHOR ID`, au.au_lname AS `LAST NAME`, au.au_fname AS `FIRST NAME`, 
pub.pub_name AS PUBLISHER, COUNT(au.au_id) AS `TITLE COUNT`
FROM publications.authors au
INNER JOIN publications.titleauthor tau
ON au.au_id = tau.au_id
INNER JOIN publications.titles titles
ON tau.title_id = titles.title_id
INNER JOIN publications.publishers pub
ON titles.pub_id = pub.pub_id
GROUP BY au.au_id, pub.pub_name, au.au_lname, au.au_fname
ORDER BY au.au_id DESC);

SELECT SUM(`TITLE COUNT`) FROM check_sum;

SELECT * FROM publications.titleauthor;

# Challenge 3 - Best Selling Authors

SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, SUM(TOTAL) as TOTAL
FROM(
SELECT au.au_id AS `AUTHOR ID`, au.au_lname AS `LAST NAME`, au.au_fname AS `FIRST NAME`, sale.qty AS TOTAL
FROM publications.authors au
INNER JOIN publications.titleauthor tau
ON au.au_id = tau.au_id
INNER JOIN publications.titles titles
ON tau.title_id = titles.title_id
INNER JOIN publications.sales sale
ON titles.title_id = sale.title_id
GROUP BY au.au_id, au.au_lname, au.au_fname, sale.qty
ORDER BY au.au_id DESC) best_sell
GROUP BY `AUTHOR ID`, `LAST NAME`, `FIRST NAME`
ORDER BY TOTAL DESC
LIMIT 3;

# Challenge 4 - Best Selling Authors Ranking

SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, SUM(TOTAL) as TOTAL
FROM(
SELECT au.au_id AS `AUTHOR ID`, au.au_lname AS `LAST NAME`, au.au_fname AS `FIRST NAME`, IFNULL(sale.qty,0) AS TOTAL
FROM publications.authors au
LEFT JOIN publications.titleauthor tau
ON au.au_id = tau.au_id
LEFT JOIN publications.titles titles
ON tau.title_id = titles.title_id
LEFT JOIN publications.sales sale
ON titles.title_id = sale.title_id
GROUP BY au.au_id, au.au_lname, au.au_fname, sale.qty
ORDER BY au.au_id DESC) best_sell
GROUP BY `AUTHOR ID`, `LAST NAME`, `FIRST NAME`
ORDER BY TOTAL DESC;

# Bonus Challenge - Most Profiting Authors

SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, Advance + `Royalties earned` AS Profit
FROM(
SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, SUM(Advance) AS Advance, SUM(ifnull((Quantity * Royalty) * (`Royalty %`/100),0)) AS `Royalties earned`
FROM(
SELECT au.au_id AS `AUTHOR ID`, au.au_lname AS `LAST NAME`, au.au_fname AS `FIRST NAME`, 
sale.qty AS Quantity, titles.royalty as Royalty, tau.royaltyper AS `Royalty %`, ifnull(titles.advance,0) AS Advance
FROM publications.authors au
LEFT JOIN publications.titleauthor tau
ON au.au_id = tau.au_id
LEFT JOIN publications.titles titles
ON tau.title_id = titles.title_id
LEFT JOIN publications.sales sale
ON titles.title_id = sale.title_id
ORDER BY au.au_id) sub
GROUP BY `AUTHOR ID`) profits
ORDER BY Profit DESC
LIMIT 3;


