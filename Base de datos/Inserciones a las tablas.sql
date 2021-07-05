-- INSERTAR DATOS A LA TABLA CALIFICACION_CATEGORIA ----------

INSERT INTO imss_035.calificacion_categoria 
(Descripcion_Descripcion)
VALUES ("Ambiente de trabajo");

SELECT * FROM imss_035.calificacion_categoria;

-- INSERTAR DATOS A LA TABLA CALIFICACION_DOMINIO-----------

INSERT INTO imss_035.calificacion_dominio
(idCalificacion_Dominio, Descripcion_Dominio, Calificacion_Categoria_idCalificacion_Categoria)
VALUES (1, "Condiciones en el ambiente de trabajo", 1);

SELECT * FROM imss_035.calificacion_dominio;

-- INSERTAR DATOS A LA TABLA CALIFICACION_DIMENCION

INSERT INTO imss_035.calificacion_dimension
(IdCalificacion_Dimension, Descripcion_Dimension, Calificacion_Dominio_idCalificacion_Dominio)
VALUES (1, "Condiciones peligrosas e inseguras", 1),
       (2, "Condiciones deficientes e insalubres", 1),
	   (3, "Trabajos peligrosos", 1);
SELECT * FROM imss_035.calificacion_dimension;

-- INSERTAR DATOS A LA TABLA ENCUESTA-----------
INSERT INTO imss_035.encuesta
(Nombre_Encuesta)
VALUES ("Guía de Referencia II IDENTIFICACIÓN Y ANÁLISIS DE LOS FACTORES DE RIESGO PSICOSOCIAL");

SELECT * FROM imss_035.encuesta;

-- INSERTAR DATOS A LA TABLA GRUPO RESPUESTAS- ASCENDENTE-----------
INSERT INTO imss_035.grupo_respuestas
(idGrupo_Respuestas, Nombre_Grupo)
VALUES	(1, "Ascendente");

-- INSERTAR DATOS A LA TABLA GRUPO RESPUESTAS- DESCENDENTE-----------

INSERT INTO imss_035.grupo_respuestas
(idGrupo_Respuestas, Nombre_Grupo)
VALUES	(2, "Descendente");


INSERT INTO imss_035.grupo_respuestas
(idGrupo_Respuestas,Nombre_Grupo)
VALUES (3, "SI_NO");

SELECT * FROM imss_035.grupo_respuestas;


-- INSERTAR DATOS A LA TABLA GRUPO RESPUESTAS-----------


INSERT INTO imss_035.respuestas 
(Descripcion, Ponderacion, Grupo_Respuestas_idGrupo_Respuestas)
VALUES ("SIEMPRE", 0, 1),
("CASI SIEMPRE", 1, 1),
("ALGUNAS VECES", 2, 1),
("CASI NUNCA", 3, 1),
("NUNCA", 4, 1);


INSERT INTO imss_035.respuestas 
(Descripcion, Ponderacion, Grupo_Respuestas_idGrupo_Respuestas)
VALUES ("SIEMPRE", 4, 2),
("CASI SIEMPRE", 3, 2),
("ALGUNAS VECES", 2, 2),
("CASI NUNCA", 1, 2),
("NUNCA", 0, 2);




INSERT INTO imss_035.respuestas 
(Descripcion, Grupo_Respuestas_idGrupo_Respuestas)
VALUES ("SI",  3),
	   ("NO", 3);

SELECT * FROM imss_035.respuestas;


-- INSERTAR DATOS A LA TABLA GRUPO PREGUNTAS -----------


INSERT INTO imss_035.pregunta
(Descripcion_Pregunta,Encuesta_IdEncuesta, Grupo_Respuestas_idGrupo_Respuestas, Calificacion_Dimension_IdCalificacion_Dimension)
VALUES ("Mi trabajo  físico",1,1,1);

SELECT * FROM imss_035.pregunta;

-- INSERTAR DATOS A LA TABLA USUARIO-----------

INSERT INTO `imss_035`.`usuario` (`Nombre_usuario`, `Contraseña`) 
VALUES ('JesusMelgoza', '12345');

SELECT * FROM imss_035.usuario;

-- INSERTAR DATOS A LA TABLA ENCUESTADOR-----------
INSERT INTO `imss_035`.`encuestador` (`Nombre_Encuestador`, `Empresa`, `Direccion`, `Colonia`, `Ciudad`, `Estado`, `Telefono`, `Fax`, `RFC`, `Usuario_idUsuario`) 
VALUES ('Juan Perez', 'Agrana', 'Nicolas Regules', 'Ramirez', 'Zamora', 'Michoacan', '35272771328', 'hcdjsjkdsjsdjk', 'RUSK6SJSJSJ6S', '1');

SELECT * FROM imss_035.encuestador;

-- INSERTAR DATOS A LA TABLA 	ENCUESTADO-----------
INSERT INTO `imss_035`.`encuestado` (`Sexo`, `Edad`, `Estado_Civil`, `Niveles_Estudios`, `Ocupacion`, `Departamento`, `Tipo_Puesto`, `Tipo_Personal`, `Tipo_Contratacion`, `Tipo_Jornada`, `Rotacion_Turnos`, `Experiencia_Actual`, `Experiencia_Laboral`) 
VALUES ('Maculino', '15-19', 'Soltero', 'Primaria', 'Obrero', 'Limpieza', 'Operativo', 'Confianza', 'Horonarios', 'Fijo Nocturno', 'no', 'Entre 1 a 4 años', 'Menos de 6 meses');

SELECT * FROM imss_035.encuestado;

-- INSERTAR DATOS A LA TABLA FICHAS-----------
INSERT INTO `imss_035`.`fichas` (`Numero-Ficha`, `Fecha`, `Encuestado_idEncuestado`, `Encuesta_IdEncuesta`)
 VALUES ('1', '2020-12-20', '1', '1');
SELECT * FROM imss_035.fichas;

-- INSERTAR DATOS A LA TABLA DETALLE_FICHAS-----------
INSERT INTO `imss_035`.`detalle_fichas` (`Fichas_idFichas`, `Encuesta_IdEncuesta`, `Pregunta_idPregunta`, `Respuestas_idRespuestas`) 
VALUES ('1', '1', '1', '1');

SELECT * FROM imss_035.detalle_fichas;


-- PARA MODIFICAR ALGUN VALOR EN LAS TABLAS
-- ALTER TABLE imss_035.grupo_respuestas MODIFY Nombre_Grupo VARCHAR(200);


-- INSERT INTO `imss_035`.`fichas` (`idFichas`, `Numero-Ficha`, `Fecha`, `Fichascol`, `Encuestado_idEncuestado`, `Encuesta_IdEncuesta`) VALUES ('1', '1', '06/oct/2020', '1', '1', '1');


/*
 * Comentario en varias líneas.
 */
