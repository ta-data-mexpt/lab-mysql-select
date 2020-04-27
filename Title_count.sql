SELECT authors.au_id as Author_ID, authors.au_lname as Last_Name, authors.au_lname as First_Name, 
publishers.pub_name as Publisher, count(authors.au_id) as Title_Count
FROM publications_labjoinsactions.authors
INNER JOIN  publications_labjoinsactions.titleauthor
ON authors.au_id = titleauthor.au_id
INNER JOIN publications_labjoinsactions.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications_labjoinsactions.publishers
ON titles.pub_id = publishers.pub_id
group by authors.au_id, authors.au_lname, authors.au_fname, publishers.pub_name
order by Title_Count desc;