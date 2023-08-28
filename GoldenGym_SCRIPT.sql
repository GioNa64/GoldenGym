--CREACI�N DE LA BASE DE DATOS GOLDENGYM

CREATE DATABASE GoldenGym;
GO

USE GoldenGym
GO

CREATE TABLE Rol( 
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Nombre NVARCHAR(80) NOT NULL,
);
CREATE TABLE Genero(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Nombre NVARCHAR(40) NOT NULL
);
GO
go
<<<<<<< HEAD
CREATE TABLE Usuarios(
=======
CREATE TABLE Usuario(
>>>>>>> 4952589441ff2ab627519b88c16f182f82ffc229
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
IdRol INT NOT NULL,
IdGenero INT NOT NULL,
Nombre NVARCHAR(50) NOT NULL,
Apellido NVARCHAR(50) NOT NULL,
[Login] NVARCHAR(50) NOT NULL,
[Password] NVARCHAR(100) NOT NULL,
FechaRegistro DATETIME NOT NULL,
Estatus TINYINT NOT NULL,
FOREIGN KEY (IdRol) REFERENCES Rol(Id),
FOREIGN KEY (IdGenero) REFERENCES Genero(Id)
);
go

CREATE TABLE Cliente(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
IdGenero INT NOT NULL,
Nombre NVARCHAR(50) NOT NULL,
Apellido NVARCHAR(50) NOT NULL,
Codigo NVARCHAR (20) NOT NULL,
Email NVARCHAR (100) NULL,
Telefono NVARCHAR(20) NULL,
Edad INT NULL,
FechaRegistro DATETIME NOT NULL,
Estatus TINYINT NOT NULL,
FOREIGN KEY(IdGenero) REFERENCES Genero(Id)
);
go

CREATE TABLE TipoMembresia(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
Nombre NVARCHAR (100) NOT NULL,
Descripcion NVARCHAR(MAX) NOT NULL,
Precio MONEY NOT NULL,
Duracion INT NOT NULL,
Estatus TINYINT 
);

CREATE TABLE Membresia(
Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
IdCliente INT NOT NULL,
IdTipoMembresia INT NOT NULL,
FechaRegistro DATETIME NOT NULL,
FechaVencimiento DATETIME NOT NULL,
Estatus TINYINT NOT NULL,
<<<<<<< HEAD
FOREIGN KEY(IdCliente)REFERENCES Clientes(Id),
FOREIGN KEY(IdTipoMembresia)REFERENCES TipoMembresias(Id)
);


CREATE LOGIN Manuel
WITH PASSWORD = 'manuel23',
DEFAULT_DATABASE = GoldenGym,
CHECK_POLICY = OFF,
CHECK_EXPIRATION = OFF;

-- ASIGNACI�N DE PERMISOS
USE GoldenGym;
CREATE USER Manuel FOR LOGIN Manuel WITH DEFAULT_SCHEMA = dbo;
ALTER ROLE db_owner ADD MEMBER Manuel;
=======
FOREIGN KEY(IdCliente)REFERENCES Cliente(Id),
FOREIGN KEY(IdTipoMembresia)REFERENCES TipoMembresia(Id)
);

select * from Usuario;

insert into Genero values('Masculino');
insert into Rol values ('Administrador');
insert into Usuario values(1,1,'Juan','Perez','jp111','7bc345c019b57fccfd427acd01879aa3','25/08/2023',1);
>>>>>>> 4952589441ff2ab627519b88c16f182f82ffc229
