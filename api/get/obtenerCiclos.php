<?php

//IMPORTACIÓN DE LIBRERÍAS DEFINIDAS
require("../Utils.php");

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
$tipo = obtenerValorGET("tipo");
$curso = obtenerValorGET("curso");
$siglas = obtenerValorGET("siglas");
$alumnos = obtenerValorGET("alumnos");
$asignaturas = obtenerValorGET("asignaturas");

//Realizar una consulta
$filas = realizarQuery(
    $conexion,
    "CALL obtenerCiclos(:tipo, :curso, :siglas, :alumnos, :asignaturas);",
    array(
        ":tipo" => $tipo,
        ":curso" => $curso,
        ":siglas" => $siglas,
        ":alumnos" => $alumnos,
        ":asignaturas" => $asignaturas
    )
);

//Devolver el JSON codificado del resultado
codificarJSON(array("estado" => "OK", "datos" => $filas), $formatear);

//Cerrar la conexión
$conexion = null;

?>