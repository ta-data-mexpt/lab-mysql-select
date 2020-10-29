/*Challenge #1*/
SELECT titleauthor.au_id 'Author ID', authors.au_lname 'Last Name', authors.au_fname 'First Name', titles.title 'Title', publishers.pub_name 'Publisher'
FROM titleauthor
JOIN authors
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id; 

/*Challenge #2*/ 
SELECT titleauthor.au_id 'Author_ID', authors.au_lname 'Last Name', authors.au_fname 'First Name', 
publishers.pub_name 'Publisher', COUNT(titles.title_id) AS 'Title Count'
FROM titleauthor
JOIN authors
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN publishers
ON titles.pub_id = publishers.pub_id 
GROUP BY Author_ID, Publisher;

/*Challenge #3*/ 
SELECT titleauthor.au_id 'Author_ID', authors.au_lname 'Last Name', authors.au_fname 'First Name', 
SUM(sales.qty) AS 'Total'
FROM titleauthor
JOIN authors
ON titleauthor.au_id = authors.au_id
JOIN titles
ON titleauthor.title_id = titles.title_id
JOIN sales
ON sales.title_id = titles.title_id
GROUP BY titleauthor.au_id 
ORDER BY Total desc 
LIMIT 3;

/*Challenge #4*/ 
SELECT titleauthor.au_id 'Author_ID', authors.au_lname 'Last Name', authors.au_fname 'First Name', 
sum(IFNULL(sales.qty, 0)) AS 'Total'
FROM titleauthor
JOIN authors
ON titleauthor.au_id = authors.au_id
JOIN sales
ON sales.title_id = titleauthor.title_id
group by titleauthor.au_id 
ORDER BY Total desc;