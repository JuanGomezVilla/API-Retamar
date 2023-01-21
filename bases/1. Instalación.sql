-- CREACIÓN DE LA BASE DE DATOS
CREATE DATABASE RetamarValoracionesFP CHARACTER SET utf8 COLLATE utf8_general_ci;

-- SELECCIONAR LA BASE
USE RetamarValoracionesFP;

-- CREACIÓN DE TABLAS
CREATE OR REPLACE TABLE ciclos (
    siglas VARCHAR(50) PRIMARY KEY, -- Siglas del ciclo
    nombre VARCHAR(50), -- Nombre del ciclo
    curso INT, -- Curso, puede ser primero o segundo
    tipo VARCHAR(50) -- Tipo de ciclo
) ENGINE=InnoDB;

CREATE OR REPLACE TABLE alumnos (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID del alumno
    nombre VARCHAR(50), -- Nombre del alumno
    ciclo VARCHAR(50), -- Ciclo que está cursando
    FOREIGN KEY (ciclo) REFERENCES ciclos(siglas) -- Clave foránea del ciclo
) ENGINE=InnoDB;

CREATE OR REPLACE TABLE profesores (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID del profesor
    nombre VARCHAR(50) -- Nombre del profesor
) ENGINE=InnoDB;

CREATE OR REPLACE TABLE asignaturas (
    id INT AUTO_INCREMENT PRIMARY KEY, -- ID de la asignatura
    nombre VARCHAR(50), -- Nombre de dicha asignatura
    ciclo VARCHAR(50), -- Ciclo en la que se imparte
    id_profesor INT, -- Profesor que la imparte
    FOREIGN KEY (ciclo) REFERENCES ciclos(siglas), -- Clave foránea del ciclo
    FOREIGN KEY (id_profesor) REFERENCES profesores(id) -- Clave foránea del id del profesor
) ENGINE=InnoDB;

CREATE OR REPLACE TABLE valoraciones (
    id INT AUTO_INCREMENT PRIMARY KEY, -- Clave principal de la valoración
    id_alumno INT, -- ID del alumno que realiza la valoración
    id_asignatura INT, -- ID de la asignatura (no hace falta indicar el profesor porque se relaciona con la asignatura)
    nota INT, -- Nota
    fecha DATETIME DEFAULT NOW(), -- Fecha en la que se realiza la valoración
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id), -- Clave foránea del alumno
    FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id) -- Clave foránea de la asignatura
) ENGINE=InnoDB;

-- PROCEDIMIENTOS ALMACENADOS

-- Asigna una asignatura a un profesor
DELIMITER $$
CREATE OR REPLACE PROCEDURE asignarProfesorAsignatura(profesorID INT, asignaturaID INT)
BEGIN
UPDATE asignaturas SET id_profesor=profesorID WHERE id=asignaturaID;
END $$
DELIMITER ;

-- Obtener todos los profesores
DELIMITER $$
CREATE OR REPLACE PROCEDURE obtenerProfesores(
    paramID INT,
    paramAsignaturas INT,
    paramConsiderarNulo BOOLEAN
)
BEGIN
SELECT id, nombre,
    (
        SELECT COUNT(*)
        FROM asignaturas a
        WHERE a.id_profesor=p.id
    ) as asignaturas,
    IFNULL(
        (
            SELECT AVG(nota)
            FROM valoraciones
            WHERE id_asignatura IN (
                SELECT id
                FROM asignaturas
                WHERE id_profesor = p.id
            )
        ), IF(paramConsiderarNulo, NULL, 0)
    ) as media
    FROM profesores p
    WHERE (paramID IS NULL OR id=paramID) HAVING
        (paramAsignaturas IS NULL OR asignaturas=paramAsignaturas);
END $$
DELIMITER ;

-- Obtener todas las valoraciones
DELIMITER $$
CREATE OR REPLACE PROCEDURE obtenerValoraciones(
    paramID INT,
    paramIDalumno INT,
    paramIDasignatura INT,
    paramIDprofesor INT,
    paramNota INT
)
BEGIN
SELECT v.id, id_alumno, id_asignatura, p.id as id_profesor,
    a.nombre as nombre_alumno,
    asi.nombre as nombre_asignatura,
    p.nombre as nombre_profesor,
    nota,
    fecha
FROM valoraciones v INNER JOIN alumnos a ON a.id = v.id_alumno
    INNER JOIN asignaturas asi ON asi.id = id_asignatura
    INNER JOIN profesores p ON p.id = id_profesor or p.id IS NULL
    WHERE (paramID IS NULL OR v.id=paramID) AND
        (paramIDalumno IS NULL OR id_alumno=paramIDalumno) AND
        (paramIDasignatura IS NULL OR id_asignatura=paramIDasignatura) AND
        (paramIDprofesor IS NULL OR id_profesor=paramIDprofesor) AND
        (paramNota IS NULL OR nota=paramNota);
END $$
DELIMITER ;

-- Obtener datos de los alumnos
DELIMITER $$
CREATE OR REPLACE PROCEDURE obtenerAlumnos(
    paramID INT,
    paramCiclo VARCHAR(50),
    paramValoracionesRealizadas INT
)
BEGIN
SELECT id, nombre, ciclo,
    (SELECT COUNT(*) FROM valoraciones WHERE id_alumno=a.id) as valoracionesRealizadas
FROM alumnos a WHERE (paramID IS NULL OR id = paramID) AND
    (paramCiclo IS NULL OR ciclo = paramCiclo) HAVING
    (paramValoracionesRealizadas IS NULL OR valoracionesRealizadas = paramValoracionesRealizadas);
END $$
DELIMITER ;

-- Obtener asignaturas
DELIMITER $$
CREATE OR REPLACE PROCEDURE obtenerAsignaturas(
    paramID INT,
    paramCiclo VARCHAR(50),
    paramIDprofesor INT
)
BEGIN
SELECT id, nombre, ciclo, id_profesor FROM asignaturas WHERE (paramID IS NULL OR id = paramID) AND
    (paramCiclo IS NULL OR ciclo = paramCiclo);
END $$
DELIMITER ;

-- Obtener información general
DELIMITER $$
CREATE OR REPLACE PROCEDURE obtenerDatosGenerales()
BEGIN
SELECT AVG(nota) as mediaTotal,
    (SELECT COUNT(*) FROM profesores) AS profesores,
    (SELECT COUNT(*) FROM alumnos) AS alumnos,
    (SELECT COUNT(*) FROM ciclos) AS ciclos,
    (SELECT COUNT(*) FROM asignaturas) AS asignaturas
FROM valoraciones;
END $$
DELIMITER ;