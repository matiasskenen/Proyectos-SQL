# Proyectos SQL

Colección de proyectos y ejercicios de SQL en diferentes niveles de complejidad, desde práctica inicial hasta sistemas más avanzados de análisis de datos.

## Contenido

### Práctica SQL Junior

Ejercicios básicos de SQL diseñados para aprender los fundamentos. Incluye creación de bases de datos, inserción de datos y consultas sencillas.

- Archivo: `practica-sql-junior/`
- Cubre: CREATE, INSERT, SELECT básico, JOIN, WHERE, ORDER BY
- Tiempo estimado: 30-45 minutos

### Práctica SQL Gym

Un proyecto práctico basado en la gestión de un gimnasio. Trabaja con miembros, clases y reservas.

- Archivo: `practica-sql-gym/`
- Incluye: Diseño de base de datos relacional, consultas de reservas, análisis de ocupación
- Tema: Gestión de miembros, clases disponibles y sistema de reservas

### Práctica SQL Inventario

Ejercicios enfocados en consultas de inventario y stock. Aprende a trabajar con agregaciones y reportes de datos.

- Archivo: `practica-sql-inventario/`
- Cubre: Consultas de stock, actualizaciones en masa, reportes de inventario
- Casos de uso: Control de inventario, alertas de stock bajo

### KPI Tracker Avanzado

Sistema más completo que integra SQL con Python para extraer, procesar y analizar KPIs de un sistema de tickets.

- Archivo: `adv_bpo_kpi_tracker/`
- Stack: MySQL, Python, dotenv
- Funcionalidades: Extracción de datos CSV, carga a base de datos, queries de KPI

## Estructura

Cada proyecto contiene archivos SQL ordenados secuencialmente:

1. Setup - Creación de bases de datos y tablas
2. Datos - Inserción de información inicial
3. Consultas - Queries comunes y útiles
4. Desafíos - Ejercicios prácticos para resolver

## Cómo usar

Para los proyectos SQL puros, abre los archivos en tu cliente MySQL (MySQL Workbench, DBeaver, etc.) y ejecuta cada archivo en orden.

Para el proyecto Python:

```bash
cd adv_bpo_kpi_tracker
pip install python-dotenv mysql-connector-python
python src/generate_csv.py
python src/load_to_mysql.py
```

Consulta los archivos individuales para instrucciones específicas.

## Nivel de dificultad

- Junior: Básico
- Gym: Intermedio
- Inventario: Intermedio
- KPI Tracker: Avanzado (integración de múltiples herramientas)
