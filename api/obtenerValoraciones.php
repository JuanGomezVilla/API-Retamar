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
$idalumno = obtenerValorGET("idalumno");
$idasignatura = obtenerValorGET("idasignatura");
$idprofesor = obtenerValorGET("idprofesor");
$nota = obtenerValorGET("nota");

//Realizar una consulta
$filas = realizarQuery(
    $conexion,
    "CALL obtenerValoraciones(:id, :idalumno, :idasignatura, :idprofesor, :nota)",
    array(
        ":id" => $id,
        ":idalumno" => $idalumno,
        ":idasignatura" => $idasignatura,
        ":idprofesor" => $idprofesor,
        ":nota" => $nota
    )
);

//Devolver el JSON codificado del resultado
codificarJSON(array("estado" => "OK", "datos" => $filas), $formatear);

//Cerrar la conexión
$conexion = null;

?>