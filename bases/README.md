# Instalación de la base de datos

1. En primer lugar, abrir el archivo _instalación.sql_
 - Si la aplicación va a estar en un host local, dejar la primera línea (comando de creación de la base de datos)
 - Si la aplicación va a estar en un host en la nube, crear la base por cuenta propia, en el CMS o con phpMyAdmin y pegar los comandos necesarios. **Importante:** cambiar el nombre de la base de datos en el comando USE.

2. Modificar los valores del archivo _2. Valores por defecto.sql_. Este archivo contiene los datos reales de los ciclos, asignaturas, etc., pero las asignaturas no tienen asignación de profesor en ese momento. Para añadir profesores y asignarlos a asignaturas, ir al archivo siguiente (siguiente paso).

3. El último archivo contiene datos de prueba. Por protección de datos, los profesores se crean en este archivo con nombre ficticios, y tras esto, son asignados a sus asignaturas con el comando correspondiente.

4. Utilizar el archivo _4. Resultado final.sql_ para comprobar que todos los datos se han añadido correctamente