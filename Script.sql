select
a.au_id as AUTHOR_ID
, a.au_lname as LAST_NAME
, a.au_fname as FIRST_NAME
, tit.title as TITLE
, p.pub_name as PUBLISHER
from
authors a
join titleauthor t 
on a.au_id = t.au_id 
join titles tit	
on tit.title_id = t.title_id 
join publishers p 
on p.pub_id = tit.pub_id;

select
a.au_id as AUTHOR_ID
, a.au_lname as LAST_NAME
, a.au_fname as FIRST_NAME
, p.pub_name as PUBLISHER
, count(distinct tit.title_id) as TITLE_COUNT
from
authors a
join titleauthor t 
on a.au_id = t.au_id 
join titles tit	
on tit.title_id = t.title_id 
join publishers p 
on p.pub_id = tit.pub_id
group BY
a.au_id
, a.au_lname
, a.au_fname
, p.pub_name;

select
a.au_id as AUTHOR_ID
, a.au_lname as LAST_NAME
, a.au_fname as FIRST_NAME
, sum(s.qty) as TOTAL
from
authors a
join titleauthor t 
on a.au_id = t.au_id 
join titles tit	
on tit.title_id = t.title_id 
join sales s 
on s.title_id  = tit.title_id 
group BY
a.au_id
, a.au_lname
, a.au_fname
order by TOTAL desc
limit 3;

select
a.au_id as AUTHOR_ID
, a.au_lname as LAST_NAME
, a.au_fname as FIRST_NAME
, case when sum(s.qty) is null then 0 else sum(s.qty) end as TOTAL
from
authors a
left join titleauthor t 
on a.au_id = t.au_id 
left join titles tit	
on tit.title_id = t.title_id 
left join sales s 
on s.title_id  = tit.title_id 
group BY
a.au_id
, a.au_lname
, a.au_fname
order by TOTAL desc;

select
a.au_id as AUTHOR_ID
, a.au_lname as LAST_NAME
, a.au_fname as FIRST_NAME
, sum(t2.royaltyper) + sum(r.royalty/100 * s.qty) as PROFIT
from
authors a
left join titleauthor t 
on a.au_id = t.au_id 
left join titles tit	
on tit.title_id = t.title_id 
left join sales s 
on s.title_id  = tit.title_id 
left join titleauthor t2 
on t2.title_id = tit.title_id 
left join roysched r 
on r.title_id = tit.title_id
group BY
a.au_id
, a.au_lname
, a.au_fname
order by PROFIT desc
Limit 3;
