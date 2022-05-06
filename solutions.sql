select * from titles
limit 10;

-- Challenge 1
select 
a.au_id as 'AUTHOR ID',
a.au_lname as 'LAST NAME',
a.au_fname as 'FIRST NAME',
t.title as 'TITLE',
p.pub_name as 'PUBLISHER'
from authors a
left join titleauthor ta on ta.au_id = a.au_id
left join titles t on t.title_id = ta.title_id
left join publishers p on p.pub_id = t.pub_id;

-- Challenge 2
select 
a.au_id as 'AUTHOR ID',
a.au_lname as 'LAST NAME',
a.au_fname as 'FIRST NAME', 
p.pub_name as 'PUBLISHER',
count(t.title) as 'TITLE COUNT'
from authors a
left join titleauthor ta on ta.au_id = a.au_id
left join titles t on t.title_id = ta.title_id
left join publishers p on p.pub_id = t.pub_id
group by 1,2,3,4;

-- Challenge 3
select
a.au_id as 'AUTHOR ID',
a.au_lname as 'LAST NAME',
a.au_fname as 'FIRST NAME', 
sum(s.qty) as 'TOTAL'
from authors a
left join titleauthor ta on ta.au_id = a.au_id
left join titles t on t.title_id = ta.title_id
left join publishers p on p.pub_id = t.pub_id
left join sales s on s.title_id = t.title_id
group by 1,2,3
order by 4 desc 
limit 3;

-- Challenge 4
select
a.au_id as 'AUTHOR ID',
a.au_lname as 'LAST NAME',
a.au_fname as 'FIRST NAME', 
coalesce(sum(s.qty),0) as 'TOTAL'
from authors a
left join titleauthor ta on ta.au_id = a.au_id
left join titles t on t.title_id = ta.title_id
left join publishers p on p.pub_id = t.pub_id
left join sales s on s.title_id = t.title_id
group by 1,2,3
order by 4 desc;

