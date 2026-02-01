CREATE DATABASE IF NOT EXISTS control_gym;
USE control_gym;

DROP TABLE IF EXISTS reservas;
DROP TABLE IF EXISTS miembros;

CREATE TABLE miembros(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  pago_al_dia TINYINT(1) DEFAULT 1, -- 1 PARA SI, 0 PARA NO.
  fecha_inscripcion DATE
);

CREATE TABLE clases(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre_clase VARCHAR(50),
  cupo_maximo INT
);

CREATE TABLE reservas(
  id INT AUTO_INCREMENT PRIMARY KEY,
  miembro_id INT,
  clase_id INT,
  fecha_reserva DATETIME,
  FOREIGN KEY (miembro_id) REFERENCES miembros(id),
  FOREIGN KEY(clase_id) REFERENCES clases(id)
);