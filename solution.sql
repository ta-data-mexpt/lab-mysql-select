select publications.authors.au_id as 'AUTHOR ID', publications.authors.au_lname as 'LAST NAME', publications.authors.au_fname as 'FIRST NAME',
publications.titles.title as 'TITLE', publications.publishers.pub_name as 'PUBLISHER'
from publications.authors
inner join publications.titleauthor
on publications.titleauthor.au_id = publications.authors.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.publishers
on publications.publishers.pub_id = publications.titles.pub_id;

select publications.authors.au_id as 'AUTHOR ID', publications.authors.au_lname as 'LAST NAME', publications.authors.au_fname as 'FIRST NAME',
publications.publishers.pub_name as 'PUBLISHER', count(publications.titles.title_id) as 'Title Count'
from publications.authors
inner join publications.titleauthor
on publications.titleauthor.au_id = publications.authors.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.publishers
on publications.publishers.pub_id = publications.titles.pub_id
group by publications.publishers.pub_name;
/*
Comprobación del query superior
select count(publications.titleauthor.title_id) from publications.titleauthor;
*/

select publications.authors.au_id as 'AUTHOR ID', publications.authors.au_lname as 'LAST NAME', publications.authors.au_fname as 'FIRST NAME',
sum(publications.sales.qty) as 'Total'
from publications.authors
inner join publications.titleauthor
on publications.titleauthor.au_id = publications.authors.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.sales
on publications.sales.title_id = publications.titles.title_id
group by publications.authors.au_id
order by Total DESC limit 3;

select publications.authors.au_id as 'AUTHOR ID', publications.authors.au_lname as 'LAST NAME', publications.authors.au_fname as 'FIRST NAME',
coalesce(sum(publications.sales.qty),0) as 'Total'
from publications.authors
inner join publications.titleauthor
on publications.titleauthor.au_id = publications.authors.au_id
inner join publications.titles
on publications.titles.title_id = publications.titleauthor.title_id
inner join publications.sales
on publications.sales.title_id = publications.titles.title_id
group by publications.authors.au_id
order by Total DESC;

select publications.titleauthor.au_id,publications.authors.au_lname,publications.authors.au_fname,
sum((publications.titleauthor.royaltyper/100) * publications.titles.ytd_sales * (publications.titles.royalty/100)) as 'Sales',
sum((publications.titleauthor.royaltyper/100) * publications.titles.advance ) as 'Royalties'
from publications.titles
inner join publications.titleauthor
on publications.titleauthor.title_id = publications.titles.title_id
inner join publications.authors
on publications.authors.au_id = publications.titleauthor.au_id
group by publications.authors.au_id
; 

/*
select sum(Sales2,Royalties2) from ((select sum((publications.titleauthor.royaltyper/100) * publications.titles.ytd_sales * (publications.titles.royalty/100)) as 'Sales Royalties'
from publications.titles
inner join publications.titleauthor
on publications.titleauthor.title_id = publications.titles.title_id
inner join publications.authors
on publications.authors.au_id = publications.titleauthor.au_id
group by publications.authors.au_id) as Sales2), 
((select publications.authors.au_id, sum((publications.titleauthor.royaltyper/100) * publications.titles.advance ) as 'Adv Royalties'
from publications.titles
inner join publications.titleauthor
on publications.titleauthor.title_id = publications.titles.title_id
inner join publications.authors
on publications.authors.au_id = publications.titleauthor.au_id
group by publications.authors.au_id) as Royalties2)
; 
select * 
from publications.authors
inner join publications.titleauthor
on publications.titleauthor.au_id = publications.authors.au_id;

select sum(publications.titles.ytd_sales),publications.titles.title,publications.titles.title_id from publications.titles
inner join publications.titleauthor
on publications.titleauthor.title_id = publications.titles.title_id
group by publications.titleauthor.title_id;

select * from publications.titleauthor;
select * from publications.authors;
select * from publications.titles;
select * from publications.sales;
*/