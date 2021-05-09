Use publications;


/*Challenge 1 - Who Have Published What At Where?
In this challenge you will write a MySQL SELECT query that joins various tables to figure out what titles each author has published at which publishers. Your output should have at least the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TITLE - name of the published title
PUBLISHER - name of the publisher where the title was published
*/
Select  au.au_id "AUTHOR ID", au.au_lname "LAST NAME", au.au_fname "FIRST NAME", ti.title "TITLE", pu.pub_name "PUBLISHER"
From authors au
inner Join titleauthor ti_au
on au.au_id = ti_au.au_id
inner join titles ti
on ti_au.title_id = ti.title_id
inner join publishers pu
on ti.pub_id = pu.pub_id;

/*Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. Your output should look something like below:

Note: the screenshot above is not the complete output.

To check if your output is correct, sum up the TITLE COUNT column. The sum number should be the same as the total number of records in Table titleauthor.

Hint: In order to count the number of titles published by an author, you need to use MySQL COUNT. Also check out MySQL Group By because you will count the rows of different groups of data. Refer to the references and learn by yourself. These features will be formally discussed in the Temp Tables and Subqueries lesson.
*/

Select  au.au_id "AUTHOR ID", au.au_lname "LAST NAME", au.au_fname "FIRST NAME", pu.pub_name "PUBLISHER", COUNT(ti.title) "TITLE COUNT"
From authors au
inner Join titleauthor ti_au
on au.au_id = ti_au.au_id
inner join titles ti
on ti_au.title_id = ti.title_id
inner join publishers pu
on ti.pub_id = pu.pub_id
GROUP BY au.au_id, pu.pub_name
ORDER BY COUNT(ti.title) DESC;

/* Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:
Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
TOTAL - total number of titles sold from this author
Your output should be ordered based on TOTAL from high to low.
Only output the top 3 best selling authors.
Hint: In order to calculate the total of profits of an author, you need to use the MySQL SUM function. Refer to the reference and learn how to use it.
*/
Select  au.au_id "AUTHOR ID", au.au_lname "LAST NAME", au.au_fname "FIRST NAME", SUM(sa.qty) "Sales Quantity"
From authors au
inner Join titleauthor ti_au
on au.au_id = ti_au.au_id
inner join titles ti
on ti_au.title_id = ti.title_id
inner join sales sa
on ti.title_id=sa.title_id
GROUP BY au.au_id
ORDER BY SUM(sa.qty) DESC
lIMIT 3;

/*Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). Also order your results based on TOTAL from high to low.


*/
Select  au.au_id "AUTHOR ID", au.au_lname "LAST NAME", au.au_fname "FIRST NAME", SUM(sa.qty) "Sales Quantity"
From authors au
inner Join titleauthor ti_au
on au.au_id = ti_au.au_id
inner join titles ti
on ti_au.title_id = ti.title_id
inner join sales sa
on ti.title_id=sa.title_id
GROUP BY au.au_id
ORDER BY SUM(sa.qty) DESC;

/*Bonus Challenge - Most Profiting Authors
Authors earn money from their book sales in two ways: advance and royalties. An advance is the money that the publisher pays the author before the book comes out. The royalties the author will receive is typically a percentage of the entire book sales. The total profit an author receives by publishing a book is the sum of the advance and the royalties.

Given the information above, who are the 3 most profiting authors and how much royalties each of them have received? Write a query to find out.

Requirements:

Your output should have the following columns:
AUTHOR ID - the ID of the author
LAST NAME - author last name
FIRST NAME - author first name
PROFIT - total profit the author has received combining the advance and royalties
Your output should be ordered from higher PROFIT values to lower values.
Only output the top 3 most profiting authors.
Hints:

If a title has multiple authors, how they split the royalties can be found in the royaltyper column of the titleauthor table.
We assume the coauthors will split the advance in the same way as the royalties.

*/
Select 
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


