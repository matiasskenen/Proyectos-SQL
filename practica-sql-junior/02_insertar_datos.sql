USE prueba_tecnica;

INSERT INTO departamentos (nombre) VALUES ("IT"), ("RRHH"), ("VENTAS");

INSERT INTO empleados (nombre, apellido, email, salario, fecha_ingreso, departamentos_id)
VALUES
('Matias', 'Skenen', 'matias@mail.com', 1500.00, '2023-01-10', 1),
('Laura', 'Gomez', 'laura@mail.com', 1200.00, '2023-03-15', 2),
('Pedro', 'Perez', 'pedro@mail.com', 1800.00, '2022-11-20', 1),
('Ana', 'Lopez', 'ana@mail.com', 900.00, '2023-05-01', 3);