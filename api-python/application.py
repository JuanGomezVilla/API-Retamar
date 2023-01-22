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

# CONFIGURACIÓN DE LA BASE DE DATOS
ajustes = {
    "hostname": "localhost",
    "dbuser": "root",
    "password": "",
    "dbname": "retamarvaloracionesfp"
}

# Clase Utils
class Utils:
    # Devuelve la conexión con la base de datos
    @staticmethod
    def obtener_conexion():
        # Intenta crear una conexión, y en caso de error devuelve nulo
        try:
            return pymysql.connect(host=ajustes["hostname"], user=ajustes["dbuser"], password=ajustes["password"], db=ajustes["dbname"])
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

# APLICACIÓN SIMPLE
@application.route("/")
def hello_world():
    print(request)
    return "<h1>Hello world</h1>"

@application.route("/<username>")
def return_username(username):
    return username

@application.post("/")
def hello_world_post():
    print("Hola desde post")
    return "hola"


# OBTENER DATOS GENERALES
@ application.route("/api/get/obtenerDatosGenerales", methods=["GET"])
def obtenerDatosGenerales():
    # Obtención de argumentos
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
        cursor.execute("CALL obtenerDatosGenerales()")
        resultado_query = cursor.fetchall()

    # Cierra la conexión, crea un resultado, y lo devuelve formateado
    conexion.close()
    resultado = {"estado": "OK", "datos": resultado_query}
    return Utils.devolver_JSON(resultado, argumentoFormatear)


# GET


# POST


# PUT


# DELETE
