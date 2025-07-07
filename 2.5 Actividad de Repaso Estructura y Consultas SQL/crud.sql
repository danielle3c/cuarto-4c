-- Poblar tabla tipo_usuarios
INSERT INTO tipo_usuarios (nombre_tipo, descripcion_tipo) VALUES
('Administrador', 'Acceso completo al sistema'),
('Cliente', 'Usuario con acceso restringido'),
('Moderador', 'Puede revisar y aprobar contenido');

-- Poblar tabla usuarios
INSERT INTO usuarios (username, password, email, id_tipo_usuario) VALUES
('admin01', 'pass1234', 'admin01@mail.com', 1),
('jvaldes', 'abc123', 'jvaldes@mail.com', 2),
('cmorales', '123456', 'cmorales@mail.com', 3),
('anavarro', 'pass4321', 'anavarro@mail.com', 2),
('rquezada', 'clave2023', 'rquezada@mail.com', 1),
('pgodoy', 'segura123', 'pgodoy@mail.com', 2),
('mdiaz', 'token456', 'mdiaz@mail.com', 3),
('scarvajal', 'azul789', 'scarvajal@mail.com', 2),
('ltapia', 'lt123', 'ltapia@mail.com', 3),
('afarias', 'afpass', 'afarias@mail.com', 2);

-- Poblar tabla ciudad
INSERT INTO ciudad (nombre_ciudad, region) VALUES
('Santiago', 'Región Metropolitana'),
('Valparaíso', 'Región de Valparaíso'),
('Concepción', 'Región del Biobío'),
('La Serena', 'Región de Coquimbo'),
('Puerto Montt', 'Región de Los Lagos');

-- Poblar tabla personas (relacionadas con usuarios y ciudades)
INSERT INTO personas (rut, nombre_completo, fecha_nac, id_usuario, id_ciudad) VALUES
('11.111.111-1', 'Juan Valdés', '1990-04-12', 2, 1),
('22.222.222-2', 'Camila Morales', '1985-09-25', 3, 2),
('33.333.333-3', 'Andrea Navarro', '1992-11-03', 4, 3),
('44.444.444-4', 'Rodrigo Quezada', '1980-06-17', 5, 1),
('55.555.555-5', 'Patricio Godoy', '1998-12-01', 6, 4),
('66.666.666-6', 'María Díaz', '1987-07-14', 7, 5),
('77.777.777-7', 'Sebastián Carvajal', '1993-03-22', 8, 2),
('88.888.888-8', 'Lorena Tapia', '2000-10-10', 9, 3),
('99.999.999-9', 'Ana Farías', '1995-01-28', 10, 4),
('10.101.010-0', 'Carlos Soto', '1991-08-08', 1, 1); -- admin01


    
    
-- 1.-  Mostrar todos los usuarios de tipo Cliente
-- Seleccionar nombre de usuario, correo y tipo_usuario
SELECT u.username, u.email, t.nombre_tipo
FROM usuarios u
JOIN tipo_usuarios t ON u.id_tipo_usuario = t.id_tipo
WHERE t.nombre_tipo = 'Cliente';

-- 2.-  Mostrar Personas nacidas despues del año 1990
-- Seleccionar Nombre, fecha de nacimiento y username.
SELECT p.nombre_completo, p.fecha_nac, u.username
FROM personas p
JOIN usuarios u ON p.id_usuario = u.id_usuario
WHERE YEAR(p.fecha_nac) > 1990;


-- 3.- Seleccionar nombres de personas que comiencen con la 
-- letra A - Seleccionar nombre y correo la persona.
SELECT p.nombre_completo, u.email
FROM personas p
JOIN usuarios u ON p.id_usuario = u.id_usuario
WHERE p.nombre_completo LIKE 'A%';


-- 4.- Mostrar usuarios cuyos dominios de correo sean
-- mail.commit LIKE '%mail.com%'
SELECT username, email
FROM usuarios
WHERE email LIKE '%mail.com%';


-- 5.- Mostrar todas las personas que no viven en 
    -- Valparaiso y su usuario + ciudad.
 -- select * from ciudad; -- ID 2 VALPARAISO
SELECT p.nombre_completo, u.username, c.nombre_ciudad
FROM personas p
JOIN usuarios u ON p.id_usuario = u.id_usuario
JOIN ciudad c ON p.id_ciudad = c.id_ciudad
WHERE c.id_ciudad <> 2;


-- 6.- Mostrar usuarios que contengan más de 7 
-- carácteres de longitud.
SELECT username
FROM usuarios
WHERE CHAR_LENGTH(username) > 7;


-- 7.- Mostrar username de personas nacidas entre
-- 1990 y 1995
SELECT u.username
FROM personas p
JOIN usuarios u ON p.id_usuario = u.id_usuario
WHERE YEAR(p.fecha_nac) BETWEEN 1990 AND 1995;