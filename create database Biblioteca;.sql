drop database Biblioteca;
create database Biblioteca;
use Biblioteca;

create table Socios (
    codigo_socio int primary key,
    DNI int,
    direccion varchar(100),
    telefono varchar(15),
    nombre varchar(50),
    apellido varchar(50)
);

create table Libros (
    ISBN varchar(20) primary key,
    titulo varchar(50),
    editorial varchar(50),
    anio_creacion year,
    editorial_edit varchar(50),
    anio_edit year,
    estado varchar(15)
);

create table Autor (
    id_autor int primary key,
    nombre varchar(50)
);

create table Libros_Autor (
    id_libros_autores int primary key,
    cantidad int,
    Libros_ISBN varchar(20),
    Autor_id_autor int,
    foreign key (Libros_ISBN) references Libros(ISBN),
    foreign key (Autor_id_autor) references Autor(id_autor)
);

create table Prestamos (
    Cod_prestamo int primary key,
    fecha_prestamo date,
    fecha_limite date,
    Libros_ISBN int,
    Socio_codigo_socio int,

    foreign key (Libros_ISBN) references Libros(ISBN),
    foreign key (Socio_codigo_socio) references Socios(codigo_socio)
);


INSERT INTO Socios (codigo_socio, DNI, direccion, telefono, nombre, apellido) VALUES
(1, 12345678, 'Calle Principal 123', '123-456-7890', 'Juan', 'Pérez'),
(2, 23456789, 'Avenida Central 456', '987-654-3210', 'María', 'García'),
(3, 34567890, 'Calle Secundaria 789', '456-789-0123', 'Carlos', 'López'),
(4, 45678901, 'Plaza Principal 321', '321-654-0987', 'Ana', 'Martínez');

INSERT INTO Libros (ISBN, titulo, editorial, anio_creacion, editorial_edit, anio_edit, estado) VALUES
('978-0061120084', 'El Principito', 'Editorial Planeta', 1943, 'Editorial Norma', 2003, 'Disponible'),
('978-8478884454', 'Cien años de soledad', 'Editorial Sudamericana', 1967, 'Editorial Alfaguara', 2014, 'Disponible'),
('978-8408000034', 'Harry Potter y la piedra filosofal', 'Editorial Salamandra', 1997, 'Editorial Salamandra', 2015, 'Prestado'),
('978-0545139700', 'Harry Potter y las reliquias de la muerte', 'Editorial Salamandra', 2007, 'Editorial Salamandra', 2017, 'Disponible');

INSERT INTO Autor (id_autor, nombre) VALUES
(1, 'Antoine de Saint-Exupéry'),
(2, 'Gabriel García Márquez'),
(3, 'J.K. Rowling'),
(4, 'J.K. Rowling');

INSERT INTO Libros_Autor (id_libros_autores, cantidad, Libros_ISBN, Autor_id_autor) VALUES
(1, 1, '978-0061120084', 1),
(2, 1, '978-8478884454', 2),
(3, 1, '978-8408000034', 3),
(4, 1, '978-0545139700', 4);
