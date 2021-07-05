import pymysql 

class database:
    #Este es nuestro constructor de la base de datos, pertence a la clase database

    def __init__(self, host, user, password, database):
        self.host = host
        self.user = user
        self.password = password
        self.database = database
        self.conn = ''
    #Esta funcion es la que hace la conexión con la base de datos y es la que corobora , pertence a la clase database

    def connection(self): 
        self.conn = pymysql.connect(host= self.host,
                               user= self.user,
                               password= self.password,
                               database= self.database,
                               cursorclass=pymysql.cursors.DictCursor)
        if self.conn:
            return self.conn  
        else:
            return 'No fucniona la conec' 
    # Esta funcion, utilizamos los parametros que tenemos (usuario, contraseña) mediante el query
    #que llenamos desde nuesto archivo login.html 
    def execute_query(self, query):
        try:
            with self.conn.cursor() as cur:
                cur.execute(query)
                rows = cur.fetchall() 
                
                #for row in rows:
                   # print(row)
                #rows=  rows[0]
                return rows
        except:
            print('Fallo el query')
        

        








                                

    