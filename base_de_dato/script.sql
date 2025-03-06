-- Crear la base de datos
CREATE DATABASE ConsultaMedica;
USE ConsultaMedica;

-- Tabla de Tipos de Usuario
CREATE TABLE TiposUsuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL
);

-- Tabla de Usuarios
CREATE TABLE Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15),
    tipo_usuario INT NOT NULL,
    FOREIGN KEY (tipo_usuario) REFERENCES TiposUsuario(id)
);

-- Tabla de Pacientes
CREATE TABLE Pacientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNIQUE NOT NULL,
    historial_medico TEXT,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabla de Médicos
CREATE TABLE Medicos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNIQUE NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabla de Administrativos
CREATE TABLE Administrativos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNIQUE NOT NULL,
    rol VARCHAR(100) NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabla de Citas
CREATE TABLE Citas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    paciente_id INT NOT NULL,
    medico_id INT NOT NULL,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    estado ENUM('pendiente', 'aprobada', 'rechazada') NOT NULL,
    FOREIGN KEY (paciente_id) REFERENCES Pacientes(id),
    FOREIGN KEY (medico_id) REFERENCES Medicos(id)
);

-- Tabla de Consultas
CREATE TABLE Consultas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cita_id INT UNIQUE NOT NULL,
    motivo TEXT NOT NULL,
    diagnostico TEXT NOT NULL,
    FOREIGN KEY (cita_id) REFERENCES Citas(id)
);

-- Tabla de Tratamientos
CREATE TABLE Tratamientos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL
);

-- Tabla intermedia para la relación N:M entre Consultas y Tratamientos
CREATE TABLE Consulta_Tratamientos (
    consulta_id INT NOT NULL,
    tratamiento_id INT NOT NULL,
    PRIMARY KEY (consulta_id, tratamiento_id),
    FOREIGN KEY (consulta_id) REFERENCES Consultas(id),
    FOREIGN KEY (tratamiento_id) REFERENCES Tratamientos(id)
);
