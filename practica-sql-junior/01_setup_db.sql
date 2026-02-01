CREATE DATABASE IF NOT EXISTS prueba_tecnica;

USE prueba_tecnica

DROP TABLE IF EXISTS empleados;
DROP TABLE IF EXISTS departamentos;

CREATE TABLE departamentos(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

CREATE TABLE empleados(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE,
  salario DECIMAL(10, 2), -- 10 DIGITOS, DOS DECIMALES
  fecha_ingreso DATE, 
  departamentos_id INT,
  -- CLAVE FORANEA PARA RELACIONAR CON LA TABLA DEPARAMENTOS.
  FOREIGN KEY (departamentos_id) REFERENCES departamentos(id)
);