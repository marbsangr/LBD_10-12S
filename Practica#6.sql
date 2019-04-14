CREATE DATABASE RestauranteBisonte
USE RestauranteBisonte

CREATE TABLE Restaurante
(Id_Restaurante CHAR(4) PRIMARY KEY NOT NULL,  
Nom_Restaurante VARCHAR(40) NOT NULL,  
Telefono INT NOT NULL,  
Sucursal_Ubicacion VARCHAR(40) NOT NULL,
CHECK (Id_Restaurante LIKE 'R[0-9][0-9]'),
CHECK (Telefono>0))

INSERT INTO Restaurante VALUES ('R001','Restaurante Bisonte','1819193','Sucursal Escobedo')
INSERT INTO Restaurante VALUES ('R002','Los Bisontes','1819204','Sucursal Santiago')
INSERT INTO Restaurante VALUES ('R003','Crushes FCFM','1819215','Sucursal Las Flores')
INSERT INTO Restaurante VALUES ('R004','La derivada & la integral','1819226','Sucursal Nuevo Laredo')
INSERT INTO Restaurante VALUES ('R005','Siempre Bisontes','1819237','Sucursal Piedras Negras')
INSERT INTO Restaurante VALUES ('R006','La Comunidad del Calculo','1819248','Sucursal Las Puentes')
INSERT INTO Restaurante VALUES ('R007','La Ley de Newton','1819259','Sucursal Cadereyta')
INSERT INTO Restaurante VALUES ('R008','El Rodeo de Bisontes','1819260','Sucursal Universidad')
INSERT INTO Restaurante VALUES ('R009','Base de Datos FCFM','1819271','Sucursal Allende')
INSERT INTO Restaurante VALUES ('R010','FisicaMatematica','1819282','Sucursal Cienega de Flores')

SELECT Id_Restaurante, COUNT("Id_Restaurante")
FROM Restaurante
GROUP BY Id_Restaurante;

SELECT Id_Restaurante, AVG("Nom_Restaurante")
FROM Restaurante
GROUP BY Id_Restaurante;

SELECT * FROM Restaurante

CREATE TABLE Mesa
(Id_Mesa CHAR(4) PRIMARY KEY NOT NULL,  
Id_Restaurante CHAR(4) NOT NULL FOREIGN KEY (Id_Restaurante) REFERENCES Restaurante(Id_Restaurante), 
CantMax_Comensal INT NOT NULL,  
Seccion_Restaurante VARCHAR(15) NOT NULL,
CHECK (Id_Mesa LIKE 'M[0-9][0-9]'))

INSERT INTO Mesa VALUES ('MS01','R001','32','Planta Baja')
INSERT INTO Mesa VALUES ('MS02','R002','15','Terraza')
INSERT INTO Mesa VALUES ('MS03','R003','26','Centro')
INSERT INTO Mesa VALUES ('MS04','R004','11','Terraza')
INSERT INTO Mesa VALUES ('MS05','R005','1','Centro')
INSERT INTO Mesa VALUES ('MS06','R006','3','Centro')
INSERT INTO Mesa VALUES ('MS07','R007','28','Terraza')
INSERT INTO Mesa VALUES ('MS08','R008','20','Centro')
INSERT INTO Mesa VALUES ('MS09','R009','37','Planta Baja')
INSERT INTO Mesa VALUES ('MS10','R010','13','Centro')
INSERT INTO Mesa VALUES ('MS11','R001','10','Primera Planta')
INSERT INTO Mesa VALUES ('MS12','R002','6','Primera Planta')
INSERT INTO Mesa VALUES ('MS13','R003','18','Centro')
INSERT INTO Mesa VALUES ('MS14','R004','30','Planta Baja')
INSERT INTO Mesa VALUES ('MS15','R005','35','Primera Planta')
INSERT INTO Mesa VALUES ('MS16','R006','17','Planta Baja')
INSERT INTO Mesa VALUES ('MS17','R007','5','Centro')
INSERT INTO Mesa VALUES ('MS18','R008','9','Primera Planta')
INSERT INTO Mesa VALUES ('MS19','R009','16','Corredor')
INSERT INTO Mesa VALUES ('MS20','R010','27','Planta Baja')

SELECT Id_Mesa, COUNT("Id_Mesa")
FROM Mesa
GROUP BY Id_Mesa;

SELECT A1.Id_Mesa,COUNT(A1.CantMax_Comensal) "Columna conjunta"
FROM Mesa A1
GROUP BY A1.Id_Mesa;


