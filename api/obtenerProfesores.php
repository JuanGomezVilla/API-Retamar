<?php

//IMPORTACIÓN DE LIBRERÍAS DEFINIDAS
require("Utils.php");

//Obtener la conexión
$conexion = iniciarConexion();

//Verificar el estado de la conexión
if($conexion == null){
    codificarJSON(array("estado" => "ERROR"));
    return;
}

//Crear una variable para formatear y permitir el formateo si se pasa por la dirección
$formatear = capturarFormateo();

//Obtiene los valores del GET y los procesa
$id = obtenerValorGET("id");
$nombre = obtenerValorGET("nombre");
$asignaturas = obtenerValorGET("asignaturas");

//Realizar una consulta
$filas = realizarQuery(
    $conexion,
    "SELECT id, nombre,
        (SELECT COUNT(*) FROM asignaturas a WHERE a.id_profesor=p.id) as asignaturas
    FROM profesores p WHERE (:id IS NULL OR id=:id) AND
        (:nombre IS NULL OR nombre=:nombre) HAVING
        (:asignaturas IS NULL OR asignaturas=:asignaturas)",
    array(
        ":id" => $id,
        ":nombre" => $nombre,
        ":asignaturas" => $asignaturas 
    )
);

//Devolver el JSON codificado del resultado
codificarJSON(array("estado" => "OK", "datos" => $filas), $formatear);

//Cerrar la conexión
$conexion = null;

?>