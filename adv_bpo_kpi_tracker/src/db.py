import mysql.connector
from mysql.connector import errorcode
from config import DB_CONFIG

def connect_no_db():
    """
    Conecta a MySQL SIN elegir base de datos.
    Esto sirve para crear la base si todavía no existe.
    """
    return mysql.connector.connect(
        host=DB_CONFIG["host"],
        port=DB_CONFIG["port"],
        user=DB_CONFIG["user"],
        password=DB_CONFIG["password"],
    )

def connect_with_db():
    """
    Conecta a MySQL usando la base DB_NAME.
    """
    return mysql.connector.connect(**DB_CONFIG)

def create_database_if_not_exists():
    """
    Crea la base de datos si no existe.
    """
    cnx = connect_no_db()
    cursor = cnx.cursor()

    db_name = DB_CONFIG["database"]
    cursor.execute(f"CREATE DATABASE IF NOT EXISTS {db_name} CHARACTER SET utf8mb4")

    cursor.close()
    cnx.close()

def create_tables():
    """
    Crea tablas simples para un escenario BPO.
    """
    cnx = connect_with_db()
    cursor = cnx.cursor()

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS agents (
        id INT AUTO_INCREMENT PRIMARY KEY,
        full_name VARCHAR(100) NOT NULL
    )
    """)

    cursor.execute("""
    CREATE TABLE IF NOT EXISTS tickets (
        id INT PRIMARY KEY,
        created_at DATETIME NOT NULL,
        status VARCHAR(20) NOT NULL,
        priority VARCHAR(10) NOT NULL,
        agent_id INT NOT NULL,
        resolved_at DATETIME NULL,
        sla_hours INT NOT NULL,
        FOREIGN KEY (agent_id) REFERENCES agents(id)
    )
    """)

    cnx.commit()
    cursor.close()
    cnx.close()
