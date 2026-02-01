USE prueba_tecnica;


-- LISTAR TODOS LOS EMPLEADOS
SELECT * FROM empleados;

-- FILTRAR EMPLEADOS CON SALIO MAYOR 1300
SELECT nombre, apellido, salario
FROM empleados
WHERE salario > 1300;

--BUSCAR EMPLEADOS POR CONCIDENCIA DE TEXTO (LIKE)
-- El % significa "cualquier cosa que siga después"
SELECT * FROM empleados WHERE apellido LIKE 'S%';

--ORDENAR RESULTADOS POR SALARIO DE FORMA DESCENDENTE
SELECT * FROM empleados ORDER BY salario DESC;