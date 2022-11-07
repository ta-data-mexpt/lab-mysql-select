select ta.au_id "AUTHOR ID", a.au_lname "LAST NAME", a.au_fname "FIRST NAME", t.title "TITLE", p.pub_name "PUBLISHER"
from titleauthor ta
inner join authors a on ta.au_id = a.au_id
inner join titles t on ta.title_id = t.title_id
inner join publishers p on t.pub_id = p.pub_id;


-- The INNER JOIN keyword selects records that have matching values in both tables.
select ta.au_id "AUTHOR ID", a.au_lname "LAST NAME", a.au_fname "FIRST NAME", p.pub_name "PUBLISHER", count(t.title) "TITLE COUNT"
from titleauthor ta
inner join authors a on ta.au_id = a.au_id
inner join titles t on ta.title_id = t.title_id
inner join publishers p on t.pub_id = p.pub_id
group by ta.au_id, p.pub_id
order by count(t.title) desc;


-- The LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2). The result is 0 records from the right side, if there is no match.
select a.au_id "AUTHOR ID", a.au_lname "LAST NAME", a.au_fname "FIRST NAME", count(qty) "TOTAL"
from authors a
left join titleauthor ta on a.au_id = ta.au_id
left join sales s on ta.title_id = s.title_id
group by a.au_id, a.au_lname, a.au_fname
order by count(qty) desc
limit 3;

-- The COALESCE() function returns the first non-null value in a list.
-- The DESC command is used to sort the data returned in descending order.
select a.au_id "AUTHOR ID", a.au_lname "LAST NAME", a.au_fname "FIRST NAME", sum(coalesce(qty,0)) "TOTAL"
from authors a
left join titleauthor ta on a.au_id = ta.au_id
left join sales s on tar.title_id = s.title_id
group by a.au_id, a.au_fname, a.au_lname
order by sum(coalesce(qty,0)) desc;

