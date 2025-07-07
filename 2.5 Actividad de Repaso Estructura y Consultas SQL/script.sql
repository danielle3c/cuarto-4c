-- Creamos la base de datos y la usamos
CREATE DATABASE ejemploSelect;
USE ejemploSelect;

-- Tabla para los tipos de usuario, como "Cliente", "Administrador", etc.
CREATE TABLE tipo_usuarios (
    id_tipo INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- Identificador único, se crea solo y sube solo

    nombre_tipo VARCHAR(50) NOT NULL DEFAULT 'Cliente', 
    -- Nombre del tipo de usuario. Si no pones nada, se pone "Cliente" por defecto

    descripcion_tipo VARCHAR(200) NOT NULL DEFAULT 'Sin descripción', 
    -- Descripción del tipo de usuario. Si no pones nada, queda "Sin descripción"
    -- Validamos que esta descripción tenga al menos 5 letras para que no sea muy corta
    CHECK (CHAR_LENGTH(descripcion_tipo) >= 5), 

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha y hora de creación automática
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha y hora se actualiza sola si cambias algo
    created_by INT DEFAULT NULL, -- Aquí podría ir el ID de quien creó este registro (si quieres)
    updated_by INT DEFAULT NULL, -- ID de quien hizo la última actualización
    deleted BOOLEAN DEFAULT FALSE -- Si el registro está borrado o no (falso = no borrado)
);

-- Tabla para usuarios que usarán la aplicación o sistema
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- ID único y automático para cada usuario

    username VARCHAR(50) NOT NULL UNIQUE DEFAULT 'usuarioNuevo', 
    -- Nombre de usuario que debe ser único. Si no pones, se pone "usuarioNuevo" por defecto

    password VARCHAR(200) NOT NULL, -- Contraseña obligatoria (no puede quedar vacía)

    email VARCHAR(100) NOT NULL UNIQUE, 
    -- Email único y obligatorio
    -- Validamos que el email contenga una "@" para que sea válido
    CHECK (email LIKE '%@%'),

    id_tipo_usuario INT DEFAULT 2, -- Por defecto se asume que el usuario es tipo 'Cliente' (ID=2)

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación automática
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de actualización automática
    created_by INT DEFAULT NULL, -- Quién creó este usuario (opcional)
    updated_by INT DEFAULT NULL, -- Quién lo actualizó por última vez (opcional)
    deleted BOOLEAN DEFAULT FALSE, -- Usuario eliminado o no

    CONSTRAINT fk_usuarios_tipo_usuarios FOREIGN KEY (id_tipo_usuario) REFERENCES tipo_usuarios(id_tipo)
    -- Aquí decimos que el tipo de usuario debe existir en la tabla tipo_usuarios
);

-- Tabla para las ciudades
CREATE TABLE ciudad (
    id_ciudad INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- ID único para cada ciudad

    nombre_ciudad VARCHAR(100) NOT NULL DEFAULT 'Por Definir',
    -- Nombre de la ciudad, si no pones, queda "Por Definir"
    -- Validamos que el nombre tenga al menos 3 letras para que sea válido
    CHECK (CHAR_LENGTH(nombre_ciudad) >= 3),

    region VARCHAR(100) DEFAULT 'Sin región', 
    -- Región a la que pertenece la ciudad. Si no pones, queda "Sin región"

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación automática
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de actualización automática
    created_by INT DEFAULT NULL, -- Quién creó esta ciudad (opcional)
    updated_by INT DEFAULT NULL, -- Quién actualizó (opcional)
    deleted BOOLEAN DEFAULT FALSE -- Si la ciudad está eliminada o no
);

-- Tabla para las personas (datos personales)
CREATE TABLE personas (
    rut VARCHAR(13) NOT NULL UNIQUE, -- El RUT (ID chileno) es obligatorio y único
    -- Validamos que tenga al menos 8 caracteres para que sea válido
    CHECK (CHAR_LENGTH(rut) >= 8),

    nombre_completo VARCHAR(100) NOT NULL DEFAULT 'Nombre Desconocido',
    -- Nombre completo, si no pones, queda "Nombre Desconocido"
    -- Validamos que tenga al menos 5 letras para que no sea un nombre vacío o muy corto
    CHECK (CHAR_LENGTH(nombre_completo) >= 5),

    fecha_nac DATE DEFAULT '2000-01-01', -- Fecha de nacimiento, si no pones queda el 1 de enero de 2000

    id_usuario INT, -- Relacionamos la persona con un usuario (puede ser NULL)
    id_ciudad INT, -- Relacionamos la persona con una ciudad (puede ser NULL)

    created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha de creación automática
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha de actualización automática
    created_by INT DEFAULT NULL, -- Quién creó este registro (opcional)
    updated_by INT DEFAULT NULL, -- Quién actualizó (opcional)
    deleted BOOLEAN DEFAULT FALSE, -- Si está eliminado o no

    CONSTRAINT fk_personas_usuarios FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    -- El usuario debe existir en la tabla usuarios

    CONSTRAINT fk_personas_ciudad FOREIGN KEY (id_ciudad) REFERENCES ciudad(id_ciudad)
    -- La ciudad debe existir en la tabla ciudad
);
