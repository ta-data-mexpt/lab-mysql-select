USE publications;
#Challenge 1
SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM publications.authors
JOIN publications.titleauthor
ON authors.au_id=titleauthor.au_id
JOIN publications.titles
ON titleauthor.title_id=titles.title_id
JOIN publications.publishers
ON titles.pub_id=publishers.pub_id;
#Challenge 2
SELECT authors.au_id, authors.au_lname, authors.au_fname, count(titles.title) as Title_count, publishers.pub_name
FROM publications.authors
JOIN publications.titleauthor
ON authors.au_id=titleauthor.au_id
JOIN publications.titles
ON titleauthor.title_id=titles.title_id
JOIN publications.publishers
ON titles.pub_id=publishers.pub_id
group by publications.authors.au_id;
#Challenge 3
SELECT authors.au_id, authors.au_lname, authors.au_fname, sum(sales.qty) as Total_titles_sold
FROM publications.authors
JOIN publications.titleauthor
ON authors.au_id=titleauthor.au_id
JOIN publications.sales
ON titleauthor.title_id=sales.title_id
group by publications.authors.au_id
ORDER BY Total_titles_sold DESC
LIMIT 3;
#Challenge 4
SELECT authors.au_id, authors.au_lname, authors.au_fname, sum(sales.qty) as Total_titles_sold
FROM publications.authors
LEFT JOIN publications.titleauthor
ON authors.au_id=titleauthor.au_id
LEFT JOIN publications.sales
ON titleauthor.title_id=sales.title_id
group by publications.authors.au_id
ORDER BY Total_titles_sold DESC;

