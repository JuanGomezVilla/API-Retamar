<h1><img width="50px" src="https://retamar.com/wp-content/uploads/2020/12/cropped-escarapela_capas_300.png"> Retamar API <img src="https://img.shields.io/badge/version-v1.0.0-blue.svg"></h1>

API que devuelve los datos en JSON de las valoraciones de los alumnos con respecto a las asignaturas que imparten los profesores. Dicha API está enfocada para devolver informes en formato JSON y que el usuario tenga la posibilidad de integrarlos en cualquier tipo de aplicación. Está programa en Python y PHP, es decir, la API se puede construir en cualquiera de los dos lenguajes.

## Instalación
1. Clonar o descargar el proyecto
2. Contratar un host online, o utilizar el localhost:
 - Gratuitos: [awardspace](https://www.awardspace.com/ "awardspace"), [000webhost](https://es.000webhost.com/ "000webhost")
 - Pago: [Hostinger](https://www.hostinger.es/ "Hostinger")
3. Crear una base de datos en phpMyAdmin o con el CMS, del tipo MySQL
4. Abrir phpMyAdmin
5. Instalar la base de datos en orden (carpeta _bases_)
6. Pasar todos los comandos a la consola de ejecución de comandos SQL. La base estaría ya instalada con todos los datos.
7. Actualizar a la última versión de PHP (y Python si se va a utilizar), y preferiblemente, también MySQL
8. Acceder al archivo _Utils.php_ y cambiar los datos de usuario, contraseña, etc.

**Nota:** en caso de errores, actualizar tanto PHP/Python como la versión de phpMyAdmin y MySQL a la última versión. El proyecto utiliza PDO y los comandos para un servidor MySQL.

## Lenguajes
Es importante mencionar que esta API está escrita tanto en Python como en PHP. La documentación de Python se encuentra dentro de la carpeta _api-python_