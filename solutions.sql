-- Challenge 1 - Who Have Published What At Where?

select titleauthor.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', titles.title as 'TITLE', publishers.pub_name as 'PUBLISHER' from titles 
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join publishers on publishers.pub_id = titles.pub_id;

-- Challenge 2 - Who Have Published How Many At Where?

select titleauthor.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME', publishers.pub_name as 'PUBLISHER',
count(titles.title) as 'TITLE COUNT'
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
join publishers on publishers.pub_id = titles.pub_id
group by titleauthor.au_id, publishers.pub_name order by 'TITLE COUNT' desc;


-- Challenge 3 - Best Selling Authors

select titleauthor.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',
sum(sales.qty) as 'TOTAL'
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
left join sales on sales.title_id = titles.title_id
group by titleauthor.au_id order by TOTAL DESC limit 3;

-- Challenge 4 - Best Selling Authors Ranking
select titleauthor.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',
IFNULL(sum(sales.qty),0) as 'TOTAL'
from titles
join titleauthor on titleauthor.title_id = titles.title_id
inner join sales on sales.title_id = titles.title_id
right join authors on authors.au_id = titleauthor.au_id
group by titleauthor.au_id, books.authors.au_lname, books.authors.au_fname order by TOTAL DESC;

-- Bonus Challenge - Most Profiting Authors
select titleauthor.au_id as 'AUTHOR ID', authors.au_lname as 'LAST NAME', authors.au_fname as 'FIRST NAME',
(titles.price * sales.qty) as 'Total de Ventas', ((titles.price * sales.qty) * (titles.royalty/100)+ titles.advance) as 'Profit'
from titles
join titleauthor on titleauthor.title_id = titles.title_id
join authors on authors.au_id = titleauthor.au_id
left join sales on sales.title_id = titles.title_id order by Profit desc limit 3
