USE tienda_tecnologia;

-- CUANTO dinero esta invertido en stock por producto.
-- multiplicamos columnas: precio * cantidad.

SELECT nombre, (precio * stock) AS valor_total_inventario
FROM productos;

-- cuanto productos tengo por categoria.
SELECT categoria_id, COUNT(*) AS cantidad_productos
FROM productos
GROUP BY categoria_id;

-- ver nombre de producto y su categoria

SELECT p.nombre AS producto, c.nombre AS categoria
FROM productos p
INNER JOIN categorias c ON p.categoria_id = c.id;