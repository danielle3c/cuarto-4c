USE sistema_ventas_4c;


SELECT * FROM usuarios;
SELECT * FROM tipo_usuarios;

SELECT * 
FROM usuarios 
WHERE deleted = 1;

SELECT u.*
FROM usuarios u
JOIN tipo_usuarios t ON u.tipo_usuario_id = t.id
WHERE t.nombre_tipo = 'Administrador';

SELECT * 
FROM usuarios 
WHERE nombre LIKE 'C%';

SELECT *
FROM personas
WHERE created_at BETWEEN '2025-05-21' AND '2025-05-21';

SELECT u.nombre, t.nombre_tipo
FROM usuarios u
JOIN tipo_usuarios t ON u.tipo_usuario_id = t.id
WHERE t.nombre_tipo = 'Vendedor' AND u.deleted = 0;

SELECT nombre, correo
FROM usuarios
WHERE correo LIKE '%example%';

SELECT *
FROM usuarios
WHERE MONTH(created_at) = 5 AND YEAR(created_at) = 2025;

SELECT u.*
FROM usuarios u
JOIN tipo_usuarios t ON u.tipo_usuario_id = t.id
WHERE t.nombre_tipo NOT IN ('Administrador', 'Vendedor');

SELECT u.nombre, t.nombre_tipo
FROM usuarios u
JOIN tipo_usuarios t ON u.tipo_usuario_id = t.id
WHERE u.nombre LIKE '%a%' OR t.nombre_tipo = 'Vendedor';