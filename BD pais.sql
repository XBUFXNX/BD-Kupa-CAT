drop database Pais;
create database Pais;
use pais;

create table Provincia (
    codigo_postal int(2) primary key,
    nombre varchar(100),
    poblacion int,
    superficie FLOAT
);

create table CapitalProvincial ( --almacena la capital de cada provincia
    id_capital_provincial int primary key auto_increment,
    nombre varchar(100),
    provincia_codigo_postal int(2),
    foreign key (provincia_codigo_postal) references Provincia(codigo_postal)
);

create table ComunidadAutonoma (
    id_autonomia int primary key auto_increment,
    nombre varchar(100),
    poblacion int,
    superficie FLOAT
);

create table CapitalAutonomica (
    id_capital_autonomica int primary key auto_increment,
    nombre varchar(100),
    comunidad_id_autonomia int,
    foreign key (comunidad_id_autonomia) references ComunidadAutonoma(id_autonomia)
);

create table Localidad (
    id_localidad int primary key auto_increment,
    nombre varchar(100),
    poblacion int,
    provincia_codigo_postal int(2),
    comunidad_id_autonomia int,
    foreign key (provincia_codigo_postal) references Provincia(codigo_postal),
    foreign key (comunidad_id_autonomia) references ComunidadAutonoma(id_autonomia)
);


-- Inserts para la tabla "Provincia"
INSERT INTO Provincia (codigo_postal, nombre, poblacion, superficie) VALUES
(1, 'Madrid', 6665000, 8028),
(2, 'Barcelona', 5551000, 7733),
(3, 'Valencia', 2565000, 10807),
(4, 'Sevilla', 1950000, 14036);

-- Inserts para la tabla "CapitalProvincial"
INSERT INTO CapitalProvincial (nombre, provincia_codigo_postal) VALUES
('Madrid', 1),
('Barcelona', 2),
('Valencia', 3),
('Sevilla', 4);

-- Inserts para la tabla "ComunidadAutonoma"
INSERT INTO ComunidadAutonoma (nombre, poblacion, superficie) VALUES
('Comunidad de Madrid', 6665000, 8028),
('Cataluña', 7675000, 32114),
('Comunidad Valenciana', 5008000, 23255),
('Andalucía', 8417000, 87599);

-- Inserts para la tabla "CapitalAutonomica"
INSERT INTO CapitalAutonomica (nombre, comunidad_id_autonomia) VALUES
('Madrid', 1),
('Barcelona', 2),
('Valencia', 3),
('Sevilla', 4);

-- Inserts para la tabla "Localidad"
INSERT INTO Localidad (nombre, poblacion, provincia_codigo_postal, comunidad_id_autonomia) VALUES
('Alcalá de Henares', 195649, 1, 1),
('Badalona', 215757, 2, 2),
('Torrent', 82915, 3, 3),
('Dos Hermanas', 131317, 4, 4);
