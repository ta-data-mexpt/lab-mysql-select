#Challenge 1 - Who Have Published What At Where?
SELECT authors.au_id 'AUTHOR ID', authors.au_lname 'LAST NAME', authors.au_fname 'FIRST NAME', titles.title 'TITLE', publishers.pub_name 'PUBLISHERS'
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
LEFT JOIN titles
ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id
ORDER BY 'AUTHOR ID', 'LAST NAME', 'FIRST NAME', 'TITLE', 'PUBLISHERS' DESC;
#DUDA - ¿Porqué salieron los valores NULL en las columnas?

#Challenge 2 - Who Have Published How Many At Where?
SELECT titles.title, count(*) 'TOTAL COUNT'
FROM titleauthor
JOIN titles
GROUP BY titles.title
ORDER BY 'TOTAL COUNT' DESC;
# Podrían explicarme cómo es que se logra este challenge, por favor

#Challenge 3 - Best Selling Authors

SELECT authors.au_id 'AUTHOR ID', authors.au_lname 'LAST NAME', authors.au_fname 'FIRST NAME', sum(sales.qty) 'TOTAL'
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN sales
ON titles.title_id = sales.title_id
GROUP BY 'AUTHOR ID', 'LAST NAME', 'FIRST NAME', 'TOTAL' WITH ROLLUP
ORDER BY 'TOTAL' DESC
LIMIT 3;
# ¿por qué me salió el mismo resultado tres veces?

#Challenge 4 - Best Selling Authors Ranking

SELECT authors.au_id 'AUTHOR ID', authors.au_lname 'LAST NAME', authors.au_fname 'FIRST NAME', sum(sales.qty) 'TOTAL'
FROM authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN sales
ON titles.title_id = sales.title_id
GROUP BY 'AUTHOR ID', 'LAST NAME', 'FIRST NAME', 'TOTAL' WITH ROLLUP
ORDER BY 'TOTAL' DESC;
