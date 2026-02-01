USE prueba_tecnica;

-- CUANTOS EMPLEADOS HAY POR DEPARTAMENTOS.
-- GROUP BY CUANDO HAY (COUNT, SUM, AVG)

SELECT departamentos_id, COUNT(*) AS total_empleados from empleados GROUP BY departamentos_id;

-- RELACION DE TABLAS(JOIN)
-- CAMBIAR NUMEROS IDS por nombres legibles.

SELECT
  e.nombre,
  e.apellido,
  d.nombre AS nombre_departamento
FROM empleados AS e
INNER JOIN departamentos AS d ON e.departamentos_id = d.id;


-- CALCULOS ARITMETICOS(PROMEDIOS)
-- ANALISIS FINANCIERO BASICO.

SELECT
  AVG(salario) AS salario_promedio
FROM empleados;

-- AVG SUMA TODOS LOS VALORES DE LA COLUMNA Y LOS DIVIDE POR LA CANTIDAD DE FILAS.
-- SALIO PROMEDIO ES DONDE SE ENTREGA EL RESULTADO.

-- FILTRADO TRAS AGRUPAR.
-- VER DEPARAMENTOS QUE TIENEN MAS DE 1 EMPLEADO.

SELECT
  departamentos_id,
  COUNT(*) AS total
FROM EMPLEADOS
GROUP BY departamentos_id
HAVING total > 1;

-- having es como el where pero para grupos
-- no se puede usar where para count..
