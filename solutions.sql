select * from titles;
select * from titleauthor;
select * from authors;
select * from publishers;

### Challenge 1 - Who Have Published What At Where?

select 
	authors.au_id as 'Author ID',
	authors.au_lname as 'Last Name',
	authors.au_fname as 'First Name',
    titles.title as 'Titulos',
    publishers.pub_name as 'Publishers'
from authors
inner join titleauthor on titleauthor.au_id = authors.au_id
inner join titles on titles.title_id = titleauthor.title_id
inner join publishers on publishers.pub_id = titles.pub_id
;


### Challenge 2 - Who Have Published How Many At Where?

select 
	authors.au_id as "AUTHOR_ID",
	authors.au_lname as "LAST_NAME",
	authors.au_fname as "FIRST_NAME",
	publishers.pub_name as "PUBLISHERS",
	count(titleauthor.title_id) as "TITLE_COUNT"
from authors
inner join titleauthor 	on titleauthor.au_id = authors.au_id
inner join titles    on titles.title_id = titleauthor.title_id
inner join publishers    on publishers.pub_id = titles.pub_id
group by titles.title_id
order by publishers asc, title_count desc;



### Challenge 3 - Best Selling Authors


select
	authors.au_id as 'Author ID',
    authors.au_lname as 'Last Name',
    authors.au_fname as 'First Name',
    sum(sales.qty) as 'TOTAL'
from authors
inner join titleauthor on titleauthor.au_id = authors.au_id
inner join titles on titles.title_id = titleauthor.title_id
inner join sales on sales.title_id = titles.title_id
group by authors.au_id
order by Total desc
limit 3;


### Challenge 4 - Best Selling Authors Ranking

 select 
	authors.au_id as 'Author', 
    authors.au_lname as 'Last Name',
    authors.au_fname as 'First Name',
	IFNULL(SUM(sales.qty), 0) as 'Total'
from authors
inner join titleauthor on titleauthor.au_id = authors.au_id
inner join titles on titles.title_id = titleauthor.title_id
inner join  sales on sales.title_id = titles.title_id
group by authors.au_id
order by Total desc
;