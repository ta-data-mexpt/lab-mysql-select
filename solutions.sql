USE publications;

-- Challenge 1
CREATE TABLE C1
SELECT au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, title AS TITLE, pub_name AS PUBLISHER
FROM authors
JOIN titleauthor
USING (au_id)
JOIN titles
USING (title_id)
JOIN publishers
USING (pub_id);

-- Challenge 2
SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, count(TITLE) as TITLE_COUNT
FROM C1
GROUP BY AUTHOR_ID,LAST_NAME, FIRST_NAME, PUBLISHER
ORDER BY AUTHOR_ID desc ,LAST_NAME, FIRST_NAME, PUBLISHER desc;

-- Challenge 3
SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, SUM(qty) AS TOTAL
FROM C1
JOIN titles
ON c1.TITLE= titles.title
JOIN sales
USING (title_id)
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 5;

-- Challenge 4
SELECT au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname AS FIRST_NAME, IFNULL(sum(qty),0) AS TOTAL
FROM authors
left JOIN titleauthor
USING (au_id)
LEFT JOIN titles
USING (title_id)
LEFT JOIN sales
USING (title_id)
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC;










