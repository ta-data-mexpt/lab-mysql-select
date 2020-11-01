USE publications;

#Number of titles each publisher has published

SELECT pub.pub_name, COUNT(titles.title_id) AS titles #Queremos el nombre y el numero de titulos
FROM publications.publishers pub #Nombre publishers
JOIN publications.titles titles #Publicaciones
ON pub.pub_id = titles.pub_id 
GROUP BY pub.pub_name;

#we want to analyze how many units were sold for eachh title.
SELECT titles.title, titles.type, titles.price, SUM(sales.qty) AS units_sold
FROM publications.sales sales
RIGHT JOIN publications.titles titles
ON sales.title_id = titles.title_id
GROUP BY titles.title, titles.type, titles.price;

SELECT *
FROM publications.employee emp
RIGHT JOIN publications.jobs job
ON emp.job_id = job.job_id
UNION
SELECT *
FROM publications.employee emp
LEFT JOIN publications.jobs job
ON emp.job_id = job.job_id;