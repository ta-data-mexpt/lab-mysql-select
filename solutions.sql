USE publications;

SELECT *
FROM titleauthor;

/*
Challenge 1 - Who Have Published What At Where?

    AUTHOR ID - the ID of the author
    LAST NAME - author last name
    FIRST NAME - author first name
    TITLE - name of the published title
    PUBLISHER - name of the publisher where the title was published
*/

SELECT 
    A.au_id 'AUTHOR ID',
    A.au_lname 'LAST NAME',
    A.au_fname 'FIRST NAME',
    T.title 'TITLE',
    P.pub_name 'PUBLISHER'
FROM
    authors A
        RIGHT JOIN
    titleauthor TA ON A.au_id = TA.au_id
        LEFT JOIN
    titles T ON TA.title_id = T.title_id
        LEFT JOIN
    publishers P ON T.pub_id = P.pub_id
ORDER BY a.au_id;

/*
Challenge 2 - Who Have Published How Many At Where?
Elevating from your solution in Challenge 1, query how many titles each author has published at each publisher. 
*/

SELECT 
    A.au_id 'AUTHOR ID',
    A.au_lname 'LAST NAME',
    A.au_fname 'FIRST NAME',
    P.pub_name 'PUBLISHER',
    COUNT(T.title) 'TITLE COUNT'
FROM
    authors A
        RIGHT JOIN
    titleauthor TA ON A.au_id = TA.au_id
        LEFT JOIN
    titles T ON TA.title_id = T.title_id
        LEFT JOIN
    publishers P ON T.pub_id = P.pub_id
GROUP BY a.au_id , p.pub_name
ORDER BY a.au_id DESC;

/*
Challenge 3 - Best Selling Authors
Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

Requirements:

    Your output should have the following columns:
        AUTHOR ID - the ID of the author
        LAST NAME - author last name
        FIRST NAME - author first name
        TOTAL - total number of titles sold from this author
    Your output should be ordered based on TOTAL from high to low.
    Only output the top 3 best selling authors.
*/

SELECT 
    A.au_id 'AUTHOR ID',
    A.au_lname 'LAST NAME',
    A.au_fname 'FIRST NAME',
    SUM(S.qty) 'TOTAL'
FROM
    authors A
        LEFT JOIN
    titleauthor TA ON A.au_id = TA.au_id
        LEFT JOIN
    titles T ON TA.title_id = T.title_id
        LEFT JOIN
    sales s ON T.title_id = S.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC
LIMIT 3;

/*
Challenge 4 - Best Selling Authors Ranking
Now modify your solution in Challenge 3 so that the output will display all 23 authors instead of the top 3. 
Note that the authors who have sold 0 titles should also appear in your output (ideally display 0 instead of NULL as the TOTAL). 
Also order your results based on TOTAL from high to low.
*/

SELECT 
    A.au_id 'AUTHOR ID',
    A.au_lname 'LAST NAME',
    A.au_fname 'FIRST NAME',
    IFNULL (SUM(S.qty), 0) 'TOTAL'
FROM
    authors A
        LEFT JOIN
    titleauthor TA ON A.au_id = TA.au_id
        LEFT JOIN
    titles T ON TA.title_id = T.title_id
        LEFT JOIN
    sales s ON T.title_id = S.title_id
GROUP BY a.au_id
ORDER BY TOTAL DESC;