-- Poblar tabla tipo_usuarios
INSERT INTO tipo_usuarios (nombre_tipo, descripcion_tipo, created_at, updated_at, created_by, updated_by) VALUES
('Administrador', 'Acceso completo al sistema'),
('Cliente', 'Usuario con acceso restringido'),
('Moderador', 'Puede revisar y aprobar contenido');

-- Poblar tabla usuarios
INSERT INTO usuarios (username, password, email, id_tipo_usuario, created_at, updated_at, created_by, updated_by) VALUES
('admin01', 'pass1234', 'admin01@mail.com', 1, NOW(), NOW()),
('jvaldes', 'abc123', 'jvaldes@mail.com', 2, NOW(), NOW()),
('cmorales', '123456', 'cmorales@mail.com', 3, NOW(), NOW()),
('anavarro', 'pass4321', 'anavarro@mail.com', 2, NOW(), NOW()),
('rquezada', 'clave2023', 'rquezada@mail.com', 1, NOW(), NOW()),
('pgodoy', 'segura123', 'pgodoy@mail.com', 2),
('mdiaz', 'token456', 'mdiaz@mail.com', 3),
('scarvajal', 'azul789', 'scarvajal@mail.com', 2),
('ltapia', 'lt123', 'ltapia@mail.com', 3),
('afarias', 'afpass', 'afarias@mail.com', 2);

-- Poblar tabla ciudad
INSERT INTO ciudad (nombre_ciudad, region, created_at, updated_at, created_by, updated_by) VALUES
('Santiago', 'Región Metropolitana', NOW(), NOW()),
('Valparaíso', 'Región de Valparaíso', NOW(), NOW()),
('Concepción', 'Región del Biobío', NOW(), NOW()),
('La Serena', 'Región de Coquimbo', NOW(), NOW()),
('Puerto Montt', 'Región de Los Lagos', NOW(), NOW());

-- Poblar tabla personas (relacionadas con usuarios y ciudades)
INSERT INTO personas (rut, nombre_completo, fecha_nac, id_usuario, id_ciudad, created_at, updated_at, created_by, updated_by) VALUES
('11.111.111-1', 'Juan Valdés', '1990-04-12', 2, 1, NOW(), NOW()),
('22.222.222-2', 'Camila Morales', '1985-09-25', 3, 2, NOW(), NOW()),
('33.333.333-3', 'Andrea Navarro', '1992-11-03', 4, 3, NOW(), NOW()),
('44.444.444-4', 'Rodrigo Quezada', '1980-06-17', 5, 1, NOW(), NOW()),
('55.555.555-5', 'Patricio Godoy', '1998-12-01', 6, 4, NOW(), NOW()),
('66.666.666-6', 'María Díaz', '1987-07-14', 7, 5),
('77.777.777-7', 'Sebastián Carvajal', '1993-03-22', 8, 2),
('88.888.888-8', 'Lorena Tapia', '2000-10-10', 9, 3),
('99.999.999-9', 'Ana Farías', '1995-01-28', 10, 4),
('10.101.010-0', 'Carlos Soto', '1991-08-08', 1, 1); -- admin01


    
    
    
-- 1.-  Mostrar todos los usuarios de tipo Cliente
-- Seleccionar nombre de usuario, correo y tipo_usuario
SELECT username, email,
    (SELECT nombre_tipo FROM tipo_usuarios WHERE tipo_usuarios.id_tipo = usuarios.id_tipo_usuario) AS tipo_usuario
FROM usuarios
WHERE id_tipo_usuario = (SELECT id_tipo FROM tipo_usuarios WHERE nombre_tipo = 'Cliente');


-- 2.-  Mostrar Personas nacidas despues del año 1990
-- Seleccionar Nombre, fecha de nacimiento y username.
SELECT nombre_completo, fecha_nac,
    (SELECT username FROM usuarios WHERE usuarios.id_usuario = personas.id_usuario) AS username
FROM personas
WHERE YEAR(fecha_nac) > 1990;



-- 3.- Seleccionar nombres de personas que comiencen con la 
-- letra A - Seleccionar nombre y correo la persona.
SELECT nombre_completo,
    (SELECT email FROM usuarios WHERE usuarios.id_usuario = personas.id_usuario) AS email
FROM personas
WHERE nombre_completo LIKE 'A%';




-- 4.- Mostrar usuarios cuyos dominios de correo sean
-- mail.commit LIKE '%mail.com%'
SELECT username, email
FROM usuarios
WHERE email LIKE '%mail.com%';


-- 5.- Mostrar todas las personas que no viven en 
 -- Valparaiso y su usuario + ciudad.
 -- select * from ciudad; -- ID 2 VALPARAISO
SELECT nombre_completo,
    (SELECT username FROM usuarios WHERE usuarios.id_usuario = personas.id_usuario) AS username,
    (SELECT nombre_ciudad FROM ciudad WHERE ciudad.id_ciudad = personas.id_ciudad) AS ciudad
FROM personas
WHERE id_ciudad <> 2;


-- 6.- Mostrar usuarios que contengan más de 7 
-- carácteres de longitud.
SELECT username
FROM usuarios
WHERE CHAR_LENGTH(username) > 7;


-- 7.- Mostrar username de personas nacidas entre
-- 1990 y 1995
SELECT 
    (SELECT username FROM usuarios WHERE usuarios.id_usuario = personas.id_usuario) AS username
FROM personas
WHERE YEAR(fecha_nac) BETWEEN 1990 AND 1995;