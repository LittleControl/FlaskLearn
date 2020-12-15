import psycopg2
from flask import Flask, escape, url_for, request, abort

app = Flask(__name__)

# url_for('static', filename='style.css')
# try:
@app.route('/')
def index():
	return 'Index Page'

@app.route('/test')
def test():
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
		return rows[0][0]
        
	except (Exception, psycopg2.Error) as error:
		print 'Error while connectioin to PostgreSQL', error
			
	finally:
		if(conn):
			cursor.close()
			conn.close()
			print 'PostgreSQL connection is closed!'


@app.route('/nothing')
def nothing():
	return 'Nothing Page'
