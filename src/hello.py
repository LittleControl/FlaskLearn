from flask import Flask, escape, url_for, request, abort

app = Flask(__name__)

# url_for('static', filename='style.css')

@app.route('/')
def index():
    return 'Index Page'

@app.route('/hello')
def hello_world():
    return 'Hello, World!'

@app.route('/user/<username>')
def show_user_profile(username):
    return 'User %s' % escape(username)

@app.route('/post/<int:post_id>')
def show_post(post_id):
    return 'Post %d' % post_id

@app.route('/path/<path:subpath>')
def show_subpath(subpath):
    return 'Subpath %s' % escape(subpath)

@app.route('/projects/')
def projects():
    return 'The Project Page'

@app.route('/about')
def about():
    return 'The About'

with app.test_request_context():
    print(url_for('index'))
    print(url_for('hello_world'))
    print(url_for('about', next='/'))
    print(url_for('show_user_profile', username="Nothing"))

def do_the_login():
    print 'logining...'

def show_the_login_form():
    print 'A from for login'

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        return do_the_login()
    else:
        return show_the_login_form()


@app.route('/error')
def error_page():
    abort(401)
    return 'nothing can be founded'

@app.route('/me')
def me_api():
    user = {'username': 'Control', 'theme': 'vimx', 'image': 'nothing'}
    return {
        'username': user['username'],
        'theme': user['theme'],
        'image': user['image'],
    }
