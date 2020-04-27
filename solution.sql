SELECT authors.au_id, authors.au_lname, authors.au_fname, titles.title, publishers.pub_name
FROM Solutions.authors
INNER JOIN Solutions.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN Solutions.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN Solutions.publishers
ON titles.pub_id = publishers.pub_id
