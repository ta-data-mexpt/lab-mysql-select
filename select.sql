-- challenge 1
SELECT au.au_id, au_lname, au_fname, tt.title, pu.pub_name
from authors au
inner join titleauthor tau on tau.au_id = au.au_id
inner join titles tt on tt.title_id = tau.title_id
inner join publishers pu on pu.pub_id = tt.pub_id

-- challenge 2
SELECT au.au_id, au.au_lname, au.au_fname, pu.pub_name, count(tt.title)
from authors au
inner join titleauthor tau on tau.au_id = au.au_id
inner join titles tt on tt.title_id = tau.title_id
inner join publishers pu on pu.pub_id = tt.pub_id
GROUP BY  au.au_id, au.au_lname, au.au_fname, pu.pub_name

-- challenge 3
SELECT au.au_id, au.au_lname, au.au_fname, sum(qty)
from authors au
inner join titleauthor tau on tau.au_id = au.au_id
inner join titles tt on tt.title_id = tau.title_id
inner join publishers pu on pu.pub_id = tt.pub_id
inner join sales sa on sa.title_id = tt.title_id
GROUP BY  au.au_id, au.au_lname, au.au_fname, pu.pub_name
order by sum(qty) desc limit 3

-- challenge 4
SELECT au.au_id, au.au_lname, au.au_fname, sum(qty)
from authors au
inner join titleauthor tau on tau.au_id = au.au_id
inner join titles tt on tt.title_id = tau.title_id
inner join publishers pu on pu.pub_id = tt.pub_id
inner join sales sa on sa.title_id = tt.title_id
GROUP BY  au.au_id, au.au_lname, au.au_fname, pu.pub_name
order by sum(qty) desc 