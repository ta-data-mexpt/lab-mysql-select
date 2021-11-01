SELECT * FROM tabla_final_final;

SELECT au_id, COUNT(au_id) AS 'TITLE COUNT'
FROM tabla_final_final
GROUP BY au_id;