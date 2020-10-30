#Challenge 1
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM publications.authors AS authors
JOIN publications.titleauthor titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles as titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publications.publishers as publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, titles.title, publishers.pub_name
ORDER BY authors.au_id;
#Challenge 2
-- -------------------
SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, count(titles.title) as 'Published_titles'
FROM publications.authors AS authors
JOIN publications.titleauthor titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles as titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publications.publishers as publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id,  publishers.pub_name
ORDER BY authors.au_id DESC;
#Comprobacion
SELECT SUM(a.Published_titles)
FROM(
SELECT authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name, count(titles.title) as 'Published_titles'
FROM publications.authors AS authors
JOIN publications.titleauthor titleauthor
ON authors.au_id = titleauthor.au_id
JOIN publications.titles as titles
ON titleauthor.title_id = titles.title_id
JOIN publications.publishers as publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id,  publishers.pub_name
ORDER BY authors.au_id DESC) AS a;
-- ----------------------------------
#Challenge 3
SELECT authors.au_id, authors.au_lname, authors.au_fname, sum(sales.qty) AS 'Units_sold'
FROM publications.authors AS authors
LEFT JOIN publications.titleauthor titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles as titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publications.sales as sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY Units_sold DESC
LIMIT 3;

-- -------------------------------
#Challenge 4
SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS 'Units_sold'
FROM publications.authors AS authors
LEFT JOIN publications.titleauthor titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles as titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publications.sales as sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY Units_sold DESC;

-- ----------------------------
#BONUS CHALLENGE
SELECT authors.au_id, authors.au_lname, authors.au_fname, ROUND(SUM(titleauthor.royaltyper/100* titles.advance + titles.royalty/100*titles.ytd_sales),2) AS 'Profit' 
FROM publications.authors AS authors
JOIN publications.titleauthor titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles as titles
ON titleauthor.title_id = titles.title_id
GROUP BY authors.au_id
ORDER BY Profit DESC
LIMIT 3;