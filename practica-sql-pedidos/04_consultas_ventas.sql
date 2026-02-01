USE sistema_pedidos;

-- ver cuanto gasto cada cliente en total.
SELECT c.nombre, SUM(p.monto) AS total_gastado
from clientes c
INNER JOIN pedidos p ON c.id = p.cliente_id
GROUP BY c.nombre;

SELECT * FROM clientes;
SELECT * FROM pedidos;