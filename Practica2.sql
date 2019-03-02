CREATE TABLE Producto 
(ID_Producto uniqueidentifier PRIMARY KEY NOT NULL,
NombreProducto varchar (40) NOT NULL, 
Descripcion varchar (60) NOT NULL, 
IDProveedor int NOT NULL, 
UnidadesEnExistencia int NOT NULL, 
PrecioCoste Money NOT NULL, 
PrecioVenta Money NOT NULL, 
TipoIVA Money NOT NULL, 
Autorizacion char (5) NOT NULL);


CREATE TABLE Cliente
(ID_Cliente uniqueidentifier PRIMARY KEY NOT NULL,
NombreCompañia varchar (40) NOT NULL, 
DireccionFacturacion varchar (60) NOT NULL, 
Ciudad varchar (30) NOT NULL, 
Provincia varchar (30) NOT NULL,
CodPostal int NOT NULL, 
NumTelefono int NOT NULL, 
DirCorreoElectronico varchar (70) NOT NULL);


CREATE TABLE Proveedor
(ID_Proveedor uniqueidentifier PRIMARY KEY NOT NULL,
NombreProveedor varchar (80) NOT NULL, 
Direccion varchar (60) NOT NULL, 
Ciudad varchar (30) NOT NULL, 
Provincia varchar (30) NOT NULL,
CodPostal int NOT NULL, 
NumTelefono int NOT NULL, 
DirCorreoElectronico varchar (70) NOT NULL);


CREATE TABLE Compras
(ID_Pedido uniqueidentifier PRIMARY KEY NOT NULL,
ID_Proveedor uniqueidentifier NOT NULL, 
FechaPedido Date NOT NULL,
HoraPedido Time NOT NULL,  
Cantidad int NOT NULL, 
ID_Producto uniqueidentifier NOT NULL);


CREATE TABLE Ventas 
(ID_DetalleFactura uniqueidentifier PRIMARY KEY NOT NULL,
ID_Producto uniqueidentifier NOT NULL, 
Cantidad int NOT NULL, 
Descuento money NOT NULL, 
ID_Cliente uniqueidentifier NOT NULL,
FechaEntrega Date NOT NULL, 
HoraEntrega Time NOT NULL);


CREATE TABLE Alumno
(ID_Alumno uniqueidentifier PRIMARY KEY NOT NULL,
Apellido_Paterno varchar (10) NOT NULL, 
Apellido_Materno varchar (10) NOT NULL, 
Nombres varchar (30) NULL, 
Carrera varchar (50) NULL,
FechaNac Date NOT NULL);


CREATE TABLE Profesor
(ID_Profesor uniqueidentifier PRIMARY KEY NOT NULL,
Apellido_Paterno varchar (10) NOT NULL, 
Apellido_Materno varchar (10) NOT NULL, 
Nombres varchar (30) NOT NULL, 
Especialidad varchar (30) NOT NULL,
MateriaEnseñar varchar (50) NOT NULL,
Descripcion varchar (60) NOT NULL);


CREATE TABLE Materia
(ID_Materia uniqueidentifier PRIMARY KEY NOT NULL,
Nombre varchar (30) NOT NULL,
Horario Time NOT NULL,
DiasXSemana Date NOT NULL, 
Descripcion varchar (60) NOT NULL);


CREATE TABLE Aula
(ID_Aula uniqueidentifier PRIMARY KEY NOT NULL,
Ubicacion varchar (30) NOT NULL,
Descripcion varchar (60) NOT NULL,
ID_Turno uniqueidentifier NOT NULL);


CREATE TABLE Turno
(ID_Turno uniqueidentifier PRIMARY KEY NOT NULL,
Descripcion varchar (70) NOT NULL);