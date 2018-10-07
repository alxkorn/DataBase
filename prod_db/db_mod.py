import pymysql

def connect(host, login, password):
    db = pymysql.connect(host, login, password)
    db.select_db('mydb')
    return db

def disconnect(db):
    if db:
        db.close()

def call_saved_procedure(db, proc_name, proc_args):
    cursor = db.cursor(pymysql.cursors.DictCursor)
    cursor.callproc(proc_name, proc_args)

    rows = cursor.fetchall()
    db.commit()
    return rows

def call_saved_view(db, view_name):
    cursor = db.cursor(pymysql.cursors.DictCursor)
    cursor.execute('SELECT * FROM `{0}`;'.format(view_name))
    
    rows = cursor.fetchall()
    db.commit()
    return rows

def executeQuery(db, query):
    cursor = db.cursor(pymysql.cursors.DictCursor)
    cursor.execute(query)
    
    rows = cursor.fetchall()
    db.commit()
    return rows

# db = connect('127.0.0.1', 'root', 'qwerty')
# call_saved_view(db, 'cars_without_insurance');
# rows = call_saved_procedure(db, 'drivers4car', 'ABC12345DEF')
# print(rows)
# disconnect(db)
