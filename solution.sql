use publications;
CREATE TABLE test_table
select 
	au.au_id AUTHOR_ID,
    au.au_lname LAST_NAME,
    au.au_fname FIRST_NAME,
    t.title TITLE,
    p.pub_name PUBLISHER
from
	authors au
left join
	titleauthor tau
		on au.au_id = tau.au_id
left join
	titles t
		on tau.title_id = t.title_id
left join
	publishers p
		on t.pub_id = p.pub_id
where t.title is not null;

SELECT * from titleauthor;
SELECT COUNT(*)
from titleauthor;

/* CHALLENGE 2*/
CREATE TABLE test_table2
select 
    au.au_id AUTHOR_ID,
    au.au_lname LAST_NAME,
    au.au_fname FIRST_NAME,
    p.pub_name PUBLISHER,
    COUNT(t.title_id) as TITLE_COUNT
    
from
	authors au
left join
	titleauthor tau
		on au.au_id = tau.au_id
left join
	titles t
		on tau.title_id = t.title_id
left join
	publishers p
		on t.pub_id = p.pub_id
where p.pub_name is not null
group by 1,4
order by 1 desc;

select sum(title_count) from test_table2;

/* CHALLENGE 3 */

Select 
au.au_id 'AUTHOR ID',
au.au_lname 'LAST NAME',
au.au_fname 'FIRST NAME',
sum(s.qty) as TOTAL
from 
	authors au
left join
	titleauthor tau
    on au.au_id = tau.au_id
left join
	sales s
    on tau.title_id = s.title_id
where s.qty is not null
group by au.au_id, au.au_lname, au.au_fname
order by TOTAL desc
LIMIT 3;

/* chequeo challenge 3*/
select
au.au_id,
au.au_lname,
au.au_fname,
tau.title_id
from authors au
left join titleauthor tau
on au.au_id = tau.au_id;

select * from sales
where title_id='BU2075' or title_id='BU1032';

/* CHALLENGE 4 */
Select 
au.au_id 'AUTHOR ID',
au.au_lname 'LAST NAME',
au.au_fname 'FIRST NAME',
sum(s.qty) as TOTAL
from 
	authors au
left join
	titleauthor tau
    on au.au_id = tau.au_id
left join
	sales s
    on tau.title_id = s.title_id
group by au.au_id, au.au_lname, au.au_fname
order by TOTAL desc;