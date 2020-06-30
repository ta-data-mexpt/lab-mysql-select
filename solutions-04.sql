USE publications;
SELECT	authors.au_id AS 'AUTHOR ID',
		authors.au_lname AS 'LAST NAME',
        authors.au_fname AS 'FIRST NAME',
        SUM(sales.qty) AS 'TOTAL'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN sales
ON titles.title_id = sales.title_id
GROUP BY authors.au_id
ORDER BY SUM(sales.qty) DESC;