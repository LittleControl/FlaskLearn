import psycopg2
from flask import Flask, escape, url_for, request, abort
from utils.alchemy_test import data

app = Flask(__name__)

# url_for('static', filename='style.css')
# try:
@app.route('/')
def index():
	return 'Index Page'

@app.route('/api/controlcenter')
def test():
	res = {}
	res['success'] = True
	res['data'] = data()
	return res

@app.route('/nothing')
def nothing():
	return 'Nothing Page'
