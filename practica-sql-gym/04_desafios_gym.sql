USE control_gym;

--cuantas reservas tiene cada clase.
SELECT 
  c.nombre_clase AS NOMBRE_DE_LA_CLASE,
  COUNT(*) AS total_reservas
FROM reservas AS r
INNER JOIN clases c 
  ON r.clase_id = c.id
GROUP BY c.nombre_clase;

-- ver solo las reservas en febrero 2026
SELECT * FROM reservas
WHERE MONTH(fecha_reserva) = 2 AND YEAR(fecha_reserva) = 2026;