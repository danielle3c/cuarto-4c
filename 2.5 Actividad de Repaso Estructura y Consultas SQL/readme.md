Proyecto Base de Datos: ejemploSelect
Descripción
Este proyecto crea una base de datos llamada ejemploSelect para manejar información sobre usuarios, tipos de usuarios, ciudades y personas relacionadas.

El objetivo es aprender a diseñar tablas con relaciones entre ellas, usar valores por defecto, restricciones de validación (CHECK), y hacer consultas para obtener datos específicos.

Estructura de la Base de Datos
Tablas principales
tipo_usuarios
Contiene los diferentes tipos de usuarios, como "Cliente", "Administrador", "Moderador", etc.

id_tipo: ID único para cada tipo (auto-incremental)

nombre_tipo: Nombre del tipo (ej: Cliente)

descripcion_tipo: Descripción del tipo (mínimo 5 caracteres)

Campos para auditoría: fechas de creación y actualización, usuario creador, etc.

Campo deleted para marcar si el registro está borrado.

usuarios
Almacena los usuarios que usan el sistema.

id_usuario: ID único auto-incremental

username: nombre de usuario único (default: 'usuarioNuevo')

password: contraseña (mínimo 6 caracteres, no vacío)

email: correo electrónico único, debe contener '@'

id_tipo_usuario: referencia al tipo de usuario (por defecto: Cliente)

Auditoría y deleted.

ciudad
Guarda las ciudades donde pueden vivir las personas.

id_ciudad: ID único auto-incremental

nombre_ciudad: nombre de la ciudad (mínimo 3 caracteres, default: 'Por Definir')

region: región a la que pertenece la ciudad (default: 'Sin región')

Auditoría y deleted.

personas
Datos personales de las personas relacionadas con usuarios y ciudades.

rut: RUT chileno único (mínimo 8 caracteres)

nombre_completo: nombre completo (mínimo 5 caracteres, default: 'Nombre Desconocido')

fecha_nac: fecha de nacimiento (default: '2000-01-01')

id_usuario: referencia al usuario asociado

id_ciudad: referencia a la ciudad donde vive

Auditoría y deleted.

Población inicial de datos
Se insertan tipos de usuario: Administrador, Cliente, Moderador.

Se insertan usuarios con diferentes tipos.

Se insertan ciudades importantes de Chile.

Se insertan personas asociadas a usuarios y ciudades.

Consultas SQL destacadas
Mostrar todos los usuarios que son Cliente
Muestra el nombre de usuario, email y tipo (deben ser 'Cliente').

Personas nacidas después de 1990
Muestra nombre completo, fecha de nacimiento y username.

Personas cuyo nombre comienza con la letra A
Muestra nombre y correo electrónico.

Usuarios con email que termina en mail.com
Lista usuarios con dominio de correo específico.

Personas que no viven en Valparaíso
Muestra nombre, username y ciudad para personas que NO están en ciudad con ID 2.

Usuarios con username de más de 7 caracteres
Muestra solo el username.

Usuarios nacidos entre 1990 y 1995
Muestra username de personas nacidas en ese rango.

Cómo usar este proyecto
Ejecutar el script SQL para crear la base de datos y las tablas.

Insertar los datos de ejemplo.

Ejecutar las consultas para practicar SELECT con JOIN, filtros, y funciones como CHAR_LENGTH() y YEAR().

