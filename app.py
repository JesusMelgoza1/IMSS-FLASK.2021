# -*- coding:utf-8 -*-
# La linea superior, nos permite decodificar en el margen de UTF-8 todo nuestro codigo
# Importar flask
import sys
from flask import Flask, render_template, request, session, url_for, redirect, jsonify
import models.database_model as datamodel
import models.data_processing as data_processing
import json
from localStoragePy import localStoragePy


db = datamodel.database('localhost','root','Adonispili2','imss_035')
dp = data_processing.dataprocessing('')
app = Flask(__name__)  # Creamos unas instancia de Flask
localStorage = localStoragePy('app')





# Creacion de rutas URLS

# Definimos nuestro pirmer endPoint para nuestra API de python (url raiz)



@app.route("/")
def index():
    titulo = "Pagina Principal"
  
    try: 
        db.connection()
        print ('La conexion es exictosa')
    except:
        print ('La conexion salio mal')
    return render_template('login.html', titulo = titulo)
   
    
@app.route("/login", methods =["POST"])
def login():
    #if el usario esta logueado:
    #flask redirect to (/home)
    
    if request.method == "POST":
        #Traer los datos del post
        user_input = request.form['user']
        password_input  =  request.form['pass']
        print(user_input,password_input)
       
        sql = "select * from usuario where Nombre_usuario={usuario} and Contraseña ={contraseña}".format(usuario="'"+user_input+"'", contraseña=password_input)

        db.connection()
        user = db.execute_query(sql)
        if(user):
            print('Si, el usuario efectivamente existe')
            redirect(url_for('dashboard'))
          
        else:
            print('El usuario no esta en la bd')
            return print('false')
        
        #Python flasj SESSION ejmplo
        #Session.setItem['Is logged]
        # print(user)
        # print(user['idUsuario'])
        # print(user['Nombre_usuario'])
        # print(user['Contraseña'])

        #database_user = user['Nombre_usuario']
        #database_pass = user['Contraseña']
    return('OK')    


        
@app.route("/dashboard")
def dashboard():
    print('dashboard')
    return render_template('dashboard.html')


    

@app.route("/datos_trabajador", methods = ['POST', 'GET'])
def datos_trabajador():

    if request.method == 'POST':
      print('datos_trabajador')
      print(request.form)
      sexo = (request.form['sexo'])
      edad = (request.form['Edad en años'])
      estado_civil = (request.form['Estado civil'])
      nivel_de_estudios = (request.form["Nivel de estudios"])
      ocupacion = (request.form['Ocupacion/Profesión/Puesto'])
      departamento = (request.form['Departamento/Sección/Área'])
      tipo_puesto = (request.form['Tipo de puesto']) 
      tipo_contratacion = (request.form['Tipo de contratacion'])
      tipo_de_personal = (request.form['Tipo de personal'])
      tipo_jornada_trabajo = (request.form["Tipo de jornada de trabajo"])
      realiza_rotacion = (request.form["Realiza rotacion de turnos"])
      tiempo_puesto_actual = (request.form["Tiempo en el puesto actual"])
      tiempo_de_experiencia_laboral = (request.form['Tiempo experiencia laboral'])

      sql = "INSERT INTO imss_035.encuestado(Sexo, Edad, Estado_Civil, Niveles_Estudios, Ocupacion, Departamento, Tipo_Puesto, Tipo_Personal, Tipo_Contratacion, Tipo_Jornada, Rotacion_Turnos, Experiencia_Actual, Experiencia_Laboral) values (\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s\',\'%s')" %(sexo, edad, estado_civil, nivel_de_estudios, ocupacion, departamento, tipo_puesto, tipo_contratacion, tipo_de_personal, tipo_jornada_trabajo, realiza_rotacion, tiempo_puesto_actual, tiempo_de_experiencia_laboral)
      print(sql)
      
      db.connection()
      db.execute_query(sql)
      db.conn.commit()
      
      
      
      return 'OK'

@app.route("/nuevo_usuario", methods = ['POST', 'GET'])
def nuevo_usuario():
  #Si el metodo que se solicita es un post, se llama al form que se lleba en la interfaz de nuevo usuario
  #asignando las variables para asi hacer la conexion con la base de datos
  if request.method == 'POST':
    print(request.form)
    usuario = request.form['usuario']
    password = request.form['pass']
    print (usuario,password)
    

    try:
      #Se realiza el query que hace la consulta para saber si ya se tiene el usuario en la base de datos 
      verificar = "SELECT Nombre_usuario FROM imss_035.usuario where Nombre_usuario = (\'%s\');"%usuario 
      user = db.execute_query(verificar)
      if (user):
         print ('Este usuario ya existe')
         return ({'Mensaje': 'El usuario ya existe','usuario':usuario})
      else:
        try:
          #Se realiza el query para insertar un nuevo usuario y contraseña 
          sql = "INSERT INTO imss_035.usuario(Nombre_usuario, Contraseña) values (\'%s\',\'%s\')" %(usuario, password)
          db.connection()
          db.execute_query(sql)
          db.conn.commit()
          return ({'Mensaje': 'El usuario se creo con exito','usuario':usuario})
        except:
          print('corrobora que el usuario este bien escrito')
    except:
      print('algo salió mal')
  return render_template('nuevo_usuario.html')
    
    

