CREATE DATABASE IF NOT EXISTS control_soporte;
USE control_soporte;

DROP TABLE IF EXISTS tickets;
DROP TABLE IF EXISTS tecnicos;


CREATE TABLE tecnicos(
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  especialidad VARCHAR(50)
);

CREATE TABLE tickets(
  id INT AUTO_INCREMENT PRIMARY KEY,
  tecnico_id INT,
  descripcion TEXT,
  urgencia VARCHAR(20),
  estado VARCHAR(20) DEFAULT 'Pendiente',
  fecha_creacion DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (tecnico_id) REFERENCES tecnicos(id)
)