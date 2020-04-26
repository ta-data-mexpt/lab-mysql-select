#CHALLENGE 1

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", titles.title AS "TITLE", publishers.pub_name AS "PUBLISHER"
FROM publications.authors
inner join publications.titleauthor
on publications.authors.au_id = publications.titleauthor.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.publishers
on publications.titles.pub_id = publications.publishers.pub_id

#VERIFICATION CHALLENGE 1

SELECT * FROM publications.titleauthor;

#CHALLENGE 2

SELECT authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", publishers.pub_name AS "PUBLISHER", count(publishers.pub_name) AS "TITLE COUNT"
FROM publications.authors
inner join publications.titleauthor
on publications.authors.au_id = publications.titleauthor.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.publishers
on publications.titles.pub_id = publications.publishers.pub_id
group by authors.au_id
order by authors.au_id DESC;

#VERIFICATION CHALLENGE 2

SELECT count(*), titleauthor.au_id
FROM publications.titleauthor
group by titleauthor.au_id

# CHALLENGE 3
select authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", sum(sales.qty) AS "TOTAL"
from publications.authors
left join publications.titleauthor
on publications.authors.au_id = publications.titleauthor.au_id
left join publications.titles
on publications.titleauthor.title_id = publications.titles.title_id
left join publications.sales
on publications.titles.title_id = publications.sales.title_id
group by authors.au_id
order by sum(sales.qty) DESC
limit 3;

# CHALLENGE 4
select authors.au_id AS "AUTHOR ID", authors.au_lname AS "LAST NAME", authors.au_fname AS "FIRST NAME", sum(sales.qty) AS "TOTAL"
from publications.authors
left join publications.titleauthor
on publications.authors.au_id = publications.titleauthor.au_id
left join publications.titles
on publications.titleauthor.title_id = publications.titles.title_id
left join publications.sales
on publications.titles.title_id = publications.sales.title_id
group by authors.au_id
order by sum(sales.qty) DESC;