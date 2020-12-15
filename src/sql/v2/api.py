import psycopg2
import json
try:
    conn = psycopg2.connect(
        user='iyuxuan',
        password='iyuxuan',
        host='localhost',
        port='5432',
        database='test_db'
    )
    cursor = conn.cursor()
    print 'Connected!'
    ipQuery = 'SELECT (mids).ipData FROM centable1'
    cursor.execute(ipQuery)
    rows = cursor.fetchall()
    # rows = json.loads(rows)
    # rows = [('[{"id":"i1","ip":"127.0.0.1","serviceCount":147},{"id":"i2","ip":"147.25.25.25","serviceCount":258},{"id":"i3","ip":"127.0.0.1","serviceCount":147},{"id":"i4","ip":"147.25.25.25","serviceCount":258}]',)]
    # print rows
    print rows[0][0]
    print type(rows[0][0])
except (Exception, psycopg2.Error) as error:
    print 'Error while connection to PostgreSQL', error
finally:
    if(conn):
        cursor.close()
        conn.close()
        print 'PostgreSQL connection is closed!'
