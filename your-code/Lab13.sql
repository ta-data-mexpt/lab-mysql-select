select * from authors;
select * from titles;
select * from publishers;
select * from sales;
select * from stores;
select * from discounts;

select sum(qty) from sales;



select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME,  authors.au_fname as FIRST_NAME, titles.title as TITLE, publishers.pub_name as PUBLISHER
from authors
	inner join titleauthor on authors.au_id=titleauthor.au_id
	inner join titles on titleauthor.title_id=titles.title_id
	inner join publishers on titles.pub_id=publishers.pub_id
order by AUTHOR_ID;



select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME,  authors.au_fname as FIRST_NAME, sum(sales.qty) as TOTAL
from sales
    inner join titleauthor using (title_id)
    inner join authors using (au_id)
group by AUTHOR_ID, LAST_NAME, FIRST_NAME
order by TOTAL desc
limit 3;

select authors.au_id as AUTHOR_ID, authors.au_lname as LAST_NAME,  authors.au_fname as FIRST_NAME, sum(sales.qty) as TOTAL
from sales
    inner join titleauthor using (title_id)
    inner join authors using (au_id)
group by AUTHOR_ID, LAST_NAME, FIRST_NAME
order by TOTAL desc;

