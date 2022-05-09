-- CHALLENGE 1
select * from authors;
select * from titles;
select * from publishers;
select * from titleauthor;


create temporary table challenge_1
select au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, title as TITLE, pub_name as PUBLISHER
from authors
join titleauthor
using (au_id)
join titles
using (title_id)
join publishers
using (pub_id);

drop table challenge_1;

select count(AUTHOR_ID) from challenge_1;
select * from challenge_1;
select AUTHOR_ID from challenge_1;

-- CHALLENGE 2
select AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER, count(TITLE) as TITLE_COUNT
from challenge_1
group by AUTHOR_ID,LAST_NAME, FIRST_NAME, PUBLISHER
order by AUTHOR_ID desc ,LAST_NAME, FIRST_NAME, PUBLISHER desc;

-- Challenge 3
SELECT * from sales;

SELECT AUTHOR_ID, LAST_NAME, FIRST_NAME, SUM(qty) AS TOTAL
FROM challenge_1
JOIN titles
ON challenge_1.TITLE = titles.title
JOIN sales
USING (title_id)
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3;

select au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, sum(qty) AS TOTAL
from authors
left join titleauthor
using (au_id)
left join sales
using (title_id)
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC
LIMIT 3;

-- Challenge 4
SELECT COUNT(title_id) from sales;

select au_id as AUTHOR_ID, au_lname as LAST_NAME, au_fname as FIRST_NAME, IFNULL(sum(qty),0) AS TOTAL
from authors
left join titleauthor
using (au_id)
left join sales
using (title_id)
GROUP BY AUTHOR_ID
ORDER BY TOTAL DESC;




