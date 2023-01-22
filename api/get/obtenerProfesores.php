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
$asignaturas = obtenerValorGET("asignaturas");
$continuar = obtenerValorGET("continuar");
$considerarNulo = obtenerValorGET("considerarNulo");


if($continuar != null){
    if($continuar == "false" || $continuar == "true"){
        $continuar = ($continuar === "false" ? false : true);
    } else {
        $continuar = null;
    }
    
}

//Realizar una consulta
$filas = realizarQuery(
    $conexion,
    "CALL obtenerProfesores(:id, :asignaturas, :continuar, :considerarNulo)",
    array(
        ":id" => $id,
        ":asignaturas" => $asignaturas,
        ":continuar" => $continuar,
        ":considerarNulo" => $considerarNulo === "true" ? true : false
    )
);

for($i=0; $i<count($filas); $i++){
    $valor = $filas[$i]["continuar"];
    $filas[$i]["continuar"] = filter_var($valor, FILTER_VALIDATE_BOOLEAN);
}

//Devolver el JSON codificado del resultado
codificarJSON(array("estado" => "OK", "datos" => $filas), $formatear);

//Cerrar la conexión
$conexion = null;

?>
