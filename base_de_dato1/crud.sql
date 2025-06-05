-- Consulta que muestra todos los registros de la tabla 'usuarios',
-- incluyendo sus datos personales, tipo de usuario, y campos de auditoría.
SELECT * FROM usuarios
-- Consulta que muestra todos los registros de la tabla 'tipo_usuarios',
-- es decir, los distintos roles o tipos que puede tener un usuario (como Administrador o Vendedor).
SELECT * FROM tipo_usuarios;
-- Muestra todos los usuarios que están activos (no eliminados lógicamente).
-- En este caso, 'deleted = 0' indica que el usuario sigue activo en el sistema.
SELECT * 
FROM usuarios 
WHERE deleted = 0;
-- Muestra todos los datos de los usuarios cuyo tipo de usuario es 'Administrador'.
-- Se hace un JOIN entre la tabla 'usuarios' y 'tipo_usuarios' para acceder al nombre del tipo.
-- Se filtran solo aquellos usuarios que tengan el tipo 'Administrador'.
SELECT u.*
FROM usuarios u
JOIN tipo_usuarios t ON u.tipo_usuario_id = t.id
WHERE t.nombre_tipo = 'Administrador';
-- Selecciona los registros donde la fecha de creación ('created_at') está dentro del rango entre el 21 de mayo de 2025 y el 21 de mayo de 2025.
-- En este caso, como las fechas son iguales, solo se mostrarán los registros creados ese día específico.
WHERE created_at BETWEEN '2025-05-21' AND '2025-05-21';
-- 1. Muestra el nombre de los usuarios y su tipo, pero solo para los usuarios con tipo 'Vendedor' 
-- y que estén activos (deleted = 0).
SELECT u.nombre, t.nombre_tipo
FROM usuarios u
JOIN tipo_usuarios t ON u.tipo_usuario_id = t.id
WHERE t.nombre_tipo = 'Vendedor' AND u.deleted = 0;

-- 2. Muestra los nombres y correos de usuarios cuyo correo contenga la palabra 'example' en cualquier parte.
SELECT nombre, correo
FROM usuarios
WHERE correo LIKE '%example%';

-- 3. Selecciona todos los usuarios creados en el mes de mayo del año 2025.
SELECT *
FROM usuarios
WHERE MONTH(created_at) = 5 AND YEAR(created_at) = 2025;

-- 4. Muestra todos los usuarios cuyo tipo de usuario no sea ni 'Administrador' ni 'Vendedor'.
SELECT u.*
FROM usuarios u
JOIN tipo_usuarios t ON u.tipo_usuario_id = t.id
WHERE t.nombre_tipo NOT IN ('Administrador', 'Vendedor');

-- 5. Muestra el nombre del usuario y su tipo, filtrando aquellos usuarios cuyo nombre contenga la letra 'a' 
-- o que tengan el tipo de usuario 'Vendedor'.
SELECT u.nombre, t.nombre_tipo
FROM usuarios u
JOIN tipo_usuarios t ON u.tipo_usuario_id = t.id
WHERE u.nombre LIKE '%a%' OR t.nombre_tipo = 'Vendedor';
