-- Insertar en TiposUsuario
INSERT INTO TiposUsuario (descripcion) VALUES 
('Paciente'),
('Médico'),
('Administrativo');
SELECT * FROM TiposUsuario;

-- Insertar en Usuarios (Pacientes, Médicos y Administrativos)
INSERT INTO Usuarios (nombre, correo, telefono, tipo_usuario) VALUES
('Juan Pérez', 'juan.perez@email.com', '123456789', 1),
('María Gómez', 'maria.gomez@email.com', '987654321', 1),
('Dr. Carlos López', 'carlos.lopez@email.com', '1122334455', 2),
('Dra. Ana Ruiz', 'ana.ruiz@email.com', '5566778899', 2),
('Luis Fernández', 'luis.fernandez@email.com', '6655443322', 3);
SELECT * FROM Usuarios;

-- Insertar en Pacientes
INSERT INTO Pacientes (usuario_id, historial_medico) VALUES
(1, 'Antecedentes de hipertensión'),
(2, 'Alergia a la penicilina');
SELECT * FROM Pacientes;

-- Insertar en Médicos
INSERT INTO Medicos (usuario_id, especialidad) VALUES
(3, 'Cardiología'),
(4, 'Dermatología');
SELECT * FROM Medicos;

-- Insertar en Administrativos
INSERT INTO Administrativos (usuario_id, rol) VALUES
(5, 'Recepcionista');
SELECT * FROM Administrativos;

-- Insertar en Citas
INSERT INTO Citas (paciente_id, medico_id, fecha, hora, estado) VALUES
(1, 1, '2025-03-10', '10:00:00', 'aprobada'),
(2, 2, '2025-03-11', '11:00:00', 'aprobada');
SELECT * FROM Citas;

-- Insertar en Consultas
INSERT INTO Consultas (cita_id, motivo, diagnostico) VALUES
(1, 'Dolor en el pecho', 'Posible angina'),
(2, 'Erupción en la piel', 'Dermatitis alérgica');
SELECT * FROM Consultas;

-- Insertar en Tratamientos
INSERT INTO Tratamientos (nombre, descripcion) VALUES
('Aspirina', 'Analgésico y anticoagulante'),
('Crema antihistamínica', 'Para tratar reacciones alérgicas');
SELECT * FROM Tratamientos;

-- Relacionar Consultas y Tratamientos
INSERT INTO Consulta_Tratamientos (consulta_id, tratamiento_id) VALUES
(1, 1),
(2, 2);
SELECT * FROM Consulta_Tratamientos;

-- Cambiar el estado de una cita
UPDATE Citas SET estado = 'rechazada' WHERE id = 1;

-- Modificar el historial médico de un paciente
UPDATE Pacientes SET historial_medico = 'Hipertensión y diabetes' WHERE id = 2;


SELECT * FROM Citas WHERE paciente_id = 1;




DELETE FROM Consulta_Tratamientos WHERE tratamiento_id = 1;
DELETE FROM Tratamientos WHERE id = 1;



