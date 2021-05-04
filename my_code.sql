use publications;

SELECT a.au_id as 'Author ID', a.au_lname as 'Last name', a.au_fname as 'First name', t.title as 'Title', p.pub_name as 'Publisher'
FROM authors a
LEFT JOIN titleauthor ta on a.au_id = ta.au_id
JOIN titles t on ta.title_id = t.title_id
JOIN publishers p on t.pub_id = p.pub_id
LIMIT 5;

SELECT a.au_id as 'Author ID', a.au_lname as 'Last name', a.au_fname as 'First name', p.pub_name as 'Publisher', count(DISTINCT(t.title)) as 'Title Count'
FROM authors a
LEFT JOIN titleauthor ta on a.au_id = ta.au_id
JOIN titles t on ta.title_id = t.title_id
JOIN publishers p on t.pub_id = p.pub_id
GROUP BY 1,4
ORDER BY 5 DESC;

SELECT a.au_id as 'Author ID', a.au_lname as 'Last name', a.au_fname as 'First name', count(DISTINCT(t.title)) as 'Title Count'
FROM authors a
LEFT JOIN titleauthor ta on a.au_id = ta.au_id
JOIN titles t on ta.title_id = t.title_id
JOIN publishers p on t.pub_id = p.pub_id
GROUP BY 1
ORDER BY 4 DESC
LIMIT 3;

SELECT a.au_id as 'Author ID', a.au_lname as 'Last name', a.au_fname as 'First name', count(DISTINCT(t.title)) as 'Title Count'
FROM authors a
LEFT JOIN titleauthor ta on a.au_id = ta.au_id
JOIN titles t on ta.title_id = t.title_id
JOIN publishers p on t.pub_id = p.pub_id
GROUP BY 1
ORDER BY 4 DESC;

SELECT a.au_id as 'Author ID', a.au_lname as 'Last name', a.au_fname as 'First name', sum(roy.royalty + t.advance) as 'Profit'
FROM authors a
LEFT JOIN titleauthor ta on a.au_id = ta.au_id
JOIN titles t on ta.title_id = t.title_id
JOIN publishers p on t.pub_id = p.pub_id
JOIN roysched roy on roy.title_id = t.title_id
GROUP BY 1
ORDER BY 4 DESC
LIMIT 3;