-- Usar base de datos
CREATE DATABASE IF NOT EXISTS `sistema_ventas_4c` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `sistema_ventas_4c`;

-- Eliminar tablas si ya existen (en orden correcto para evitar conflictos por claves foráneas)
DROP TABLE IF EXISTS detalle_ventas;
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS usuarios;
DROP TABLE IF EXISTS tipo_usuarios;
DROP TABLE IF EXISTS productos;

-- Tabla productos
CREATE TABLE productos (
  id INT NOT NULL AUTO_INCREMENT,
  nombre_productos VARCHAR(100) NULL DEFAULT NULL,
  descripcion VARCHAR(300) NULL DEFAULT NULL,
  precio_productos DECIMAL(10,2) NULL DEFAULT NULL,
  stock_productos INT NULL DEFAULT NULL,
  created_at DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT NULL DEFAULT NULL,
  updated_by INT NULL DEFAULT NULL,
  deleted TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla tipo_usuarios
CREATE TABLE tipo_usuarios (
  id INT NOT NULL AUTO_INCREMENT,
  nombre_tipo VARCHAR(50) NOT NULL,
  created_at DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT NULL DEFAULT NULL,
  updated_by INT NULL DEFAULT NULL,
  deleted TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla usuarios
CREATE TABLE usuarios (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(100) NOT NULL,
  correo VARCHAR(100) NULL DEFAULT NULL,
  password VARCHAR(10) NULL DEFAULT NULL,
  tipo_usuario_id INT NULL DEFAULT NULL,
  created_at DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT NULL DEFAULT NULL,
  updated_by INT NULL DEFAULT NULL,
  deleted TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (id),
  UNIQUE INDEX correo (correo ASC),
  INDEX fk_usuario_tipo_usuario (tipo_usuario_id ASC),
  CONSTRAINT fk_usuario_tipo_usuario
    FOREIGN KEY (tipo_usuario_id)
    REFERENCES tipo_usuarios (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla ventas
CREATE TABLE ventas (
  id INT NOT NULL AUTO_INCREMENT,
  usuario_id INT NULL DEFAULT NULL,
  fecha DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT NULL DEFAULT NULL,
  updated_by INT NULL DEFAULT NULL,
  deleted TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (id),
  INDEX fk_venta_usuario (usuario_id ASC),
  CONSTRAINT fk_venta_usuario
    FOREIGN KEY (usuario_id)
    REFERENCES usuarios (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Tabla detalle_ventas
CREATE TABLE detalle_ventas (
  id INT NOT NULL AUTO_INCREMENT,
  venta_id INT NULL DEFAULT NULL,
  producto_id INT NULL DEFAULT NULL,
  cantidad INT NOT NULL,
  precio_unitario DECIMAL(10,2) NOT NULL,
  updated_at DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  created_by INT NULL DEFAULT NULL,
  updated_by INT NULL DEFAULT NULL,
  deleted TINYINT(1) NULL DEFAULT '0',
  PRIMARY KEY (id),
  INDEX fk_detalle_venta (venta_id ASC),
  INDEX fk_detalle_producto (producto_id ASC),
  CONSTRAINT fk_detalle_venta
    FOREIGN KEY (venta_id)
    REFERENCES ventas (id),
  CONSTRAINT fk_detalle_producto
    FOREIGN KEY (producto_id)
    REFERENCES productos (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
