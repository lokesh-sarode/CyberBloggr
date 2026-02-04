from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail
import json
from datetime import datetime
import os
from werkzeug.utils import secure_filename
import pymysql
pymysql.install_as_MySQLdb()
# with open('config.json', 'r') as c:
#     params =json.load(c)["params"]
# local_server = True

with open('config.json', 'r') as c:
    params = json.load(c)["params"]

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = params["upload_location"]
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME = os.getenv("GMAIL_USER"),
    MAIL_PASSWORD = os.getenv("GMAIL_PASSWORD")
)

mail = Mail(app)

# Set SQLAlchemy URI: Prefer DATABASE_URL if available (Render), else local config
db_uri = os.getenv("DATABASE_URL")
if db_uri and db_uri.startswith("postgres://"):
    db_uri = db_uri.replace("postgres://", "postgresql://", 1)
    app.config['SQLALCHEMY_DATABASE_URI'] = db_uri
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']

db = SQLAlchemy(app)

class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), unique=False, nullable=False)
    email = db.Column(db.String(120), unique=False, nullable=False)
    phoneno = db.Column(db.String(15), unique=False, nullable=False)
    msg = db.Column(db.String(120), unique=False, nullable=False)

class Signup(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=False, nullable=False)
    email = db.Column(db.String(50), unique=False, nullable=False)
    password = db.Column(db.String(40), unique=False, nullable=False)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(80), unique=False, nullable=False)
    tagline = db.Column(db.String(100), unique=False, nullable=False)
    author = db.Column(db.String(30), unique=False, nullable=False)
    slug = db.Column(db.String(80), unique=False, nullable=False)
    content = db.Column(db.String(500), unique=False, nullable=False)
    img_file = db.Column(db.String(15), unique=False, nullable=False)
    date = db.Column(db.String(12), unique=False, nullable=True)


@app.route('/')
def home():
    #Paging logic:-
    # page = int(request.args.get('page'))
    # if(not str()):
    #     pass

    posts = Posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('index.html', params=params, posts=posts)

@app.route('/login')
def login():
    posts = Posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('login.html', params=params)

@app.route('/signup', methods=['GET', 'POST'])
def signup():
    if request.method=='POST':
        '''Add entry to database'''
        name = request.form.get('yourname')
        email = request.form.get('email')
        password = request.form.get('pass')
        entry = Signup(name=name, password=password, email=email)
        db.session.add(entry)
        db.session.commit()
    return render_template('signup.html', params=params)

@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    if ('user' in session and session['user']==params['admin_user']):
        posts = Posts.query.all()
        return render_template('dashboard.html', params=params, posts=posts)

    if request.method == 'POST':
        username = request.form.get('userName')
        password = request.form.get('pass')
        if(username==params['admin_user'] and password==params['admin_password']):
            # set the session variable
            session['user'] = username
            session['password'] = password
            posts = Posts.query.all()
            return render_template('dashboard.html', params=params, posts=posts)
        
    return render_template('login.html', params=params)

@app.route('/about')
def about():
    return render_template("about.html", params=params)

@app.route('/post/<string:post_slug>', methods=['GET'])
def posts(post_slug):
    post = Posts.query.filter_by(slug = post_slug).first()
        
    return render_template("post.html", params=params, post=post)


@app.route("/edit/<string:sno>", methods=['GET','POST'])
def edit(sno):
    if ('user' in session and session['user']==params['admin_user']):
        if (request.method =='POST'):
            box_title = request.form.get('title')
            tagline = request.form.get('tagline')
            author = request.form.get('author')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            date = datetime.now()

            if(sno=='0'):
                post = Posts(title=box_title, tagline=tagline, author=author, slug=slug, content=content, img_file=img_file, date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.tagline = tagline
                post.author =author
                post.slug = slug
                post.content = content
                post.img_file = img_file
                post.date = date
                db.session.commit()
                return redirect('/edit/' + sno)
        post = Posts.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, sno=sno)
    
            

@app.route('/uploader', methods=['GET','POST'])
def uploader():
    if ('user' in session and session['user']==params['admin_user']):
        if request.method=='POST':
            f = request.files['file1']
            f.save(os.path.join(".\\static\\uploads", secure_filename(f.filename)))
    posts = Posts.query.filter_by().all()[0:params['no_of_posts']]
    return render_template('index.html', params=params, posts=posts)



@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/login')


@app.route('/delete/<string:sno>')
def delete(sno):
    if ('user' in session and session['user']==params['admin_user']):
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route('/contact', methods=['GET','POST'])
def contactpage():
    if request.method=='POST':
        '''Add entry to database'''
        name = request.form.get('name')
        email = request.form.get('email')
        phone_no = request.form.get('phoneno')
        message = request.form.get('msg')
        entry = Contacts(name=name, phoneno=phone_no, email=email, msg=message)
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from CyberBloggr => '+ name, 
                          sender = email, 
                          recipients = [params['gmail_user']],
                          body = message + "\n" + phone_no
                          )
         
    return render_template("contact.html", params=params)

if __name__ == '__main__':
    app.run(debug=True)