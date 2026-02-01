USE control_soporte;
-- ver todos los ticket con el tecnico programado
SELECT 
  t.id AS ticket_nro,
  tec.nombre AS tecnico,
  t.descripcion,
  t.urgencia
FROM tickets t
INNER JOIN tecnicos tec ON t.tecnico_id = tec.id;


-- contar cuantos tikets tiene asignado cada tecnico.
SELECT 
  tec.nombre AS tecnico,
  COUNT(t.id) AS cantidad_tickets
FROM tecnicos tec
LEFT JOIN tickets t ON tec.id = t.tecnico_id
GROUP BY tec.nombre;

-- ver tickets de urgencia pendientes:
SELECT * FROM tickets
WHERE urgencia = "Alta" AND estado = "Pendiente";