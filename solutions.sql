USE publi;

-- Challenge 1 --

SELECT au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname as FIRST_NAME, title AS TITLE, pub_name AS PUBLISHER
FROM authors AS a
JOIN titleauthor AS ta USING (au_id)
JOIN titles AS t USING (title_id)
JOIN publishers AS p USING (pub_id);

SELECT COUNT(au_id) FROM titleauthor;

-- Challenge 2 --

SELECT au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname as FIRST_NAME, pub_name AS PUBLISHER, COUNT(title_id) AS TITLE_COUNT
FROM authors AS a
JOIN titleauthor AS ta USING (au_id)
JOIN titles AS t USING (title_id)
JOIN publishers AS p USING (pub_id)
GROUP BY t.title_id;

SELECT COUNT(au_id) FROM titleauthor;


-- Challenge 3 --

SELECT au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname as FIRST_NAME, SUM(qty) AS TOTAL
FROM authors AS a
JOIN titleauthor AS ta USING (au_id)
JOIN titles AS t USING (title_id)
JOIN sales AS p USING (title_id)
GROUP BY (AUTHOR_ID)
ORDER BY TOTAL DESC
LIMIT 3;


-- Challenge 4 --

SELECT au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname as FIRST_NAME, IFNULL(SUM(qty),0) AS TOTAL
FROM authors AS a
LEFT JOIN titleauthor AS ta USING (au_id)
LEFT JOIN titles AS t USING (title_id)
LEFT JOIN sales AS p USING (title_id)
GROUP BY (AUTHOR_ID)
ORDER BY TOTAL DESC;

-- Bonus Challenge --

SELECT au_id AS AUTHOR_ID, au_lname AS LAST_NAME, au_fname as FIRST_NAME, IFNULL(SUM(royaltyper),0) as PROFIT
FROM authors AS a
LEFT JOIN titleauthor AS ta USING (au_id)
LEFT JOIN titles AS t USING (title_id)
LEFT JOIN sales AS p USING (title_id)
GROUP BY AUTHOR_ID
ORDER BY PROFIT DESC
LIMIT 3;
