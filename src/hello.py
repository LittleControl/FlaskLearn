import psycopg2
from flask import Flask, escape, url_for, request, abort
from utils.alchemy_test import ccenter_data, tdetect_data

app = Flask(__name__)

# url_for('static', filename='style.css')
# try:
@app.route('/')
def index():
	return 'Index Page'

@app.route('/api/controlcenter')
def ccenter():
	res = {}
	res['success'] = True
	res['data'] = ccenter_data()
	return res

@app.route('/api/targetdetection')
def tdetec():
	res = {}
	res['success'] = True
	res['data'] = tdetect_data()
	return res

@app.route('/nothing')
def nothing():
	return 'Nothing Page'
