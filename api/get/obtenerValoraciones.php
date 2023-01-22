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
$idalumno = obtenerValorGET("id_alumno");
$idasignatura = obtenerValorGET("id_asignatura");
$idprofesor = obtenerValorGET("id_profesor");
$nota = obtenerValorGET("nota");
$tiempo = obtenerValorGET("year");
$mes = obtenerValorGET("mes");
$dia = obtenerValorGET("dia");
$hora = obtenerValorGET("hora");
$minuto = obtenerValorGET("minuto");

//Realizar una consulta
$filas = realizarQuery(
    $conexion,
    "CALL obtenerValoraciones(:id, :id_alumno, :id_asignatura, :id_profesor, :nota, :tiempo, :mes, :dia, :hora, :minuto)",
    array(
        ":id" => $id,
        ":id_alumno" => $idalumno,
        ":id_asignatura" => $idasignatura,
        ":id_profesor" => $idprofesor,
        ":nota" => $nota,
        ":tiempo" => $tiempo,
        ":mes" => $mes,
        ":dia" => $dia,
        ":hora" => $hora,
        ":minuto" => $minuto
    )
);

//Devolver el JSON codificado del resultado
codificarJSON(array("estado" => "OK", "datos" => $filas), $formatear);

//Cerrar la conexión
$conexion = null;

?>