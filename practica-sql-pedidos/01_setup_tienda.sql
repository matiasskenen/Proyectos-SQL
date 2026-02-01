CREATE DATABASE IF NOT EXISTS sistema_pedidos;
USE sistema_pedidos;

DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS clientes;

CREATE TABLE clientes(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  ciudad VARCHAR(50)
);

CREATE TABLE pedidos(
  id INT AUTO_INCREMENT PRIMARY KEY,
  cliente_id INT,
  producto VARCHAR(100),
  monto DECIMAL(10, 2),
  estado VARCHAR(20)DEFAULT 'Pendiente',
  fecha DATE,
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);