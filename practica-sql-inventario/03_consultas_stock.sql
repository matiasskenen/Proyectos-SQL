USE tienda_tecnologia;
SELECT * FROM productos WHERE stock = 0;

SELECT nombre, precio FROM productos ORDER BY precio DESC;

-- 3. Buscar cualquier producto que diga 'Gamer' en su nombre
SELECT * FROM productos WHERE nombre LIKE '%Gamer';