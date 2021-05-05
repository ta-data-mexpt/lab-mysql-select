/*
authors
	- au_id
	- au_lname
	- au_fname
titleauthor
	- au_id
	- title_id
titles
	- title_id
	- title
    - pub_id
publisher
	- pub_id
	- pub_name
*/
----------------------------
-- Who have published what at where
select 
	a.au_id,
    a.au_lname,
    a.au_fname,
    t.title,
    p.pub_name
from authors a
left join titleauthor ta
	on a.au_id = ta.au_id
left join titles t
	on ta.title_id = t.title_id
left join publishers p
	on t.pub_id = p.pub_id
limit 10    
;
----------------------------
-- Who have published how many at where
select 
	a.au_id,
    a.au_lname,
    a.au_fname,
    p.pub_name,
    count(t.title) as title_count
from authors a
left join titleauthor ta
	on a.au_id = ta.au_id
left join titles t
	on ta.title_id = t.title_id
left join publishers p
	on t.pub_id = p.pub_id
group by    
	a.au_id,
    a.au_lname,
    a.au_fname,
    p.pub_name
order by title_count desc    
limit 10    
;
----------------------------
-- Best selling authors
/*
titles
	- ytd_sales
	- title_id
*/
select 
	a.au_id,
    a.au_lname,
    a.au_fname,
    sum(t.ytd_sales) as total
from authors a
left join titleauthor ta
	on a.au_id = ta.au_id
left join titles t
	on ta.title_id = t.title_id
group by    
	a.au_id,
    a.au_lname,
    a.au_fname
order by total desc    
limit 3    
;
----------------------------
-- Best selling authors ranking
select 
	a.au_id,
    a.au_lname,
    a.au_fname,
    if(isnull(sum(t.ytd_sales)),0,sum(t.ytd_sales)) as total
from authors a
left join titleauthor ta
	on a.au_id = ta.au_id
left join titles t
	on ta.title_id = t.title_id
group by    
	a.au_id,
    a.au_lname,
    a.au_fname
order by total desc    
limit 23    
;
----------------------------
-- Most profiting authors
/*
titles
	- title_id
    - price
    - royalty
    - ytd_sales
    - advance
sales
	- qty
*/
select 
	a2.au_id,
    a2.au_lname,
    a2.au_fname,
	if(isnull(b.profit),0,b.profit) as profit
from authors a2
left join
	( 
	select 
		a.au_id,
		a.au_lname,
		a.au_fname,
		t.price * t.ytd_sales as entaire_sales,
		royalty,
		(t.price * t.ytd_sales) * (royalty/100) as profit_sales,
		t.advance,
		((t.price * t.ytd_sales) * (royalty/100)) + t.advance as profit
	from authors a
	left join titleauthor ta
		on a.au_id = ta.au_id
	left join titles t
		on ta.title_id = t.title_id
	group by    
		a.au_id,
		a.au_lname,
		a.au_fname
	order by profit desc
	) as b
on a2.au_id = b.au_id
order by profit desc
;