#En este endpoint hacemos la paginación de las encuestas y las imprimimos
@app.route('/encuesta', defaults = {'page':0}, methods = ['POST','GET'])
@app.route('/encuesta/page/<int:page>')
def __encuesta__(page):

  if request.method == 'POST':
    seccion = request.form['seccion']


  # if localStorage.getItem(page):
  #   value =localStorage.getItem(page)
  #   value += 10 
  #   localStorage.removeItem(page)
  #   localStorage.setItem(page, value)
  #   print (localStorage.getItem(page))
  # else:
  #   localStorage.setItem(page,0)
  _dict = {}
  perpage = 10
  startat = page
  desc_sec = "I.- Acontecimiento traumático severo"
  
  database = db.connection()
  cursor = database.cursor()

  cursor.execute("SELECT * from encuestas where idEncuesta = 3")

  data = cursor.fetchall()
  _dict = dp.build_json(data)
  return render_template("encuesta.html", _dict = _dict)

@app.route("/seccion", methods = ['POST', 'GET'])
def seccion():

  if request.method == 'POST':

    resultados = request.form
    print(resultados)

    seccion = request.form['seccion']
    if seccion == "I.- Acontecimiento traumático severo":
      print('Es igual al primero ')
      seccion = "II.- Recuerdos persistentes sobre el acontecimiento (durante el último mes):"

    elif seccion == "II.- Recuerdos persistentes sobre el acontecimiento (durante el último mes):" :
      seccion = "III.- Esfuerzo por evitar circunstancias parecidas o asociadas al acontecimiento (durante el último mes):"

    elif seccion == "III.- Esfuerzo por evitar circunstancias parecidas o asociadas al acontecimiento (durante el último mes):":
      seccion = "IV Afectación (durante el último mes):"
    else:
      return("algo paso")

      
    
    database = db.connection()
    cursor = database.cursor()
    cursor.execute("SELECT * from encuestas where idEncuesta = 1 and Descripcion_seccion = \'%s\';"% seccion)
    data = cursor.fetchall()
    _dict = dp.build_json(data)

    if seccion == "IV Afectación (durante el último mes):":
      return render_template("encuesta.html", _dict = _dict, end = True)
  
    return render_template("encuesta.html", _dict = _dict)
  
  else:

    database = db.connection()
    cursor = database.cursor()
    cursor.execute("SELECT * from encuestas where idEncuesta = 1 and Descripcion_seccion = \'I.- Acontecimiento traumático severo\' ")
    data = cursor.fetchall()
    _dict = dp.build_json(data)
    
  
  return render_template("encuesta.html", _dict = _dict)

  

    #if "si" in request.form: 
    #return rendert_ 
    #else
    #return ('SI')

    

    






@app.route("/encuestas", methods =['POST','GET'])
def encuestas():

    encuestas = {}
    sql = '''SELECT Nombre_Encuesta, Descripcion_seccion,  Descripcion_Pregunta, IdPregunta,
                group_concat(respuestas.Descripcion separator ',' ) as Respuestas , 
                group_concat(respuestas.Ponderacion separator ',' ) as Ponderacion
                FROM encuesta 
                INNER JOIN pregunta
                on encuesta.IdEncuesta = pregunta.Encuesta_IdEncuesta
                INNER JOIN grupo_respuestas
                on pregunta.Grupo_Respuestas_idGrupo_Respuestas = grupo_respuestas.idGrupo_Respuestas
                INNER JOIN respuestas
                on grupo_respuestas.idGrupo_Respuestas = respuestas.Grupo_Respuestas_idGrupo_Respuestas
                where IdEncuesta = 2
                group by IdPregunta;
          '''
    db.connection()
    result = db.execute_query(sql)
    # print(' ______________________________________ ')
    #print(encuestas[0])
    encuestas = dp.build_json(result)
    # for i in encuestas:
    #     print('________________ Encuestas app.py _________')
    #     print(i)
    # print(encuestas)
    return render_template("encuesta.html", encuestas= encuestas)




if __name__ == "__main__":
    app.run(host='localhost', port=8000, debug=True)
