use control_gym;

-- quienes no pagaron?
SELECT nombre FROM miembros WHERE pago_al_dia = 0;

-- ver reservas con nombre de la clase. (join)
SELECT 
    m.nombre AS cliente,          -- Buscamos el nombre en la tabla Miembros (m)
    c.nombre_clase AS clase,
    m.pago_al_dia AS pago,      -- Buscamos el nombre en la tabla Clases (c)
    r.fecha_reserva AS fecha     -- Buscamos el dato en la tabla Reservas (r)
FROM reservas r                   -- Salimos desde la tabla "puente"
INNER JOIN miembros m 
    ON r.miembro_id = m.id        -- Unimos: el ID del ticket con el ID del socio
INNER JOIN clases c 
    ON r.clase_id = c.id
WHERE m.pago_al_dia = 1;         -- Unimos: el ID de clase del ticket con el ID de la clase real