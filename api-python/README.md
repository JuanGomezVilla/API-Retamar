# Instalación

1. Se requiere de Python, por ejemplo, la versión 3.10
2. Ejecutar el siguiente comando en la carpeta para crear el entorno virtual:
    ```
    python -m venv env
    ```

3. A partir de este comando, se habrá creado una carpeta de nombre _env_
4. Posteriormente, ejecutar el entorno virtual con el comando:
    ```
    call .\env\Scripts\activate
    ```

5. Si estuviera activado, al principio de la línea del siguiente comando aparecerá _(env)_
6. Con el archivo _requirements.txt_, instalar las librerías necesarias:
    ```
    pip install -r requirements.txt
    ```

# Ejecución

1. Activar el entorno virtual:
    ```
    call .\env\Scripts\activate
    ```

2. Ejecutar en modo depuración:
    ```
    flask --app application.py --debug run
    ```