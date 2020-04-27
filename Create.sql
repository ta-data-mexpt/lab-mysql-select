USE lab_mysql;

CREATE TABLE Cocina ( 
	cocina_id int(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
	Ingredientes TEXT(200) NOT NULL,
	Sabor VARCHAR(15) UNIQUE
);

CREATE TABLE Momento_del_dia (
	momento_id INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Sabor VARCHAR(15),
    Forma_de_pago BOOLEAN UNIQUE,
    FOREIGN KEY (Sabor) REFERENCES Cocina(Sabor)
);

CREATE TABLE Comanda (
	comanda_id INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Forma_de_pago BOOLEAN,
    Costo DECIMAL(4,2) UNIQUE,
    FOREIGN KEY (Forma_de_pago) REFERENCES Momento_del_dia(Forma_de_pago)
);

CREATE TABLE Tiempo (
	tiempo_id INT(2) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Porciones INT(1),
    Costo DECIMAL(4,2),
    FOREIGN KEY (Costo) REFERENCES Comanda(Costo)
);