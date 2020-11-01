#Validación Tileauthor tiene 25 filas
select *
from titleauthor;

#Challenge 1: Who Have Published What At Where?
select AU.au_id,AU.au_lname,AU.au_fname,TI.title,PU.pub_name
from authors AU
right join titleauthor TA
on AU.au_id=TA.au_id
left join titles TI
on TA.title_id=TI.title_id
left join publishers PU
on TI.pub_id=PU.pub_id
order by au.au_id;

#Challenge 2: Who Have Published How Many At Where?
CREATE temporary table How_many as
select AU.au_id,AU.au_lname,AU.au_fname,PU.pub_name, COUNT(TI.title) as sum_titles
from authors AU
right join titleauthor TA
on AU.au_id=TA.au_id
left join titles TI
on TA.title_id=TI.title_id
left join publishers PU
on TI.pub_id=PU.pub_id
GROUP BY AU.au_id, PU.pub_name
order by au.au_id DESC;

#Validación: la suma de los títulos coincide con las 25 filas de titleauthor
select sum(sum_titles)
from how_many;

#Challenge 3: Best Selling Authors
select AU.au_id,AU.au_lname,AU.au_fname,sum(SA.qty) TOTAL
from authors AU
right join titleauthor TA
on AU.au_id=TA.au_id
left join titles TI
on TA.title_id=TI.title_id
right join sales SA
on TI.title_id=SA.title_id
group by au.au_id
order by TOTAL DESC
LIMIT 3;

#Challenge 4:Best Selling Authors Ranking
select AU.au_id,AU.au_lname,AU.au_fname,ifnull(sum(SA.qty),0) TOTAL
from authors AU
left join titleauthor TA
on AU.au_id=TA.au_id
left join titles TI
on TA.title_id=TI.title_id
left join sales SA
on TI.title_id=SA.title_id
group by au.au_id
order by TOTAL DESC;

#Bonus challenge:Most Profiting Authors
SELECT PROFIT_IND.AU_ID, PROFIt_IND.au_lname, PROFIT_IND.au_fname, SUM(PROFIT_IND.GET_PROFIT) PROFIT
FROM (select AU.au_id,AU.au_lname,AU.au_fname, ti.title_id,TA.royaltyper,TI.advance,TI.royalty,(TI.advance+(TI.royalty/100)*ti.ytd_sales)*(TA.royaltyper/100) GET_PROFIT
from authors AU
left join titleauthor TA
ON AU.au_id=TA.au_id
left join titles TI
on TA.title_id=TI.title_id
group by au.au_id
order by ti.title_id) PROFIT_IND
group by PROFIT_IND.au_id
ORDER BY PROFIT DESC
LIMIT 3;
