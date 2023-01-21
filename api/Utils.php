<?php

//Establece la cabecera del contenido (del tipo JSON)
header("Content-Type: application/json; charset=utf-8");

//MÉTODO PARA CODIFICAR UN ARRAY A FORMATO JSON, CON LA POSIBILIDAD DE FORMATEAR EL CONTENIDO
function codificarJSON($datos, $formatear=false){
    //Imprime el contenido de la lista en formato JSON y formateado si el usuario lo indica por parámetro, por defecto, a false
    if($formatear) echo json_encode($datos, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
    else echo json_encode($datos, JSON_UNESCAPED_UNICODE);
}

//MÉTODO PARA INICIAR UNA CONEXIÓN A PARTIR DE UNA CONFIGURACIÓN
function iniciarConexion(){
    //Configuración
    $configuracion = array(
        "hostname" => "localhost",
        "dbname" => "RetamarValoracionesFP",
        "dbuser" => "root",
        "password" => ""
    );

    //Intenta crear la conexión (existe el riesgo de que no funcione, por ejemplo, si la base de datos no está en funcionamiento)
    try {
        //Crea la conexión con la configuración
        $conexion = new PDO(
            "mysql:host=". $configuracion["hostname"] .";dbname=". $configuracion["dbname"],
            $configuracion["dbuser"],
            $configuracion["password"]
        );
        //Configura la conexión, tipo de error
        $conexion -> setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $error){
        //Devuelve null en caso de error
        return null;
    }

    //Devuelve la conexión, entendiendo que no se ha desencadenado el catch
    return $conexion;
}

//MÉTODO PARA REALIZAR UNA CONSULTA (conexión, texto (comando) a ejecutar, y los argumentos, si existen)
function realizarQuery($conexion, $texto, $argumentos=null){
    //El comando se prepara a partir de la conexión
    $comando = $conexion -> prepare($texto);

    //El comando es ejecutado con argumentos
    $comando -> execute($argumentos);

    //Se devuelve el resultado final, un diccionario con el valor de las claves el de las columnas
    return $comando -> fetchAll(PDO::FETCH_ASSOC);
}

//MÉTODO PARA OBTENER UN VALOR DEL GET Y PROCESARLO
function obtenerValorGET($texto){
    //Crea un valor por defecto, nulo
    $valor = null;

    //Comprueba si el valor existe en el GET, y en ese caso, la variable 'valor' recibe el dato del GET
    if(isset($_GET[$texto])) $valor = $_GET[$texto];

    //Devuelve la variable 'valor'
    return $valor;
}

//MÉTODO PARA CAPTURAR EL FORMATEO APORTADO DESDE EL GET
function capturarFormateo(){
    //La opción de formatear inicialmente está a false
    $formatear = false;

    //Si existe valor de formateo en el GET, lo obtiene y comprueba que está a true, de lo contrario, lo deja en false
    if(isset($_GET["formatear"])) $formatear = $_GET["formatear"] === "true"? true : false;

    //Devuelve el valor final
    return $formatear;
}

?>