SELECT * FROM Mesa

CREATE TABLE Tipo_Personal
(Tipo_P VARCHAR (10) PRIMARY KEY NOT NULL,   
Desc_Personal VARCHAR (10) NOT NULL)

INSERT INTO Tipo_Personal VALUES ('Planta Baja','Mesa 003 y Mesa 005')
INSERT INTO Tipo_Personal VALUES ('Terraza','Mesa 020 y Mesa 016')
INSERT INTO Tipo_Personal VALUES ('Primera Planta','Mesa 001 y 012')
INSERT INTO Tipo_Personal VALUES ('Centro','Mesa 020 y Mesa 018')
INSERT INTO Tipo_Personal VALUES ('Terraza','Mesa 008 y Mesa 010')
INSERT INTO Tipo_Personal VALUES ('Planta Baja','Mesa 015 y Mesa 013')
INSERT INTO Tipo_Personal VALUES ('Primera Planta','Mesa 023 y Mesa 007')

SELECT Id_Personal, SUM("Desc_Personal")
FROM Personal
GROUP BY Id_Personal;

SELECT A2.Id_Personal,SUM(A2.Desc_Personal) "Columna conjunta"
FROM Personal A2
GROUP BY A2.Id_Personal;

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

INSERT INTO Personal VALUES ('1234','Pepito Perez','99999999','Apodaca','MS13','Centro','0101')
INSERT INTO Personal VALUES ('5678','Eduardo Montero','81234567','Apodaca','MS20','Planta Baja','2836')
INSERT INTO Personal VALUES ('1357','Tito Fuentes','81345678','Apodaca','MS17','Planta Baja','1925')
INSERT INTO Personal VALUES ('2468','Ana Cristina','81456789','Apodaca','MS05','Primera Planta','5678')
INSERT INTO Personal VALUES ('1928','Jose Sanchez','81567891','Apodaca','MS03','Centro','9012')
INSERT INTO Personal VALUES ('7645','Alana Silva','81678901','Apodaca','MS21','Centro','2561')
INSERT INTO Personal VALUES ('2730','Sofia Benitez','81789012','Apodaca','MS12','Primera Planta','4672')
INSERT INTO Personal VALUES ('8341','Ana Lopez','81890123','Apodaca','MS14','Primera Planta','7256')
INSERT INTO Personal VALUES ('7329','Narziso Luna','81901234','Apodaca','MS06','Primera Planta','2663')
INSERT INTO Personal VALUES ('1103','Mario Cruz','81398765','Apodaca','MS01','Primera Planta','3512')
INSERT INTO Personal VALUES ('2836','Tomas Tenorio','81498765','Apodaca','MS07','Planta Baja','2368')
INSERT INTO Personal VALUES ('1283','Luna Vargas','81598765','Apodaca','MS16','Planta Baja','2374')
INSERT INTO Personal VALUES ('7272','Adriana Lima','81698765','Apodaca','MS15','Planta Baja','2431')
INSERT INTO Personal VALUES ('9534','Carlos Peñafiel','81798765','Apodaca','MS18','Centro','1234')
INSERT INTO Personal VALUES ('9203','Ricardo Monte','81898765','Apodaca','MS20','Centro','8263')
INSERT INTO Personal VALUES ('6366','Julian Portillo','81987654','Apodaca','MS04','Terraza','3454')
INSERT INTO Personal VALUES ('2936','Kiernan Soto','81034567','Apodaca','MS08','Terraza','2535')
INSERT INTO Personal VALUES ('5342','Aldo zurita','81012345','Apodaca','MS14','Terraza','2365')
INSERT INTO Personal VALUES ('9232''Imelda Gomez','81045677','Apodaca','MS11','Terraza','1353')
INSERT INTO Personal VALUES ('5423','Carlos Antonio','81064657','Apodaca','MS10','Terraza','4783')
INSERT INTO Personal VALUES ('9624','Tilda Tomasi','81086545','Apodaca','MS09','Primera Planta','8352')

DELETE FROM Personal WHERE Id_Personal='2836';
DELETE FROM Personal WHERE Id_Personal='5423';
DELETE FROM Personal WHERE Id_Personal='9203';
DELETE FROM Personal WHERE Id_Personal='6366';
DELETE FROM Personal WHERE Id_Personal='9624';

SELECT Id_Personal, COUNT("Telefono_Persona")
FROM Personal
GROUP BY Id_Personal;

SELECT A2.Id_Personal,AVG(A2.Telefono_Personal) "Columna conjunta"
FROM Personal A2
GROUP BY A2.Id_Personal;


