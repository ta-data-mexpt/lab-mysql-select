CREATE TEMPORARY TABLE rentas_clientes2
SELECT customer_id, first_name AS nombre, last_name AS apellido, rental_date as fecha, title as pelicula
FROM customer c
JOIN rental r USING(customer_id)
JOIN inventory i USING(inventory_id)
JOIN film f USING(film_id)
ORDER BY nombre;

SELECT * FROM rentas_clientes2;

SELECT * FROM rentas_clientes2
WHERE fecha > DATE("2005-08-11");

