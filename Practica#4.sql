CREATE DATABASE RestauranteBisonte
USE Restaurante

CREATE TABLE Restaurante
(Id_Restaurante CHAR(4) PRIMARY KEY NOT NULL,  
Nom_Restaurante VARCHAR(40) NOT NULL,  
Telefono INT NOT NULL,  
Sucursal_Ubicacion VARCHAR(40) NOT NULL,
CHECK (Id_Restaurante LIKE 'R[0-9][0-9]'),
CHECK (Telefono>0))

INSERT INTO Restaurante VALUES ('R001','RestauranteBisonte','1819193','201 Baker Street')
SELECT * FROM Restaurante

CREATE TABLE Mesa
(Id_Mesa CHAR(4) PRIMARY KEY NOT NULL,  
Id_Restaurante CHAR(4) NOT NULL FOREIGN KEY (Id_Restaurante) REFERENCES Restaurante(Id_Restaurante), 
CantMax_Comensal INT NOT NULL,  
Seccion_Restaurante VARCHAR(15) NOT NULL,
CHECK (Id_Mesa LIKE 'M[0-9][0-9]'))

INSERT INTO Mesa VALUES ('MS03','R001','32','Terraza')
SELECT * FROM Mesa

CREATE TABLE Tipo_Personal
(Tipo_P VARCHAR (10) PRIMARY KEY NOT NULL,   
Desc_Personal VARCHAR (10) NOT NULL)
   
INSERT INTO Tipo_Personal VALUES ('Cajero','Cajero')
SELECT * FROM Tipo_Personal

CREATE TABLE Personal
(Id_Personal CHAR(4) PRIMARY KEY NOT NULL,  
Nom_Personal VARCHAR (40) NOT NULL,  
Telefono_Personal INT NOT NULL,  
Direccion_Personal VARCHAR (40) NOT NULL,
Id_Mesa CHAR(4) NOT NULL FOREIGN KEY (Id_Mesa) REFERENCES Mesa(Id_Mesa),
Tipo_Personal VARCHAR (10) NOT NULL FOREIGN KEY (Tipo_Personal) REFERENCES Tipo_Personal(Tipo_P),  
Id_Turno CHAR(4) NOT NULL FOREIGN KEY (Id_Turno) REFERENCES Turno(Id_Turno),
CHECK (Id_Personal LIKE 'P[0-9][0-9]'),
CHECK (Telefono_Personal>0))

INSERT INTO Personal VALUES ('1234','Pepito Perez','99999999','201 Lannister Street','MS03','Cajero','0101')
SELECT * FROM Personal

CREATE TABLE Turno
(Id_Turno CHAR(4) PRIMARY KEY NOT NULL,  
Desc_Turno CHAR(40) NOT NULL,
CHECK (Id_Turno LIKE 'T[0][0-9]'))

INSERT INTO Turno VALUES ('0101','Ninguna')
SELECT * FROM Turno

CREATE TABLE Cliente
(Usuario_Cliente VARCHAR (40) PRIMARY KEY NOT NULL, 
Id_Mesa CHAR(4) NOT NULL FOREIGN KEY (Id_Mesa) REFERENCES Mesa(Id_Mesa),  
Direccion_Cliente VARCHAR(40) NOT NULL,  
Telefono_Cliente INT NOT NULL,  
Notas_Cliente VARCHAR (40) NULL,
CHECK (Telefono_Cliente>0))

INSERT INTO Cliente VALUES ('Cliente_015','MS03','1089 Tamaran Street','8181818811','Tacos sin piña')
SELECT * FROM Cliente	

CREATE TABLE Platillos
(Id_Platillo CHAR(4) PRIMARY KEY NOT NULL,  
Nom_Platillo varchar(20) NOT NULL,  
Des_Platillo varchar(20) NOT NULL,  
Porcion_Platillo int NOT NULL,
Precio_Platillo money NOT NULL,
Id_Personal CHAR(4) NOT NULL FOREIGN KEY (Id_Personal) REFERENCES Personal(Id_Personal),
CHECK (Id_Platillo LIKE 'PL[0-9][0-9]'))
	
INSERT INTO Platillos VALUES ('P181','Enchiladas Suizas','Ninguna','6','120','P02')
SELECT * FROM Platillos

CREATE TABLE Bebidas
(Id_Bebida CHAR(3) PRIMARY KEY NOT NULL,  
Nom_Bebida varchar(20) NOT NULL,  
Des_Bebida varchar(30) NOT NULL,  
Precio_Bebida money NOT NULL,
Id_Personal CHAR(3) NOT NULL FOREIGN KEY (Id_Personal) REFERENCES Personal(Id_Personal),
CHECK (Id_Bebida LIKE 'B[0-9][0-9]')) 

INSERT INTO Bebidas VALUES ('B01','Ninguna','Ninguna','22','1234')
SELECT * FROM Bebidas

CREATE TABLE Comanda
(Id_Pedido int PRIMARY KEY NOT NULL,  
ClienteP varchar (40) NOT NULL FOREIGN KEY (ClienteP) REFERENCES Cliente(Usuario_Cliente),
PlatilloP CHAR(4) NOT NULL FOREIGN KEY (PlatilloP) REFERENCES Platillos(Id_Platillo),
BebidaP CHAR(4) NOT NULL FOREIGN KEY (BebidaP) REFERENCES Bebidas(Id_Bebida),
Ruta_Pedido varchar (40) NOT NULL,
Fecha_Pedido datetime NOT NULL)

SELECT * FROM Comanda

CREATE TABLE Factura
(N_Factura int PRIMARY KEY NOT NULL,  
Id_Restaurante CHAR(4) NOT NULL FOREIGN KEY (Id_Restaurante) REFERENCES Restaurante(Id_Restaurante),   
Id_Mesa CHAR(4) NOT NULL FOREIGN KEY (Id_Mesa) REFERENCES Mesa(Id_Mesa),  
Id_Platillo CHAR(4) NOT NULL FOREIGN KEY (Id_Platillo) REFERENCES Platillos(Id_Platillo), 
Id_Bebida CHAR(4) NOT NULL FOREIGN KEY (Id_Bebida) REFERENCES Bebidas(Id_Bebida),
Fecha datetime)

SELECT * FROM Factura
