INSERT INTO categorias (nombre) VALUES ('Periféricos'), ('Hardware'), ('Audio');

INSERT INTO productos (nombre, precio, stock, categoria_id) VALUES
('Mouse Gamer', 4500.00, 15, 1),
('Teclado Gam Mecánico', 8500.50, 10, 1),
('Procesador i7', 45000.00, 5, 2),
('Auriculares Sony', 12000.00, 0, 3), -- Producto sin stock
('Placa de Video RTX', 95000.00, 2, 2);