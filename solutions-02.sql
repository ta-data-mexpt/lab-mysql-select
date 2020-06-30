USE publications;
SELECT	authors.au_id AS 'AUTHOR ID',
		authors.au_lname AS 'LAST NAME',
        authors.au_fname AS 'FIRST NAME',
		publishers.pub_name AS 'PUBLISHER',
        COUNT(*) AS 'TITLE COUNT'
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publishers
ON titles.pub_id = publishers.pub_id
GROUP BY authors.au_id, titles.pub_id;