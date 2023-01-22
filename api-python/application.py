# Importación de Flask, la obtención de argumentos, y la conversión a JSON del texto
from flask import Flask, request, jsonify, json, Response
import pymysql, pymysql.cursors

# Se importa las CORS, para realizar llamadas
from flask_cors import CORS, cross_origin

# Creación de una aplicación y CORS (CONFIGURACIÓN: accesos de orígenes desconocidos, orden de claves)
application = Flask(__name__)
cors = CORS(application)
application.config["CORS_HEADERS"] = "Content-Type"
application.config["JSON_SORT_KEYS"] = False
application.config["JSON_AS_ASCII"] = False

# CONFIGURACIÓN DE LA BASE DE DATOS
ajustes = {
    "hostname": "localhost",
    "dbuser": "root",
    "password": "",
    "dbname": "retamarvaloracionesfp"
}

enlaces = {
    "Obtener asignaturas": "/api/get/obtenerAsignaturas?formatear=true",
    "Obtener datos de los ciclos": "/api/get/obtenerCiclos?formatear=true",
    "Obtener datos de los profesores": "/api/get/obtenerProfesores?formatear=true",
    "Obtener valoraciones": "/api/get/obtenerValoraciones?formatear=true",
    "Obtener datos de los alumnos": "/api/get/obtenerAlumnos?formatear=true",
    "Obtener datos generales": "/api/get/obtenerDatosGenerales?formatear=true"
}

# Clase Utils
class Utils:
    # Devuelve la conexión con la base de datos
    @staticmethod
    def obtener_conexion():
        # Intenta crear una conexión, y en caso de error devuelve nulo
        try:
            return pymysql.connect(host=ajustes["hostname"], user=ajustes["dbuser"], password=ajustes["password"], db=ajustes["dbname"], charset='utf8')
        except:
            return None
    
    # Procesa el JSON, recibe unos datos, y comprueba si formatear dichos datos
    @staticmethod
    def procesar_json(datos, formatear=False):
        if formatear:
            # Aplica tabulación y saltos de línea
            return json.dumps(datos, indent=4)
        # Elimina espacios entre valores
        return json.dumps(datos, separators=(",", ":"))
    
    # Devuelve el JSON directamente al cuerpo de la página
    @staticmethod
    def devolver_JSON(datos, formatear=False):
        # Genera la respuesta en formato JSON con los datos formateados o no
        return Response(Utils.procesar_json(datos, formatear), content_type="application/json; charset=utf-8")
    
    @staticmethod
    def realizarQuery(texto, argumentos=None):
        argumentoFormatear = request.args.get("formatear", False, bool)
        # Obtiene la conexión y verifica si es correcta
        conexion = Utils.obtener_conexion()
        if not conexion:
            return Utils.devolver_JSON({"estado": "ERROR"}, False)

        # Lista para guardar los datos
        resultado_query = []

        # Creará una conexión y el resultado final será en formato diccionario
        with conexion.cursor(pymysql.cursors.DictCursor) as cursor:
            # Ejecuta el comando y obtiene los datos resultantes
            cursor.execute(texto, argumentos)
            resultado_query = cursor.fetchall()

        # Cierra la conexión, crea un resultado, y lo devuelve formateado
        conexion.close()
        resultado = {"estado": "OK", "datos": resultado_query}
        return Utils.devolver_JSON(resultado, argumentoFormatear)


# APLICACIÓN SIMPLE
@application.route("/api/")
def indice_contenidos():
    resultado = "<style>body {font:16px Arial;margin: 10px;} a{text-decoration:none} </style>"
    resultado += "<h2>Índice de contenidos</h2>"
    resultado += "<ul>"
    for enlace in enlaces:
        resultado += "<li><a href='"+ enlaces[enlace] +"'>"+ enlace +"</a></li>"
    resultado += "</ul>"
    return resultado

@application.post("/")
def hello_world_post():
    print("Hola desde post")
    return "hola"

# --------------------------------------------------------------------------------------------------------------

