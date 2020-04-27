USE lab_mysql;

CREATE TABLE Cocina2 ( 
	cocina_id int(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Ingredientes TEXT(200) NOT NULL,
	Sabor VARCHAR(15) 
);

CREATE TABLE Momento_del_dia2 (
	momento_id INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Sabor VARCHAR(15),
    Forma_de_pago BOOLEAN
);

CREATE TABLE Comanda2 (
	comanda_id INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Forma_de_pago BOOLEAN,
    Costo DECIMAL(4,2)
);

CREATE TABLE Tiempo2 (
	tiempo_id INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Porciones INT(1),
    Costo DECIMAL(4,2)
);