SELECT * FROM Personal

CREATE TABLE Turno
(Id_Turno CHAR(4) PRIMARY KEY NOT NULL,  
Desc_Turno CHAR(40) NOT NULL,
CHECK (Id_Turno LIKE 'T[0-9][0-9]'))

INSERT INTO Turno VALUES ('0101','Vespertino')
INSERT INTO Turno VALUES ('0202','Matutino')
INSERT INTO Turno VALUES ('0303','Vespertino')
INSERT INTO Turno VALUES ('0404','Vespertino')
INSERT INTO Turno VALUES ('0505','Matutino')
INSERT INTO Turno VALUES ('0606','Matutino')
INSERT INTO Turno VALUES ('0707','Vespertino')
INSERT INTO Turno VALUES ('0808','Matutino')
INSERT INTO Turno VALUES ('0909','Vespertino')
INSERT INTO Turno VALUES ('1010','Matutino')
INSERT INTO Turno VALUES ('1212','Vespertino')
INSERT INTO Turno VALUES ('1313','Matutino')
INSERT INTO Turno VALUES ('1414','Vespertino')

UPDATE Turno SET Desc_Turno = 'Vespertino' WHERE Id_Turno='1010';
UPDATE Turno SET Desc_Turno = 'Matutino' WHERE Id_Turno='0606';
UPDATE Turno SET Desc_Turno = 'Vespertino' WHERE Id_Turno='0202';
UPDATE Turno SET Desc_Turno = 'Vespertino' WHERE Id_Turno='1212';
UPDATE Turno SET Desc_Turno = 'Matutino' WHERE Id_Turno='1313';

SELECT Id_Turno, MAX("Desc_Turno")
FROM Turno
GROUP BY Id_Turno;

SELECT * FROM Turno

CREATE TABLE Cliente
(Usuario_Cliente VARCHAR (40) PRIMARY KEY NOT NULL, 
Id_Mesa CHAR(4) NOT NULL FOREIGN KEY (Id_Mesa) REFERENCES Mesa(Id_Mesa),  
Direccion_Cliente VARCHAR(40) NOT NULL,  
Telefono_Cliente INT NOT NULL,  
Notas_Cliente VARCHAR (40) NULL,
CHECK (Telefono_Cliente>0))

INSERT INTO Cliente VALUES ('Cliente_015','MS03','1089 Tamaran Street','8181818811','Tacos sin piña')
INSERT INTO Cliente VALUES ('Cliente_007','MS02','1089 Gotham Street','81123456','Sin notas adicionales')
INSERT INTO Cliente VALUES ('Cliente_336','MS05','1089 Baker Street','81108976','Sin notas adicionales')
INSERT INTO Cliente VALUES ('Cliente_256','MS08','1089 Planet Street','81176540','Sin notas adicionales')
INSERT INTO Cliente VALUES ('Cliente_099','MS01','San Ignacion Loyola 101','81124567','Sin notas adicionales')
INSERT INTO Cliente VALUES ('Cliente_010','MS04','Mezquital 233','81134578','Sin notas adicionales')
INSERT INTO Cliente VALUES ('Cliente_186','MS09','Santa Rosa 156','81109786','Sin notas adicionales')
INSERT INTO Cliente VALUES ('Cliente_028','MS10','San Ignacion Loyola 234','81165487','Sin notas adicionales')
INSERT INTO Cliente VALUES ('Cliente_206','MS06','Mezquital 245','81186788','Sin notas adicionales')
INSERT INTO Cliente VALUES ('Cliente_078','MS07','Santa Rosa 763','81108678','Sin notas adicionales')

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
INSERT INTO Platillos VALUES ('P101','Pescado','Empanizado','6','90','P01')
INSERT INTO Platillos VALUES ('P178','Camarones','Picante','6','90','P02')
INSERT INTO Platillos VALUES ('P123','Coctel','Picante','6','90','P03')
INSERT INTO Platillos VALUES ('P345','Alitas','Picante','6','90','P04')
INSERT INTO Platillos VALUES ('P567','Pastel','Picante','1','90','P05')
INSERT INTO Platillos VALUES ('P789','Hamburguesa','Picante','6','90','P06')
INSERT INTO Platillos VALUES ('P901','Pollo','Picante','6','90','P07')
INSERT INTO Platillos VALUES ('P135','Caldo camaron','Picante','6','90','P08')
INSERT INTO Platillos VALUES ('P124','Caldo Pescado','Picante','4','90','P09')
INSERT INTO Platillos VALUES ('P168','Caldo Res','Picante','3','90','P10')
INSERT INTO Platillos VALUES ('P179','Empanadas','Picante','6','90','P11')
INSERT INTO Platillos VALUES ('P142','Gomitas','Picante','8','90','P12')
INSERT INTO Platillos VALUES ('P167','Nieve de limon','Picante','6','90','P13')
INSERT INTO Platillos VALUES ('P245','Torta','Picante','6','90','P14')
INSERT INTO Platillos VALUES ('P325','Medallones','Picante','6','90','P15')
INSERT INTO Platillos VALUES ('P183','Sopa de espinaca','Picante','6','90','P16')
INSERT INTO Platillos VALUES ('P723','Papas fritas','Picante','6','90','P17')
INSERT INTO Platillos VALUES ('P648','Tacos','Picante','6','90','P18')
INSERT INTO Platillos VALUES ('P712','Tacos Mixta','Picante','6','90','P19')
INSERT INTO Platillos VALUES ('P873','Salsa Extra','Picante','6','90','P20')

