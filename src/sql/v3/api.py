import psycopg2
try:
    conn = psycopg2.connect(
        user='iyuxuan',
        password='iyuxuan',
        host='localhost',
        port='5432',
        database='test_db'
    )
    cursor = conn.cursor()
    print 'PostgreSQL Connected!'
    res = {}
    tagsQuery = 'SELECT * FROM centable1;'
    cursor.execute(tagsQuery)
    index = 0
    for value in cursor.fetchall()[0]:
        res[cursor.description[index].name] = value
        index += 1
    print res
    print res['assets']
    print type(res['assets'])

except (Exception, psycopg2.Error) as error:
    print 'Error while connection to PostgreSQL', error
finally:
    if(conn):
        cursor.close()
        conn.close()
        print 'PostgreSQL connection is closed!'
