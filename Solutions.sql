/**/
/*CHALLENGE 1
Qué títulos ha publicado cada autor en qué editoriales.*/
select a.au_fname as Nombre, a.au_lname as Apellido, c.title as Título,d.pub_name as Editorial 
from authors a
join titleauthor b
on a.au_id=b.au_id
join titles c
on c.title_id = b.title_id
join publishers d 
on d.pub_id=c.pub_id;

/*CHALLENGE 2
Cuántos libros ha publicado cada autor en las editoriales*/
select a.au_fname as Nombre, a.au_lname as Apellido,
d.pub_name as Editorial, count(c.title) as Libros
from authors a
join titleauthor b
on a.au_id=b.au_id
join titles c
on c.title_id = b.title_id
join publishers d 
on d.pub_id=c.pub_id
group by d.pub_name, a.au_id /*tiene que ser por id porque los nombres se podrían repetir*/
order by count(c.title) desc;

/*CHALLENGE 3
Top 3 de autores con más ventas*/
select b.au_id, a.qty, c.au_fname, c.au_lname 
from sales a  
left join titleauthor b
on a.title_id= b.title_id
left join authors c 
on c.au_id=b.au_id 
group by au_id
order by qty desc
limit 3;

/*CHALLENGE 4
Top 3 de autores con más ventas*/

select b.au_id, a.qty, c.au_fname, c.au_lname 
from sales a  
join titleauthor b
on a.title_id= b.title_id
join authors c 
on c.au_id=b.au_id 
group by au_id
order by qty asc;

