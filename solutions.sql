USE publications;

#Challenge 1 - Who Have Published What At Where?
SELECT 
	authors.au_id AS 'ID', 
    authors.au_lname AS 'Last Name', 
    authors.au_fname AS 'First Name', 
    titles.title AS 'Title', 
    publishers.pub_name AS 'Publisher' 
FROM 
	publications.authors authors
		JOIN 
	publications.titleauthor title_author ON authors.au_id = title_author.au_id
		JOIN 
	publications.titles titles ON title_author.title_id = titles.title_id
		JOIN 
	publications.publishers publishers ON titles.pub_id = publishers.pub_id
ORDER BY authors.au_id asc;

#Challenge 2 - Who Have Published How Many At Where?
SELECT 
    authors.au_id AS 'ID',
    authors.au_lname AS 'Last Name',
    authors.au_fname AS 'First Name',
    publishers.pub_name AS 'Publisher',
    COUNT(titles.pub_id) AS 'Title count'
FROM
    publications.authors authors
        JOIN
    publications.titleauthor title_author ON authors.au_id = title_author.au_id
        JOIN
    publications.titles titles ON title_author.title_id = titles.title_id
        JOIN
    publications.publishers publishers ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id , publishers.pub_name
ORDER BY authors.au_id DESC;

#Challenge 3 - Best Selling Authors
CREATE TEMPORARY TABLE authors_sales SELECT authors.au_id as 'ID', authors.au_lname as 'lName', authors.au_fname as 'fName', titles.title as 'Title', sales.qty as 'QTY_sales'
FROM publications.authors authors
JOIN publications.titleauthor titleauthor ON authors.au_id = titleauthor.au_id
JOIN publications.titles titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publications.sales sales ON titles.title_id = sales.title_id; #aqui le indico que quiero TODOS los titulos asi tenga o no ventas

SELECT ID,  lName, fName, SUM(QTY_sales) AS total_sales
FROM authors_sales 
group by ID, Title
ORDER BY total_sales desc
LIMIT 3;

#Challenge 4 - Best Selling Authors Ranking
SELECT ID,  lName, fName, IFNULL(SUM(QTY_sales), 0) AS total_sales
FROM authors_sales
group by ID, Title
ORDER BY total_sales desc;

#Bonus Challenge - Most Profiting Authors
#The total profit an author receives by publishing a book is the sum of the advance and the royalties.
DROP TABLE authors_sales;

CREATE TEMPORARY TABLE authors_sales 
SELECT 
	authors.au_id AS author_id, 
    authors.au_lname AS lname, 
    authors.au_fname AS fname,
    titleauthor.royaltyper AS royalty_per,
    titles.title_id as title_id,
    titles.title AS title, 
    titles.price AS price, 
    titles.advance AS advance, 
    roysched.royalty AS royalty
FROM publications.authors authors
JOIN publications.titleauthor titleauthor ON authors.au_id = titleauthor.au_id
JOIN publications.titles titles ON titleauthor.title_id = titles.title_id
JOIN publications.roysched roysched ON titles.title_id = roysched.title_id; 

SELECT 
    author_id,
    lname,
    fname,
	advance + ((sales.qty*price) * (royalty_per / 100))  AS profit
FROM
    authors_sales
        JOIN
    publications.sales sales ON authors_sales.title_id = sales.title_id
GROUP BY author_id , authors_sales.title_id
ORDER BY profit desc
LIMIT 3;