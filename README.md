<h1><img width="50px" src="https://retamar.com/wp-content/uploads/2020/12/cropped-escarapela_capas_300.png"> Retamar API <img src="https://img.shields.io/badge/version-v1.0.0-blue.svg"></h1>

API que devuelve los datos en JSON de las valoraciones de los alumnos con respecto a las asignaturas que imparten los profesores. Dicha API está enfocada para devolver informes en el formato JSON y que el usuario tenga la posibilidad de integrarlos en cualquier tipo de aplicación.

## Instalación
1. Clonar o descargar el proyecto
2. Contratar un host online:
 - Gratuitos: [awardspace](https://www.awardspace.com/ "awardspace"), [000webhost](https://es.000webhost.com/ "000webhost")
 - Pago: [Hostinger](https://www.hostinger.es/ "Hostinger")
3. Crear una base de datos en phpMyAdmin o con el CMS
4. Abrir phpMyAdmin
5. Abrir el archivo _instalación.sql_. Copiar el contenido excepto la creación de la base de datos (porque ya estaría creada), y cambiar el nombre de la base de datos en el segundo comando (USE) por el nombre de la base creada por el CMS o phpMyAdmin.
6. Pasar todos los comandos a la consola de ejecución de comandos SQL. La base estaría ya instalada con todos los datos.
7. Actualizar a la última versión de PHP
8. Acceder al archivo _Utils.php_ y cambiar los datos de usuario, contraseña, etc.

**Nota:** en caso de errores, actualizar tanto PHP como la versión de phpMyAdmin y MySQL a la última versión. El proyecto utiliza PDO y los comandos para un servidor MySQL.


## Primeros pasos
 - La API, cuando esté disponible, devolverá un objeto en formato JSON del estado actual de la base, para que el usuario pueda verificar previamente si esta se encuentra caída. En caso de que no existan errores, habrá otro objeto con clave _datos_:
  - **Error:** `{"estado":"ERROR"}`
  
  - **Correcto:** `{"estado":"OK", "datos":[]}`

 - Existen procedimientos almacenados dentro de la base de datos
 - Para crear una nueva ventana de la API, utilizar la plantilla (archivo _plantilla.php_) y seguir las instrucciones que se encuentran en el interior del archivo.


## Procedimientos almacenados en la base de datos
Los comando se ejecutan con _CALL_ seguido del nombre del procedimiento y entre paréntesis los argumentos (Ejemplo: _CALL asignarProfesorAsignatura(11, 35);_ al profesor con id 11 se le da la asignatura con id 35)

| Nombre | Argumentos (en orden) | Descripción |
| --------- | ----------------------- | ------------ |
| asignarProfesorAsignatura | IDprofesor, IDasignatura | Da  una asignatura a un profesor |


## Obtener datos de los ciclos
Dirección: _obtenerCiclos.php_

| Argumentos | Tipo de valor | Ejemplo | Descripción |
| -------------------------- | --------------- | --------- | ------------ |
| formatear | booleano | _true_ | Estructura el JSON |
| tipo | cadena | _CFGS_ | Devuelve el tipo de ciclo |
| curso | entero | _2_ | Orden del curso (segundo o primero) |
| siglas | cadena | _DAM2_ | Siglas del ciclo |
| asignaturas | entero | 5 | Asignaturas del ciclo |
| alumnos | entero | _22_ | Cantidad de alumnos que está en dicho ciclo |

- **Tipos:** _CFGS_ (Ciclo formativo de grado superior), _CFGM_ (Ciclo formativo de grado medio)
- **Cursos:** _1_ (primero), _2_ (segundo)
- **Siglas:** _DAM1_, _DAM2_, _ASIR1_, _ASIR2_, _AF1_, _AF2_, _GA1_, _GA2_, _SMR1_, _SMR2_

Ejemplo: `localhost/api/obtenerCiclos.php?formatear=true&siglas=DAM2&tipo=CFGS`
```json
{
    "estado": "OK",
    "datos": [
        {
            "siglas": "DAM2",
            "nombre": "Desarrollo de Aplicaciones Multiplataforma",
            "curso": 2,
            "tipo": "CFGS",
            "asignaturas": 7,
            "alumnos": 2
        }
    ]
}
```


## Obtener datos de los profesores
Dirección: _obtenerProfesores.php_

Si no existiesen valoraciones para el profesor, el valor de media es null (no se puede considerar 0 por que no es un valor real)

| Argumentos | Tipo de valor | Ejemplo | Descripción |
| -------------------------- | --------------- | --------- | ------------ |
| formatear | booleano | _true_ | Estructura el JSON |
| id | cadena | _14_ | Clave única y principal del profesor |
| asignaturas | entero | _1_ | Cantidad de asignaturas que imparte |
| considerarNulo | boolean | _true_ | Si la media fuera un valor nulo, devuelve null o 0 |


Ejemplo: `localhost/api/obtenerProfesores.php?formatear=true&id=3&asignaturas=7&considerarNulo=true`
```json
{
    "estado": "OK",
    "datos": [
        {
            "id": 3,
            "nombre": "Profesor 3",
            "asignaturas": 7,
            "media": "0.0000"
        }
    ]
}
```

## Obtener datos de los alumnos
Dirección: _obtenerAlumnos.php_

Datos de los alumnos, id, ciclo que está cursando, y cantidad de valoraciones realizadas

| Argumentos | Tipo de valor | Ejemplo | Descripción |
| -------------------------- | --------------- | --------- | ------------ |
| formatear | booleano | _true_ | Estructura el JSON |
| id | cadena | _14_ | Clave única y principal del alumno |
| ciclo | cadena | _DAM2_ | Siglas del ciclo |
| valoracionesRealizadas | entero | 3 | Cantidad de valoraciones realizadas |


Ejemplo: `localhost/api/get/obtenerAlumnos.php?formatear=true&ciclo=DAM1&valoracionesRealizadas=3`
```json
{
    "estado": "OK",
    "datos": [
        {
            "id": 3,
            "nombre": "Persona 3",
            "ciclo": "DAM1",
            "valoracionesRealizadas": 3
        }
    ]
}
```

## Obtener valoraciones
Dirección: _obtenerValoraciones.php_

| Argumentos | Tipo de valor | Ejemplo | Descripción |
| -------------------------- | --------------- | --------- | ------------ |
| formatear | booleano | _true_ | Estructura el JSON |
| id | cadena | _14_ | Clave única y principal del profesor |
| idalumno | cadena | _Pedro_ | Nombre del profesor |
| idasignatura | entero | _1_ | Clave de la asignatura |
| idprofesor | entero | _1_ | Clave del profesor |
| nota | entero | _4_ | Nota recibida |


Ejemplo: `localhost/api/obtenerValoraciones.php?formatear=true&idalumno=1&idprofesor=1&nota=4`
```json
{
    "estado": "OK",
    "datos": [
        {
            "id": 1,
            "id_alumno": 1,
            "id_asignatura": 1,
            "id_profesor": 1,
            "nombre_alumno": "Persona 1",
            "nombre_asignatura": "Comunicación y atención al cliente",
            "nombre_profesor": "Profesor 1",
            "nota": 4
        }
    ]
}
```