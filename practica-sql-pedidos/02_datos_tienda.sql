USE sistema_pedidos;

INSERT INTO clientes(nombre, email, ciudad) VALUES
('Matias Skenen', 'matias@dev.com', 'Ramos Mejia'), --
('Laura Gomez', 'laura@mail.com', 'CABA'),
('Pedro Perez', 'pedro@mail.com', 'Moron');

INSERT INTO pedidos(cliente_id, producto, monto, estado, fecha) VALUES
(1, 'Monitor 24"', 15000.00, 'Pendiente', '2026-02-01'),
(1, 'Mouse Pad', 2000.00, 'Enviado', '2026-02-01'),
(2, 'Teclado RGB', 8500.00, 'Pendiente', '2026-02-01');