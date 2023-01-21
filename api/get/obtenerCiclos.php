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
    "SELECT siglas, nombre, curso, tipo,
        (SELECT COUNT(*) FROM asignaturas WHERE ciclo=siglas) AS asignaturas,
        (SELECT COUNT(*) FROM alumnos WHERE ciclo=siglas) AS alumnos
    FROM ciclos WHERE (:tipo IS NULL OR tipo=:tipo) AND
        (:curso IS NULL OR curso=:curso) AND
        (:siglas IS NULL OR siglas=:siglas) HAVING
        (:alumnos IS NULL OR alumnos=:alumnos) AND
        (:asignaturas IS NULL OR asignaturas=:asignaturas)",
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