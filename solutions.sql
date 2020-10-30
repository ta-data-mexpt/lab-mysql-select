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
SELECT C.au_id, C.au_lname, C.au_fname, ROUND(SUM(C.Profit),2) as 'Total_profit'
FROM
(SELECT B.au_id, B.au_lname, B.au_fname, B.title, B.advance*B.Royalty_div+ (B.price*B.Units_sold*B.Royalty_pct*Royalty_div) as 'Profit'
FROM
(SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, titles.advance, titles.price, SUM(sales.qty) AS 'Units_sold', titles.royalty/100 as 'Royalty_pct', titleauthor.royaltyper/100 AS 'Royalty_div'
FROM publications.authors AS authors
JOIN publications.titleauthor titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN publications.titles as titles
ON titleauthor.title_id = titles.title_id
JOIN publications.sales as sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id, titles.title, titles.advance, titles.royalty, titles.price, titleauthor.royaltyper
ORDER BY titles.title) AS B) AS C
GROUP BY C.au_id
ORDER BY Total_profit DESC
LIMIT 3;