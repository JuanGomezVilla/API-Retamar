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


//COFIDICAR A PARTIR DE AQUÍ ########################################################################################


//Obtiene los valores del GET y los procesa
/*$tipo = obtenerValorGET("tipo");
$curso = obtenerValorGET("curso");
$siglas = obtenerValorGET("siglas");*/

//Realizar una consulta
/*$filas = realizarQuery(
    $conexion,
    "SELECT * FROM ciclos WHERE (:tipo IS NULL OR tipo=:tipo) AND (:curso IS NULL OR curso=:curso) AND (:siglas IS NULL OR siglas=:siglas)",
    array(
        ":tipo" => $tipo,
        ":curso" => $curso,
        ":siglas" => $siglas
    )
);*/

//COFIDICAR HASTA AQUÍ ########################################################################################

//Devolver el JSON codificado del resultado
codificarJSON(array("estado" => "OK", "datos" => $filas), $formatear);

//Cerrar la conexión
$conexion = null;

?>