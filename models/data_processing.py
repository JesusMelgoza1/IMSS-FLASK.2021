import pymysql 

class dataprocessing:
    #Este es nuestro constructor de la base de datos, pertence a la clase database
 
    def __init__(self, data):
        self.data = {}
    def build_json(self, result):
        self.data = {
            result[0]['Nombre_Encuesta']:{
                result[0]['Descripcion_seccion']:{
                    'preguntas':{
                    }   
                }
            }
        }

        '''
            nombre encuesta: ['Nombre de la encuesta],
            secciones:

        '''
        seccion = ""
        count = 1
        for row in result:
            if row['Descripcion_seccion'] != None and row['Descripcion_seccion'] != seccion:
                # print('Descripcion_seccion: ' + row['Descripcion_seccion'] + "  seccion:  " + seccion  )
                # print('____________________________________________________')
                # print('iteracion numero: ', count)
                #print(data[row['Nombre_Encuesta']][row['Descripcion_seccion']] )
                if  row['Descripcion_seccion'] in self.data[row['Nombre_Encuesta']]:
                    self.data[row['Nombre_Encuesta']][row['Descripcion_seccion']]['preguntas'][row['Descripcion_Pregunta']]={
                         'respuestas':row['Respuestas'].split(','),
                         'ponderacion': row['Ponderacion'] 
                        }
                else:
                    self.data[row['Nombre_Encuesta']][row['Descripcion_seccion']]= {
                        'preguntas':{
                            row['Descripcion_Pregunta']: {
                                  'respuestas':row['Respuestas'].split(','),
                                  'ponderacion': row['Ponderacion']
                            }
                        }
                    }
                seccion = row['Descripcion_seccion']
                # print(self.data)
            else:
                # print('iteracion numero: ', count)
                # print(self.data)
                self.data[row['Nombre_Encuesta']][row['Descripcion_seccion']]['preguntas'][row['Descripcion_Pregunta']]={           
                             'respuestas':row['Respuestas'].split(','),
                             'ponderacion': row['Ponderacion']
                            
                    }
            count +=1
        print(self.data)
        return(self.data)
