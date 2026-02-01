USE control_gym;
INSERT INTO miembros (nombre, pago_al_dia, fecha_inscripcion) VALUES
('Matias Skenen', 1, '2026-01-10'),
('Juan Perez', 0, '2026-01-15'),
('Carla Gomez', 1, '2026-01-20');

INSERT INTO clases (nombre_clase, cupo_maximo) VALUES
('Crossfit', 10), ('Yoga', 5), ('Boxeo', 8);

INSERT INTO reservas (miembro_id, clase_id, fecha_reserva) VALUES
(1, 1, NOW()),
(3, 1, NOW()),
(2, 2, NOW());