USE `publications`;

#CHALLENGE 1: In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:

#AUTHOR ID - the ID of the author
#LAST NAME - author last name
#FIRST NAME - author first name
#TITLE - name of the published title
#PUBLISHER - name of the publisher where the title was published


SELECT au.`au_id` 'AUTHOR ID', au.`au_lname` 'LAST NAME', au.`au_fname` 'FIRST NAME',ti.`title` 'TITLE', pu.`pub_name` 'PUBLISHER'
FROM `authors` AS au
LEFT JOIN `titleauthor` AS ti_au
ON au.`au_id` = ti_au.`au_id`
LEFT JOIN titles as ti
ON ti_au.`title_id` = ti.`title_id`
LEFT JOIN `publishers` AS pu
ON ti.`pub_id` = pu.`pub_id`;

#Challenge 2 - Who Have Published How Many At Where?
#Elevating from your solution in Challenge 1, how many titles each author has published at each publisher.


SELECT au.`au_id` 'AUTHOR ID', au.`au_lname` 'LAST NAME', au.`au_fname` 'FIRST NAME', pu.`pub_name` 'PUBLISHER', COUNT(ti.`title`) 'TITLE COUNT'
FROM `authors` AS au
LEFT JOIN `titleauthor` AS ti_au
ON au.`au_id` = ti_au.`au_id`
LEFT JOIN titles as ti
ON ti_au.`title_id` = ti.`title_id`
LEFT JOIN `publishers` AS pu
ON ti.`pub_id` = pu.`pub_id`
GROUP BY au.au_id, au.`au_lname`, au.`au_fname`,pu.`pub_name`
ORDER BY au.`au_id` DESC;


#Challenge 3 - Best Selling Authors
#Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

#Requirements:

#Your output should have the following columns:
#AUTHOR ID - the ID of the author
#LAST NAME - author last name
#FIRST NAME - author first name
#TOTAL - total number of titles sold from this author
#Your output should be ordered based on TOTAL from high to low.
#Only output the top 3 best selling authors.
SELECT au.`au_id` 'AUTHOR_ID', au.`au_lname` 'LAST_NAME', au.`au_fname` 'FIRST_NAME', SUM(sa.`qty`) 'SALES_QTY'
FROM `authors` AS au
LEFT JOIN `titleauthor` AS ti_au
ON au.`au_id` = ti_au.`au_id`
LEFT JOIN titles as ti
ON ti_au.`title_id` = ti.`title_id`
LEFT JOIN `sales` AS sa
ON ti.`title_id` = sa.`title_id`
GROUP BY AUTHOR_ID
ORDER BY SALES_QTY DESC
LIMIT 3;

#Challenge 4 - Best Selling Authors Ranking
#Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.



SELECT au.`au_id` 'AUTHOR_ID', au.`au_lname` 'LAST_NAME', au.`au_fname` 'FIRST_NAME', IFNULL (SUM(sa.`qty`),0) 'SALES_QTY'
FROM `authors` AS au
LEFT JOIN `titleauthor` AS ti_au
ON au.`au_id` = ti_au.`au_id`
LEFT JOIN titles as ti
ON ti_au.`title_id` = ti.`title_id`
LEFT JOIN `sales` AS sa
ON ti.`title_id` = sa.`title_id`
GROUP BY AUTHOR_ID
ORDER BY SALES_QTY DESC;

#Bonus Challenge - Most Profiting Authors
#Authors earn money from their book sales in two ways: advance and royalties. An advance is the money that the publisher pays the author before the book comes out. The royalties the author will receive is typically a percentage of the entire book sales. The total profit an author receives by publishing a book is the sum of the advance and the royalties.

#Given the information above, who are the 3 most profiting authors and how much royalties each of them have received? Write a query to find out.

#Requirements:

#Your output should have the following columns:
#AUTHOR ID - the ID of the author
#LAST NAME - author last name
#FIRST NAME - author first name
#PROFIT - total profit the author has received combining the advance and royalties
#Your output should be ordered from higher PROFIT values to lower values.
#Only output the top 3 most profiting authors.


SELECT 
au.`au_id` 'AUTHOR_ID', 
au.`au_lname` 'LAST_NAME', 
au.`au_fname` 'FIRST_NAME',
(ti.`advance`/100) + (ti.`price` * ti.`ytd_sales`) / (1-(ti_au.`royaltyper`/100)) AS 'PROFIT'

FROM `authors` AS au
LEFT JOIN `titleauthor` AS ti_au
ON au.`au_id` = ti_au.`au_id`
LEFT JOIN titles as ti
ON ti_au.`title_id` = ti.`title_id`
GROUP BY AUTHOR_ID, ADVANCE, ROYALTY, PROFIT
ORDER BY PROFIT DESC;






