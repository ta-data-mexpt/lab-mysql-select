use publications;
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME', titles.title AS 'TITLE', 
publishers.pub_name AS 'PUBLISHER'
FROM publications.authors
JOIN publications.titleauthor ON authors.au_id=titleauthor.au_id
JOIN publications.titles ON titleauthor.title_id=titles.title_id
JOIN publications.publishers ON publishers.pub_id=titles.pub_id
ORDER BY authors.au_id;
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME', publishers.pub_name AS 'PUBLISHER',
COUNT(titles.title) AS 'TITLE COUNT'
FROM publications.authors
JOIN publications.titleauthor ON authors.au_id=titleauthor.au_id
JOIN publications.titles ON titleauthor.title_id=titles.title_id
JOIN publications.publishers ON publishers.pub_id=titles.pub_id
GROUP BY publications.authors.au_id,publications.publishers.pub_id
ORDER BY COUNT(titles.title) DESC,authors.au_id DESC;
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME', SUM(sales.qty) AS 'TOTAL'
FROM publications.authors
JOIN publications.titleauthor ON authors.au_id=titleauthor.au_id
JOIN publications.titles ON titleauthor.title_id=titles.title_id
JOIN publications.sales ON titles.title_id=sales.title_id
GROUP BY publications.authors.au_id
ORDER BY SUM(sales.qty) DESC
LIMIT 3;
SELECT authors.au_id AS 'AUTHOR ID', authors.au_lname AS 'LAST NAME', 
authors.au_fname AS 'FIRST NAME', IFNULL(SUM(sales.qty),0) AS 'TOTAL'
FROM publications.authors
LEFT JOIN publications.titleauthor ON authors.au_id=titleauthor.au_id
LEFT JOIN publications.titles ON titleauthor.title_id=titles.title_id
LEFT JOIN publications.sales ON titles.title_id=sales.title_id
GROUP BY publications.authors.au_id
ORDER BY SUM(sales.qty) DESC;
SELECT grouped.author_id AS 'AUTHOR ID', grouped.last_name AS 'LAST NAME',
grouped.first_name AS 'FIRST NAME', SUM(grouped.profit) AS 'PROFIT'
FROM (SELECT authors.au_id AS author_id, authors.au_lname AS last_name, 
	 authors.au_fname AS first_name, 
	 (titles.advance+titles.price*SUM(sales.qty)*(titles.royalty/100))*titleauthor.royaltyper/100 
	 AS profit
	 FROM publications.authors
	 JOIN publications.titleauthor ON authors.au_id=titleauthor.au_id
	 JOIN publications.titles ON titleauthor.title_id=titles.title_id
	 JOIN publications.sales ON titles.title_id=sales.title_id
	 GROUP BY publications.authors.au_id,titles.title_id) grouped
GROUP BY grouped.author_id
ORDER BY grouped.profit DESC
LIMIT 3;
