import psycopg2
import pandas as pd


def connect():
    return psycopg2.connect(
        host = "codd04.research.northwestern.edu",
        database = "postgres",
        user = "cpdbstudent",
        password = "DataSci4AI",
        port = 5433
    )


def download(tablename):
    connection = connect()
    cursor = connection.cursor()
    cursor.execute(f"SELECT * FROM {tablename};")
    return pd.DataFrame(cursor.fetchall(), columns=[desc[0] for desc in cursor.description])
