import psycopg2
from config import POSTGRES_DATABASE, POSTGRES_USERNAME, POSTGRES_PASSWORD, POSTGRES_HOST, POSTGRES_PORT

def dbquery(sql):
    list = []
    try:  
        pgdb_conn = psycopg2.connect(database = POSTGRES_DATABASE, user = POSTGRES_USERNAME, password = POSTGRES_PASSWORD, host = POSTGRES_HOST, port = POSTGRES_PORT)  
    except Exception, e:
            print e
            return list
    pg_cursor = pgdb_conn.cursor()
    try:  
        pg_cursor.execute(sql)  
    except Exception, e:  
        pg_cursor.close()  
        pgdb_conn.close()    
        return list
    for row in pg_cursor.fetchall():
        dict = {}
        index = 0
        for value in row:
            dict[pg_cursor.description[index].name] = value
            index += 1
        list.append(dict)  
    pg_cursor.close()  
    pgdb_conn.close()
    return list