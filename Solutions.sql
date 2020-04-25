USE publications;

# Challenge 1

SELECT 
authors.au_id AS "AUTHOR ID", 
authors.au_lname AS "LAST NAME", 
authors.au_fname AS "FIRST NAME", 
titles.title AS "TITLE", 
publishers.pub_name AS "PUBLISHER"
FROM authors, titles, publishers
ORDER BY authors.au_id;

# Challenge 2

select AUTHORID, LASTNAME, FIRSTNAME, PUBLISHERS, count(title) as "TITLE COUNT" from(
SELECT au.au_id as AUTHORID, au.au_lname as LASTNAME, au.au_fname as FIRSTNAME, t.title as TITLE, 
p.pub_name as PUBLISHERS
from 
authors as au
left join titleauthor as tau
on au.au_id = tau.au_id
inner join titles t
on tau.title_id=t.title_id
inner join publishers p
on t.pub_id= p.pub_id) PRIMERA
group by AUTHORID, PUBLISHERS;

# Challenge 3

select AUTHORID, LASTNAME, FIRSTNAME, count(title) as TOTAL from(
SELECT au.au_id as AUTHORID, au.au_lname as LASTNAME, au.au_fname as FIRSTNAME, t.title as TITLE
from 
authors as au
left join titleauthor as tau
on au.au_id = tau.au_id
inner join titles t
on tau.title_id=t.title_id
) PRIMERA
group by AUTHORID
ORDER BY TOTAL DESC LIMIT 3;

# Challenge 4

select AUTHORID, LASTNAME, FIRSTNAME, count(title) as TOTAL from(
SELECT au.au_id as AUTHORID, au.au_lname as LASTNAME, au.au_fname as FIRSTNAME, t.title as TITLE
from 
authors as au
left join titleauthor as tau
on au.au_id = tau.au_id
inner join titles t
on tau.title_id=t.title_id
) PRIMERA
group by AUTHORID
ORDER BY TOTAL DESC LIMIT 23;