
SELECT authors.au_id as 'Author ID', authors.au_fname as 'First Name', authors.au_lname as 'Last Name', titles.title as 'Title', publishers.pub_name as 'Publisher'
from authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id
order by authors.au_id;

SELECT authors.au_id as 'Author ID', authors.au_fname as 'First Name', authors.au_lname as 'Last Name', publishers.pub_name as 'Publisher', count(publishers.pub_name) as Title_Count
from authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id
group by authors.au_id, publishers.pub_name
order by Title_Count desc;

SELECT authors.au_id as 'Author ID', authors.au_lname as 'Last Name', authors.au_fname as 'First Name', sum(sales.qty) as 'Total'
from authors
JOIN titleauthor
ON authors.au_id = titleauthor.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN sales
ON titles.title_id= sales.title_id
group by authors.au_id
order by total DESC
limit 3;

SELECT authors.au_id as 'Author ID', authors.au_lname as 'Last Name', authors.au_fname as 'First Name', sum(ifnull(sales.qty,0)) as 'Total'
from authors
left join titleauthor
ON authors.au_id = titleauthor.au_id
left jOIN titles
ON titleauthor.title_id = titles.title_id
left JOIN sales
ON titles.title_id= sales.title_id
group by authors.au_id
order by total desc;

