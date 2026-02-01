# pandas: para leer el CSV (como si fuera un Excel)
import pandas as pd

# Importamos funciones que hicimos en db.py
# - create_database_if_not_exists: crea la base si no existe
# - create_tables: crea las tablas si no existen
# - connect_with_db: conecta a MySQL ya apuntando a la base
from db import create_database_if_not_exists, create_tables, connect_with_db


def seed_agents(cursor):
    """
    'seed' significa "cargar datos iniciales".
    Acá vamos a cargar 5 agentes (como empleados) en la tabla agents.
    """

    # Lista de nombres inventados
    agents = ["Ana López", "Bruno Díaz", "Carla Pérez", "Diego Núñez", "Elena Gómez"]

    # Borramos todo lo que haya en la tabla agents
    # Esto permite re-ejecutar el script sin duplicar datos
    cursor.execute("DELETE FROM agents")

    # Insertamos cada agente en la tabla
    for name in agents:
        # %s es un placeholder para evitar SQL Injection (es lo correcto)
        cursor.execute(
            "INSERT INTO agents (full_name) VALUES (%s)",
            (name,)
        )


def load_tickets(cursor):
    """
    Lee el CSV de tickets y los inserta en la tabla tickets.
    """

    # Leemos el CSV que generamos con generate_csv.py
    df = pd.read_csv("data/raw/tickets.csv")

    # Borramos los tickets para evitar duplicados
    cursor.execute("DELETE FROM tickets")

    # Recorremos cada fila del CSV
    for _, row in df.iterrows():

        # En el CSV, resolved_at puede venir vacío ""
        # En MySQL queremos guardar NULL cuando está vacío
        resolved_at = row["resolved_at"]

        # Si resolved_at no es texto o es texto vacío, lo ponemos como None (=> NULL)
        if not isinstance(resolved_at, str) or resolved_at.strip() == "":
            resolved_at = None

        # Insertamos el ticket en MySQL
        cursor.execute("""
            INSERT INTO tickets (id, created_at, status, priority, agent_id, resolved_at, sla_hours)
            VALUES (%s, %s, %s, %s, %s, %s, %s)
        """, (
            int(row["id"]),            # id del ticket
            row["created_at"],         # fecha creación
            row["status"],             # estado
            row["priority"],           # prioridad
            int(row["agent_id"]),      # agente asignado
            resolved_at,               # fecha resolución (o NULL)
            int(row["sla_hours"]),     # SLA en horas
        ))


def run():
    """
    Función principal: hace todo el proceso.
    """

    # 1) Crear base si no existe
    create_database_if_not_exists()

    # 2) Crear tablas si no existen
    create_tables()

    # 3) Conectar a la base MySQL
    cnx = connect_with_db()

    # cursor = "puntero" para ejecutar SQL
    cursor = cnx.cursor()

    # 4) Cargar agentes
    seed_agents(cursor)

    # 5) Cargar tickets desde CSV
    load_tickets(cursor)

    # 6) Guardar cambios (si no haces commit, no se guarda nada)
    cnx.commit()

    # 7) Cerrar conexiones (buena práctica)
    cursor.close()
    cnx.close()

    print("✅ OK: datos cargados en MySQL.")


# Esto ejecuta run() solo si se corre este archivo directo
if __name__ == "__main__":
    run()
