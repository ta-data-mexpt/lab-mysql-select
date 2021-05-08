use publications;

select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", t.title as "TITLE", p.pub_name as "PUBLISHER"
from authors a
left join titleauthor ta
on ta.au_id = a.au_id
left join titles t
on t.title_id = ta.title_id
left join publishers p
on p.pub_id = t.pub_id
order by 1 desc, 4 asc;

select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", p.pub_name as "PUBLISHER", count(t.title_id) as "TITLE COUNT"
from authors a
left join titleauthor ta
on ta.au_id = a.au_id
left join titles t
on t.title_id = ta.title_id
left join publishers p
on p.pub_id = t.pub_id
group by 1, 2, 3, 4
order by 5 desc;

select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", p.pub_name as "PUBLISHER", count(t.title_id) as "TITLE COUNT"
from authors a
left join titleauthor ta
on ta.au_id = a.au_id
left join titles t
on t.title_id = ta.title_id
left join publishers p
on p.pub_id = t.pub_id
left join sales s
on s.title_id = t.title_id
group by 1, 2, 3, 4
order by 5 desc
limit 3;

select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", p.pub_name as "PUBLISHER", count(t.title_id) as "TITLE COUNT"
from authors a
left join titleauthor ta
on ta.au_id = a.au_id
left join titles t
on t.title_id = ta.title_id
left join publishers p
on p.pub_id = t.pub_id
left join sales s
on s.title_id = t.title_id
group by 1, 2, 3, 4
order by 5 desc
;