async function getJSON(ruta, callback) {
    let archivo = await fetch(ruta);
    callback(await archivo.text());
}