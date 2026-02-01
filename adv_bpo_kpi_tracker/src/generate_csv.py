# Importamos librerías
# random: para generar valores aleatorios
# datetime y timedelta: para manejar fechas y tiempos
# pandas: para trabajar con tablas (tipo Excel)
import random
from datetime import datetime, timedelta
import pandas as pd


def run():
    # Esto fija la "semilla" del azar
    # Sirve para que SIEMPRE se generen los mismos datos
    # (muy útil para pruebas y entrevistas)
    random.seed(7)

    # Fecha base: hoy menos 14 días
    # Todos los tickets van a crearse dentro de esas 2 semanas
    base_date = datetime.now() - timedelta(days=14)

    # Posibles estados de un ticket
    statuses = ["OPEN", "IN_PROGRESS", "RESOLVED"]

    # Posibles prioridades
    priorities = ["LOW", "MEDIUM", "HIGH"]

    # Lista vacía donde vamos a guardar los tickets
    rows = []

    # Creamos 300 tickets (del ID 1 al 300)
    for ticket_id in range(1, 301):

        # Fecha de creación del ticket
        # Se suma una cantidad aleatoria de días, horas y minutos
        created_at = base_date + timedelta(
            days=random.randint(0, 13),
            hours=random.randint(0, 23),
            minutes=random.randint(0, 59),
        )

        # Elegimos prioridad con pesos
        # LOW sale más seguido que HIGH
        priority = random.choices(
            priorities,
            weights=[50, 35, 15]
        )[0]

        # Agente asignado (IDs del 1 al 5)
        agent_id = random.randint(1, 5)

        # SLA por defecto (en horas)
        sla_hours = 72

        # Si la prioridad es mayor, el SLA es más exigente
        if priority == "MEDIUM":
            sla_hours = 48
        elif priority == "HIGH":
            sla_hours = 24

        # Elegimos el estado del ticket
        # La mitad de los tickets se resuelven
        status = random.choices(
            statuses,
            weights=[25, 25, 50]
        )[0]

        # Por defecto, no hay fecha de resolución
        resolved_at = None

        # Si el ticket está resuelto,
        # calculamos cuándo se resolvió
        if status == "RESOLVED":
            # Cantidad de horas que tardó en resolverse
            hours_to_resolve = random.randint(2, 96)

            # Fecha de resolución = fecha de creación + horas
            resolved_at = created_at + timedelta(hours=hours_to_resolve)

        # Armamos el ticket como un diccionario (fila)
        rows.append({
            "id": ticket_id,
            "created_at": created_at.strftime("%Y-%m-%d %H:%M:%S"),
            "status": status,
            "priority": priority,
            "agent_id": agent_id,
            "resolved_at": (
                resolved_at.strftime("%Y-%m-%d %H:%M:%S")
                if resolved_at else ""
            ),
            "sla_hours": sla_hours
        })

    # Convertimos la lista de tickets en una tabla (DataFrame)
    df = pd.DataFrame(rows)

    # Guardamos el CSV
    # index=False evita que pandas agregue una columna extra
    df.to_csv("data/raw/tickets.csv", index=False)


# Esto hace que el script se ejecute
# solo cuando lo llamamos directamente
if __name__ == "__main__":
    run()
