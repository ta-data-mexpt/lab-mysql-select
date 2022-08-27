USE publications;

# Challenge 1: Who have published what at where

SELECT authors.au_id, authors.au_lname AS last_name, authors.au_fname AS first_name, 
titleauthor.title_id, titles.title, publishers.pub_name FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
WHERE titles.title IS NOT NULL;

# Challenge 2: Who have published how many at where?

SELECT authors.au_id, authors.au_lname AS last_name, authors.au_fname AS first_name, 
COUNT(titleauthor.title_id), publishers.pub_name FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN publishers ON titles.pub_id = publishers.pub_id
WHERE titles.title IS NOT NULL
GROUP BY authors.au_id, publishers.pub_name;

# Challenge 3: Best selling authors

SELECT authors.au_id, authors.au_lname, authors.au_fname, SUM(sales.qty) AS total FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY au_lname, au_fname
ORDER BY total DESC
LIMIT 3;

# Challenge 4: Best selling authors ranking

SELECT authors.au_id, authors.au_lname, authors.au_fname, IFNULL(SUM(sales.qty), 0) AS total FROM authors
LEFT JOIN titleauthor ON authors.au_id = titleauthor.au_id
LEFT JOIN titles ON titleauthor.title_id = titles.title_id
LEFT JOIN sales ON titleauthor.title_id = sales.title_id
GROUP BY au_lname, au_fname
ORDER BY total DESC;

# Bonus challenge: Most profitable authors

select titles.title_id, titles.title, titles.advance, titles.royalty, titles.advance * (titles.royalty/100) as advance_earnings, 
titles.price, authors.au_id, authors.au_fname, authors.au_lname, titleauthor.royaltyper, sum(sales.qty) as total_sales, 
(royalty/100) * price * sum(sales.qty) * (royaltyper/100) as royalty_earnings, 
(titles.advance * (titles.royalty/100)) + ((royalty/100) * price * sum(sales.qty) * (royaltyper/100)) as total_earnings 
from titles
left join titleauthor on titles.title_id = titleauthor.title_id
left join authors on titleauthor.au_id = authors.au_id
left join sales on titles.title_id = sales.title_id
where titles.price is not null
group by titles.title_id, authors.au_id
order by total_earnings desc;
