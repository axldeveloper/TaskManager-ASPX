-- Crear base de datos
CREATE DATABASE TaskManagerDB;
GO

USE TaskManagerDB;
GO

-- Crear Catalogo
CREATE TABLE Genero (
    Id INT PRIMARY KEY IDENTITY,
    Descripcion VARCHAR(50)
);

CREATE TABLE EstadoCivil (
    Id INT PRIMARY KEY IDENTITY,
    Descripcion VARCHAR(50)
);

CREATE TABLE Rol (
    Id INT PRIMARY KEY IDENTITY,
    Descripcion VARCHAR(50)
);

-- Tabla Usuarios
CREATE TABLE Usuarios (
    Id INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Cedula VARCHAR(20),
    GeneroId INT,
    FechaNacimiento DATE,
    EstadoCivilId INT,
    RolId INT,
    Usuario VARCHAR(50),
    Password VARCHAR(100),

    FOREIGN KEY (GeneroId) REFERENCES Genero(Id),
    FOREIGN KEY (EstadoCivilId) REFERENCES EstadoCivil(Id),
    FOREIGN KEY (RolId) REFERENCES Rol(Id)
);

-- Insertar datos iniciales
INSERT INTO Genero (Descripcion) VALUES ('Masculino'), ('Femenino');

INSERT INTO EstadoCivil (Descripcion) VALUES ('Soltero'), ('Casado'), ('Divorciado'), ('Viudo');

INSERT INTO Rol (Descripcion) VALUES ('Administrador'), ('Usuario');

INSERT INTO Usuarios (Nombre, Apellido, Cedula, GeneroId, FechaNacimiento, EstadoCivilId, RolId, Usuario, Password) VALUES ('Admin', 'Sistema', '00000000', 1, '1990-01-01', 1, 1, 'admin', 'admin123');

INSERT INTO Usuarios (Nombre, Apellido, Cedula, GeneroId, FechaNacimiento, EstadoCivilId, RolId, Usuario, Password) VALUES ('Juan', 'Perez', '12345678', 1, '1985-05-15', 2, 2, 'juan', 'pass123');

-- Tabla Proyectos
CREATE TABLE Proyectos (
    Id INT PRIMARY KEY IDENTITY,
    Nombre VARCHAR(100),
    Descripcion VARCHAR(255),
    FechaInicio DATE,
    FechaFin DATE,
	Estado VARCHAR(50) DEFAULT 'Activo'
);

-- Tabla Tareas
CREATE TABLE Tareas (
    Id INT PRIMARY KEY IDENTITY,
    ProyectoId INT,
    Titulo VARCHAR(100),
    Descripcion VARCHAR(255),
    Estado VARCHAR(50),
    UsuarioAsignadoId INT,

    FOREIGN KEY (ProyectoId) REFERENCES Proyectos(Id),
    FOREIGN KEY (UsuarioAsignadoId) REFERENCES Usuarios(Id)
);

-- Tabla Comentarios
CREATE TABLE Comentarios (
    Id INT PRIMARY KEY IDENTITY,
    TareaId INT,
    UsuarioId INT,
    Comentario VARCHAR(255),
    Fecha DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (TareaId) REFERENCES Tareas(Id),
    FOREIGN KEY (UsuarioId) REFERENCES Usuarios(Id)
);

