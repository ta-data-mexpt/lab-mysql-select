SELECT publications.authors.au_id, publications.authors.au_lname, publications.authors.au_fname,sum(publications.sales.qty)
FROM publications.authors
INNER JOIN publications.titleauthor
ON  authors.au_id=titleauthor.au_id
INNER JOIN publications.titles
ON titleauthor.title_id = titles.title_id
INNER JOIN publications.sales
ON titles.title_id=sales.title_id
group by au_id
order by sum(publications.sales.qty) desc;