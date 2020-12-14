import psycopg2
try:
    # connection
    connection = psycopg2.connect(
        user='iyuxuan',
        password='iyuxuan',
        host='localhost',
        port='5432',
        database='testDB'
    )
    cursor = connection.cursor()

    # create table if not exists
    tagsCreate = '''
        CREATE TABLE IF NOT EXISTS tags(
            id INT PRIMARY KEY,
            flawCount        INTEGER,
            weakPawdCount    INTEGER,
            verSuccess       INTEGER,
            useSuccess       INTEGER
        );
    '''
    cursor.execute(tagsCreate)
    print 'Finished creating table (if existed)'
    
    # Operate 有数据就更新,没有数据就插入
    tagsQuery = 'SELECT * FROM tags;'
    cursor.execute(tagsQuery)
    rows = cursor.fetchall()
    if(len(rows) == 0):
        tagsData = '''
            INSERT INTO tags (flawCount, weakPawdCount, verSuccess, useSuccess)
            VALUES (4, 5, 6, 7)
        '''
        cursor.execute(tagsData)
        print 'Inserted...'
    else:
        print rows
        tagsData = '''
            UPDATE tags
            SET flawCount=2, weakPawdCount=3, verSuccess=4, useSuccess=5;
        '''
        cursor.execute(tagsData)
        print 'Updated...'

except (Exception, psycopg2.Error) as error:
    print 'Error while connecting to PostgreSQL', error

finally:
    if(connection):
        connection.commit()
        cursor.close()
        connection.close()
        print 'PostgreSQL connection is closed'
