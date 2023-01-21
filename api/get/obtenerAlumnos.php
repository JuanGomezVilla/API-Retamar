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
$id = obtenerValorGET("id");
$ciclo = obtenerValorGET("ciclo");
$valoracionesRealizadas = obtenerValorGET("valoracionesRealizadas");

//Realizar una consulta
$filas = realizarQuery(
    $conexion,
    "CALL obtenerDatosAlumnos(:id, :ciclo, :valoracionesRealizadas);",
    array(
        ":id" => $id,
        ":ciclo" => $ciclo,
        ":valoracionesRealizadas" => $valoracionesRealizadas
    )
);

//Devolver el JSON codificado del resultado
codificarJSON(array("estado" => "OK", "datos" => $filas), $formatear);

//Cerrar la conexión
$conexion = null;

?>
