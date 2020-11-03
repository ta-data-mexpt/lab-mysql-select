USE publications;

## chalenge 1

SELECT a.au_id, b.au_lname, b.au_fname, c.title, d.pub_name from titleauthor
AS a
INNER JOIN authors as b
on a.au_id = b.au_id
inner join titles 
as c
on a.title_id = c.title_id
inner join publishers as d
on c.pub_id = d.pub_id;

## chalenge 2

select tabla.pub_name, tabla.au_lname, tabla.au_fname, count(tabla.pub_name) as cuenta from (
  SELECT a.au_id, b.au_lname, b.au_fname, c.title, d.pub_name from titleauthor
  AS a
  INNER JOIN authors as b
  on a.au_id = b.au_id
  inner join titles 
  as c
  on a.title_id = c.title_id
  inner join publishers as d
  on c.pub_id = d.pub_id
) as tabla

group by tabla.pub_name, tabla.au_lname, tabla.au_fname 
order by cuenta desc, au_lname;

## chalenge 3

select a.au_id, a.au_lname, a.au_fname, titsa.ventas from (
  select tit.title_id, tit.title, CASE when sum(s.qty) is null then 0 else sum(s.qty) end as ventas from titles as tit
  left join sales as s
  on tit.title_id = s.title_id
  group by tit.title_id, tit.title
) as titsa

inner join titleauthor as ta
on titsa.title_id = ta.title_id
inner join authors as a
on ta.au_id = a.au_id
order by ventas desc
limit 3

## chalenge 4

select a.au_id, a.au_lname, a.au_fname, titsa.ventas from (
  select tit.title_id, tit.title, CASE when sum(s.qty) is null then 0 else sum(s.qty) end as ventas from titles as tit
  left join sales as s
  on tit.title_id = s.title_id
  group by tit.title_id, tit.title
) as titsa

inner join titleauthor as ta
on titsa.title_id = ta.title_id
inner join authors as a
on ta.au_id = a.au_id
order by ventas desc

