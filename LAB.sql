#challege 1
SELECT 
a.au_id AS 'AUTHOR ID' ,
a.au_lname AS 'LAST NAME' ,
a.au_fname AS 'FIRST NAME' ,
t.title as 'TITLE' ,
p.pub_name as 'PUBLISHER'
FROM authors a 
JOIN titleauthor ta 
ON a.au_id = ta.au_id 
JOIN titles t 
ON ta.title_id = t.title_id 
JOIN publishers p 
ON  t.pub_id = p.pub_id ;

#challenge 2 
SELECT 
a.au_id AS 'AUTHOR ID' ,
a.au_lname AS 'LAST NAME' ,
a.au_fname AS 'FIRST NAME' ,
t.title as 'TITLE' ,
p.pub_name as 'PUBLISHER',
COUNT(t.title) as 'TITLE COUNT'
FROM authors a 
JOIN titleauthor ta 
ON a.au_id = ta.au_id 
JOIN titles t 
ON ta.title_id = t.title_id 
JOIN publishers p 
ON  t.pub_id = p.pub_id
GROUP BY title ;

#challenge 3
SELECT a.au_fname AS 'AUTHOR ID' , 
a.au_lname AS 'L NAME' , 
a.au_fname AS 'f NAME', 
SUM(s.qty)  AS 'SALES'
FROM authors  a              
JOIN titleauthor t ON a.au_id = t.au_id
JOIN titles te ON t.title_id = te.title_id
JOIN sales s ON te.title_id = s.title_id
GROUP BY a.au_id
ORDER BY SALES DESC
LIMIT 23 ;

#challenge 4
SELECT a.au_fname AS 'AUTHOR ID' , 
a.au_lname AS 'L NAME' , 
a.au_fname AS 'f NAME', 
 IFNULL(SUM(s.qty),0) AS 'SALES'  
FROM authors a              
JOIN titleauthor t ON a.au_id = t.au_id
JOIN titles te ON t.title_id = te.title_id
JOIN sales s ON te.title_id = s.title_id
GROUP BY a.au_id
ORDER BY SALES DESC
LIMIT 23  ;

#challenge bonus
 SELECT a.au_id  , a.au_lname AS 'Last NAME ',  SUM(t.ytd_sales*0.01*t.royalty +  advance) AS 'PROFIT'
 FROM authors a 
 JOIN titleauthor te 
 ON a.au_id = te.au_id
 JOIN titles t
 ON te.title_id = t.title_id
 GROUP BY au_id
 ORDER BY PROFIT DESC
 LIMIT 3 ;
