drop database Gestion_academica;
create database Gestion_academica;
use Gestion_academica;

create table alumno (
    dni_alumno varchar(20) primary key,
    nombre varchar(50),
    apellido varchar(50),
    curso int
);

create table profesor (
    dni_profesor varchar(20) primary key,
    nombre varchar(50),
    apellido varchar(50)
);

create table departamento (
    codigo_departamento varchar(20) primary key,
    nombre varchar(100),
    jefe varchar(20),
    foreign key (jefe) references profesor(dni_profesor)
);

create table asignatura (
    codigo varchar(20) primary key,
    curso int,
    nombre varchar(100),
    caracter varchar(2),
    profesor_dni varchar(20),
    foreign key (profesor_dni) references profesor(dni_profesor)
);

create table calificacion (
    codigo_calificacion int primary key auto_increment,
    asignatura_codigo varchar(20), 
    alumno_dni varchar(20),
    
    nota int,
    convocatoria varchar(20),
    foreign key (asignatura_codigo) references asignatura(codigo),
    foreign key (alumno_dni) references alumno(dni_alumno)
);

create table matricula (
    id_matricula int primary key auto_increment,
    grupo varchar(50),
    convocatoria varchar(20),
    alumno_dni varchar(20),
    asignatura_codigo varchar(20),
    foreign key (alumno_dni) references alumno(dni_alumno),
    foreign key (asignatura_codigo) references asignatura(codigo)
);


-- Inserts para la tabla "alumno"
INSERT INTO alumno (dni, nombre, apellido, curso) VALUES
('12345678A', 'Juan', 'Pérez', 1),
('23456789B', 'María', 'García', 2),
('34567890C', 'Carlos', 'López', 3),
('45678901D', 'Ana', 'Martínez', 1);

-- Inserts para la tabla "profesor"
INSERT INTO profesor (dni, nombre, apellido) VALUES
('11111111X', 'Pedro', 'Sánchez'),
('22222222Y', 'Luisa', 'Gómez'),
('33333333Z', 'Miguel', 'Rodríguez');

-- Inserts para la tabla "departamento"
INSERT INTO departamento (codigo_departamento, nombre, jefe) VALUES
('DPTO001', 'Departamento de Matemáticas', '11111111X'),
('DPTO002', 'Departamento de Lengua', '22222222Y'),
('DPTO003', 'Departamento de Ciencias Sociales', '33333333Z');

-- Inserts para la tabla "asignatura"
INSERT INTO asignatura (codigo, curso, nombre, caracter, profesor_dni) VALUES
('MAT101', 1, 'Matemáticas I', 'OB', '11111111X'),
('LENG101', 1, 'Lengua y Literatura I', 'OB', '22222222Y'),
('SOC101', 1, 'Historia', 'OB', '33333333Z'),
('MAT201', 2, 'Matemáticas II', 'OB', '11111111X');

-- Inserts para la tabla "calificacion"
INSERT INTO calificacion (asignatura_codigo, alumno_dni, nota, convocatoria) VALUES
('MAT101', '12345678A', 8, 'Ordinaria'),
('LENG101', '23456789B', 7, 'Ordinaria'),
('SOC101', '34567890C', 6, 'Ordinaria'),
('MAT101', '45678901D', 9, 'Ordinaria');

-- Inserts para la tabla "matricula"
INSERT INTO matricula (grupo, convocatoria, alumno_dni, asignatura_codigo) VALUES
('Grupo A', 'Ordinaria', '12345678A', 'MAT101'),
('Grupo B', 'Ordinaria', '23456789B', 'LENG101'),
('Grupo C', 'Ordinaria', '34567890C', 'SOC101'),
('Grupo A', 'Ordinaria', '45678901D', 'MAT101');
