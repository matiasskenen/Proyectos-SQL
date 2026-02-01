# Este archivo se conecta a MySQL y ejecuta consultas SQL (KPIs).
# KPI = métrica: por ejemplo "cuántos tickets hay", "cuánto tardan", "cumplen SLA", etc.

from db import connect_with_db


def print_rows(title, rows):
    """
    Esto solo es para imprimir lindo en la terminal.
    - title: título del KPI
    - rows: lo que devolvió MySQL (lista de filas)
    """
    print("\n" + "=" * 60)
    print(title)
    print("=" * 60)

    # Cada fila puede ser una tupla como: ('OPEN', 120)
    for r in rows:
        print(r)


def run():
    # 1) Nos conectamos a MySQL (a la base adv_bpo_kpi)
    cnx = connect_with_db()

    # 2) Cursor = "herramienta" para ejecutar SQL
    cursor = cnx.cursor()

    # =========================================================
    # KPI 1) BACKLOG por estado
    # ¿Cuántos tickets hay OPEN, IN_PROGRESS, RESOLVED?
    # =========================================================
    cursor.execute("""
        SELECT status, COUNT(*) AS total
        FROM tickets
        GROUP BY status
        ORDER BY total DESC
    """)
    print_rows("KPI 1) Backlog por estado", cursor.fetchall())

    # =========================================================
    # KPI 2) Tiempo promedio de resolución (en horas)
    # Solo para tickets resueltos.
    #
    # TIMESTAMPDIFF(HOUR, created_at, resolved_at) = horas entre 2 fechas
    # AVG() = promedio
    # ROUND() = redondear
    # =========================================================
    cursor.execute("""
        SELECT ROUND(AVG(TIMESTAMPDIFF(HOUR, created_at, resolved_at)), 2) AS avg_hours
        FROM tickets
        WHERE status = 'RESOLVED'
    """)
    print_rows("KPI 2) Tiempo promedio de resolución (horas)", cursor.fetchall())

    # =========================================================
    # KPI 3) % de tickets resueltos dentro del SLA
    #
    # Si horas_resolucion <= sla_hours => cumple (1)
    # Si no => no cumple (0)
    #
    # SUM(cumple) / COUNT(total) => porcentaje
    # =========================================================
    cursor.execute("""
        SELECT
          ROUND(
            100 * SUM(
              CASE
                WHEN TIMESTAMPDIFF(HOUR, created_at, resolved_at) <= sla_hours THEN 1
                ELSE 0
              END
            ) / COUNT(*)
          , 2) AS sla_compliance_pct
        FROM tickets
        WHERE status = 'RESOLVED'
    """)
    print_rows("KPI 3) % de tickets resueltos dentro de SLA", cursor.fetchall())

    # =========================================================
    # KPI 4) Ranking de agentes por tickets resueltos
    #
    # JOIN = unir tickets con agents para mostrar nombres reales
    # GROUP BY = agrupar por agente
    # COUNT(*) = cantidad de tickets resueltos por agente
    # =========================================================
    cursor.execute("""
        SELECT a.full_name, COUNT(*) AS resolved_count
        FROM tickets t
        JOIN agents a ON a.id = t.agent_id
        WHERE t.status = 'RESOLVED'
        GROUP BY a.full_name
        ORDER BY resolved_count DESC
    """)
    print_rows("KPI 4) Ranking de agentes (tickets resueltos)", cursor.fetchall())

    # 3) Cerramos todo (buena práctica)
    cursor.close()
    cnx.close()


# Esto ejecuta run() si corrés este archivo directo
if __name__ == "__main__":
    run()
