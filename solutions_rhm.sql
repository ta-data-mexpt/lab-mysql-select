-- Challenge 1
SELECT 
	a.au_id as "Author Id",
	a.au_lname as "Last Name",
    a.au_fname as "First Name",
    t.title as "Title",
    p.pub_name as "Publisher"
  FROM authors a
  join titleauthor ta on ta.au_id = a.au_id
  join titles t on t.title_id = ta.title_id 
  join publishers p on p.pub_id = t.pub_id
  order by 1
  ;

-- Challenge 2
SELECT 
	a.au_id as "Author Id",
	a.au_lname as "Last Name",
    a.au_fname as "First Name",
    p.pub_name as "Publisher",
    count(t.title) as "Titles"
  FROM authors a
  join titleauthor ta on ta.au_id = a.au_id
  join titles t on t.title_id = ta.title_id 
  join publishers p on p.pub_id = t.pub_id
  group by 1, 2, 3, 4
  order by 1 desc
  ;

-- Challege 3
SELECT 
	a.au_id as "Author Id",
	a.au_lname as "Last Name",
    a.au_fname as "First Name",
    count(t.title) as "Titles"
  FROM authors a
  join titleauthor ta on ta.au_id = a.au_id
  join titles t on t.title_id = ta.title_id 
  group by 1, 2, 3
  order by 4 desc
  limit 3
  ;




