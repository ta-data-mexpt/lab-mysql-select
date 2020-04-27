USE lab_mysql;

INSERT INTO Cocina2(cocina_id, ingredientes, Sabor)
VALUES (1, "Sal, pimienta, ajo, cebolla, chile rojo, tomate", "Picante"),
	   (2, "Pollo, tomate, sal, ajo, cebolla, verduras", "Dulce"),
       (3, "Manzana, canela, azucar, trigo, harina, miel, chocolate", "Salado");
		
SELECT * FROM Cocina2;	

INSERT INTO Momento_del_dia2(momento_id, Sabor, Forma_de_pago)
VALUES (1, "Picante", True),
	   (2, "Dulce", False),
       (3, "Salado", True);
       
INSERT INTO Comanda2(comanda_id, Forma_de_pago, Costo)
VALUES (1, True, 34.65),
	   (2, False, 45.98),
       (3, True, 93.52);
       
INSERT INTO Tiempo2(tiempo_id, Costo, Porciones)
VALUES (1, 34.65, 4),
	   (2, 45.98, 2),
       (3, 93.52, 5);
       
SELECT * FROM Momento_del_dia2;
SELECT * FROM Comanda2;
SELECT * FROM Tiempo2;
