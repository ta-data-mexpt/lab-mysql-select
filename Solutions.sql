SELECT authors.au_id as Author_ID, authors.au_lname as Last_Name, authors.au_fname as First_Name, 
titles.title as Tittle, publishers.pub_name as Publisher
FROM publications_labjoinsactions.authors
INNER JOIN  publications_labjoinsactions.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications_labjoinsactions.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications_labjoinsactions.publishers
ON titles.pub_id = publishers.pub_id