DELETE FROM Platillos WHERE Id_Platillo='P142';
DELETE FROM Platillos WHERE Id_Platillo='P648';
DELETE FROM Platillos WHERE Id_Platillo='P245';
DELETE FROM Platillos WHERE Id_Platillo='P873';
DELETE FROM Platillos WHERE Id_Platillo='P325';

UPDATE Platillos SET Nom_Platillo = 'Lentejas' WHERE Id_Platillo='P635';
UPDATE Platillos SET Nom_Platillo = 'Mole Verde' WHERE Id_Platillo='P643';
UPDATE Platillos SET Nom_Platillo = 'Salchica para Asar' WHERE Id_Platillo='P243';
UPDATE Platillos SET Nom_Platillo = 'Revoltijo' WHERE Id_Platillo='P432';
UPDATE Platillos SET Nom_Platillo = 'Macarrones' WHERE Id_Platillo='P866';

SELECT * FROM Platillos

SELECT Id_Platillo, MAX("Precio_Platillo")
FROM Platillos
GROUP BY Id_Platillo;

SELECT A4.Id_Platillo,MAX(A4.Precio_Platillo) "Columna conjunta"
FROM Platillos A4
GROUP BY A4.Id_Platillo;

CREATE TABLE Bebidas
(Id_Bebida CHAR(3) PRIMARY KEY NOT NULL,  
Nom_Bebida varchar(20) NOT NULL,  
Des_Bebida varchar(30) NOT NULL,  
Precio_Bebida money NOT NULL,
Id_Personal CHAR(3) NOT NULL FOREIGN KEY (Id_Personal) REFERENCES Personal(Id_Personal),
CHECK (Id_Bebida LIKE 'B[0-9][0-9]')) 

INSERT INTO Bebidas VALUES ('B01','Fresca','Ninguna','22','1234')
INSERT INTO Bebidas VALUES ('B02','Coca Cola','Ninguna','22','4567')
INSERT INTO Bebidas VALUES ('B03','Limonada Mineral','Ninguna','22','5678')
INSERT INTO Bebidas VALUES ('B04','Naranjada Mineral','Ninguna','22','2345')
INSERT INTO Bebidas VALUES ('B05','Jugo Varios','Ninguna','22','3456')
INSERT INTO Bebidas VALUES ('B06','Agua','Ninguna','22','6789')
INSERT INTO Bebidas VALUES ('B07','Agua Mineral','Ninguna','22','7890')
INSERT INTO Bebidas VALUES ('B08','Jamaica','Ninguna','22','8901')
INSERT INTO Bebidas VALUES ('B09','Cerveza','Ninguna','22','9012')
INSERT INTO Bebidas VALUES ('B10','Vino','Ninguna','22','1523')

SELECT Id_Bebida, AVG("Precio_Bebida")
FROM Bebidas
GROUP BY Id_Bebida;

SELECT A5.Id_Bebida,AVG(A5.Precio_Bebida) "Columna conjunta"
FROM Bebidas A5
GROUP BY A5.Id_Bebida;

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

INSERT INTO Factura VALUES ('001','R001','MS06','P0101','B01','2019-02-07')
INSERT INTO Factura VALUES ('004','R015','MS08','P7273','B02','2019-04-22')

SELECT N_Factura, MIN("Id_Mesa")
FROM Factura
GROUP BY N_Factura;

SELECT * FROM Factura
