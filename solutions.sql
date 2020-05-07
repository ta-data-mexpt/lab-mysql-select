/*Challenge 1*/
SELECT
`publications`.`authors`.`au_id` AS "AUTHOR_ID",
`publications`.`authors`.`au_lname` AS "LAST NAME",
`publications`.`authors`.`au_fname` AS "FIRST NAME",
`publications`.`titles`.`title` AS "TITLE",
`publications`.`publishers`.`pub_name` AS "PUBLISHER"
FROM
`publications`.`authors`
INNER JOIN `publications`.`titleauthor`
ON `publications`.`authors`.`au_id`=`publications`.`titleauthor`.`au_id`
INNER JOIN `publications`.`titles`
ON `publications`.`titleauthor`.`title_id`=`publications`.`titles`.`title_id`
INNER JOIN `publications`.`publishers`
ON `publications`.`publishers`.`pub_id`=`publications`.`titles`.`pub_id`;

/*Challenge 2*/
SELECT
`publications`.`authors`.`au_id` AS "AUTHOR_ID",
`publications`.`authors`.`au_lname` AS "LAST NAME",
`publications`.`authors`.`au_fname` AS "FIRST NAME",
`publications`.`publishers`.`pub_name` AS "PUBLISHER",
COUNT(`publications`.`titles`.`title`) AS "TITLE COUNT"
FROM
`publications`.`authors`
INNER JOIN `publications`.`titleauthor`
ON `publications`.`authors`.`au_id`=`publications`.`titleauthor`.`au_id`
INNER JOIN `publications`.`titles`
ON `publications`.`titleauthor`.`title_id`=`publications`.`titles`.`title_id`
INNER JOIN `publications`.`publishers`
ON `publications`.`publishers`.`pub_id`=`publications`.`titles`.`pub_id`
GROUP BY `publications`.`publishers`.`pub_name`,`publications`.`authors`.`au_id`;

/*Challege 3*/

SELECT
`publications`.`authors`.`au_id` AS "AUTHOR_ID",
`publications`.`authors`.`au_lname` AS "LAST NAME",
`publications`.`authors`.`au_fname` AS "FIRST NAME",
`publications`.`titles`.`title` AS "TITLE",
sum(`publications`.`sales`.`qty`) AS TOTAL
FROM
`publications`.`authors`
INNER JOIN `publications`.`titleauthor`
ON `publications`.`authors`.`au_id`=`publications`.`titleauthor`.`au_id`
INNER JOIN `publications`.`titles`
ON `publications`.`titles`.`title_id`=`publications`.`titleauthor`.`title_id`
INNER JOIN `publications`.`sales`
ON `publications`.`titleauthor`.`title_id`=`publications`.`sales`.`title_id`
GROUP BY `publications`.`authors`.`au_id`,`publications`.`titleauthor`.`title_id`
ORDER BY TOTAL DESC
LIMIT 3;

/*Challege 4*/

SELECT
`publications`.`authors`.`au_id` AS "AUTHOR_ID",
`publications`.`authors`.`au_lname` AS "LAST NAME",
`publications`.`authors`.`au_fname` AS "FIRST NAME",
`publications`.`titles`.`title` AS "TITLE",
IFNULL(sum(`publications`.`sales`.`qty`),0) AS TOTAL
FROM
`publications`.`authors`
INNER JOIN `publications`.`titleauthor`
ON `publications`.`authors`.`au_id`=`publications`.`titleauthor`.`au_id`
INNER JOIN `publications`.`titles`
ON `publications`.`titles`.`title_id`=`publications`.`titleauthor`.`title_id`
INNER JOIN `publications`.`sales`
ON `publications`.`titleauthor`.`title_id`=`publications`.`sales`.`title_id`
GROUP BY `publications`.`authors`.`au_id`,`publications`.`titleauthor`.`title_id`
ORDER BY TOTAL DESC;