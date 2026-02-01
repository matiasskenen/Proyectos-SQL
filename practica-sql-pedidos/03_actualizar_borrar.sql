USE sistema_pedidos;

UPDATE pedidos
SET estado = 'Enviado'
WHERE id = 1;

UPDATE clientes
SET ciudad = 'Parque chacabuco'
WHERE nombre = 'Laura Gomez';

DELETE FROM clientes
WHERE email = 'pedro@mail.com';