# OBTENER DATOS GENERALES
@ application.route("/api/get/obtenerDatosGenerales", methods=["GET"])
def obtenerDatosGenerales():
    return Utils.realizarQuery("CALL obtenerDatosGenerales()")

# OBTENER DATOS DE LAS ASIGNATURAS
@ application.route("/api/get/obtenerAsignaturas", methods=["GET"])
def obtenerAsignaturas():
    # Obtención de argumentos
    argumentoID = request.args.get("id", None, int)
    argumentoCiclo = request.args.get("ciclo", None, str)
    argumentoIDprofesor = request.args.get("id_profesor", None, int)

    # Ejecución del comando
    return Utils.realizarQuery("CALL obtenerAsignaturas(%s, %s, %s)", [argumentoID, argumentoCiclo, argumentoIDprofesor])

# OBTENER DATOS DE LOS CICLOS
@ application.route("/api/get/obtenerCiclos", methods=["GET"])
def obtenerCiclos():
    # Obtención de argumentos
    argumentoTipo = request.args.get("tipo", None, str)
    argumentoCurso = request.args.get("curso", None, str)
    argumentoSiglas = request.args.get("siglas", None, str)
    argumentoAlumnos = request.args.get("alumnos", None, int)
    argumentoAsignaturas = request.args.get("asignaturas", None, int)

    # Ejecución del comando
    return Utils.realizarQuery("CALL obtenerCiclos(%s, %s, %s, %s, %s)", [argumentoTipo, argumentoCurso, argumentoSiglas, argumentoAlumnos, argumentoAsignaturas])

# OBTENER DATOS DE LOS ALUMNOS
@ application.route("/api/get/obtenerAlumnos", methods=["GET"])
def obtenerAlumnos():
    # Obtención de argumentos
    argumentoID = request.args.get("id", None, int)
    argumentoCiclo = request.args.get("ciclo", None, str)
    argumentoValoracionesRealizadas = request.args.get("valoracionesRealizadas", None, int)

    # Ejecución del comando
    return Utils.realizarQuery("CALL obtenerAlumnos(%s, %s, %s)", [argumentoID, argumentoCiclo, argumentoValoracionesRealizadas])

# OBTENER DATOS DE LOS PROFESORES
@ application.route("/api/get/obtenerProfesores", methods=["GET"])
def obtenerProfesores():
    # Obtención de argumentos
    argumentoID = request.args.get("id", None, int)
    argumentoAsignaturas = request.args.get("asignaturas", None, int)
    argumentoConsiderarNulo = request.args.get("considerarNulo", False, bool)

    # Ejecución del comando
    return Utils.realizarQuery("CALL obtenerProfesores(%s, %s, %s)", [argumentoID, argumentoAsignaturas, argumentoConsiderarNulo])


# OBTENER DATOS DE LAS VALORACIONES
@ application.route("/api/get/obtenerValoraciones", methods=["GET"])
def obtenerValoraciones():
    # Obtención de argumentos
    argumentoID = request.args.get("id", None, int)
    argumentoIDalumno = request.args.get("id_alumno", None, int)
    argumentoIDasignatura = request.args.get("id_asignatura", None, int)
    argumentoIDprofesor = request.args.get("id_profesor", None, int)
    argumentoNota = request.args.get("nota", None, int)

    argumentoTiempo = request.args.get("year", None, int)
    argumentoMes = request.args.get("mes", None, int)
    argumentoDia = request.args.get("dia", None, int)
    argumentoHora = request.args.get("hora", None, int)
    argumentoMinuto = request.args.get("minuto", None, int)

    # Ejecución del comando
    return Utils.realizarQuery("CALL obtenerValoraciones(%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", [
        argumentoID, argumentoIDalumno, argumentoIDasignatura, argumentoIDprofesor, argumentoNota,
        argumentoTiempo, argumentoMes, argumentoDia, argumentoHora, argumentoMinuto]
    )


# --------------------------------------------------------------------------------------------------------------

# POST


# PUT


# DELETE
