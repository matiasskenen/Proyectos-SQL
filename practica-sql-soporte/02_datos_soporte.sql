USE control_soporte;

INSERT INTO tecnicos (nombre, especialidad) VALUES
('Matias Skenen', 'Full Stack / IT Support'),
('Laura Gomez', 'Redes'),
('Pedro Perez', 'Hardware');

INSERT INTO tickets (tecnico_id, descripcion, urgencia, estado) VALUES
(1, 'Error en el servidor de base de datos', 'Alta', 'En Proceso'),
(1, 'Configurar nuevo entorno React', 'Media', 'Pendiente'),
(1, 'Falla en el router del piso 2', 'Alta', 'Pendiente'),
(3, 'Limpieza de PC de escritorio', 'Baja', 'Resuelto');