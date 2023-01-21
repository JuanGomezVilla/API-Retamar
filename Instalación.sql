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
    nota1 INT, -- Nota 1
    nota2 INT, -- Nota 2
    nota3 INT, -- Nota 3
    fecha DATETIME DEFAULT NOW(), -- Fecha en la que se realiza la valoración
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id), -- Clave foránea del alumno
    FOREIGN KEY (id_asignatura) REFERENCES asignaturas(id) -- Clave foránea de la asignatura
) ENGINE=InnoDB;

-- VALORES POR DEFECTO

-- DATOS DE LOS CICLOS
INSERT INTO ciclos VALUES ("DAM1", "Desarrollo de Aplicaciones Multiplataforma", 1, "CFGS");
INSERT INTO ciclos VALUES ("DAM2", "Desarrollo de Aplicaciones Multiplataforma", 2, "CFGS");
INSERT INTO ciclos VALUES ("ASIR1", "Administración de Sistemas Informáticos en Red", 1, "CFGS");
INSERT INTO ciclos VALUES ("ASIR2", "Administración de Sistemas Informáticos en Red", 2, "CFGS");
INSERT INTO ciclos VALUES ("AF1", "Administración y Finanzas", 1, "CFGS");
INSERT INTO ciclos VALUES ("AF2", "Administración y Finanzas", 2, "CFGS");
INSERT INTO ciclos VALUES ("GA1", "Gestión Administrativa con Informática", 1, "CFGM");
INSERT INTO ciclos VALUES ("GA2", "Gestión Administrativa con Informática", 2, "CFGM");
INSERT INTO ciclos VALUES ("SMR1", "Sistemas Microinformáticos y Redes", 1, "CFGM");
INSERT INTO ciclos VALUES ("SMR2", "Sistemas Microinformáticos y Redes", 2, "CFGM");

-- PROFESORES
INSERT INTO profesores (nombre) VALUES ("Gonzalo Moreno");
INSERT INTO profesores (nombre) VALUES ("Javier Muñoz");
INSERT INTO profesores (nombre) VALUES ("Iñaki Navarro");
INSERT INTO profesores (nombre) VALUES ("Antonio de Isidro");
INSERT INTO profesores (nombre) VALUES ("Carlos Sánchez");
INSERT INTO profesores (nombre) VALUES ("Borja Martín");
INSERT INTO profesores (nombre) VALUES ("Manuel Pérez");
INSERT INTO profesores (nombre) VALUES ("Numilen Joost");
INSERT INTO profesores (nombre) VALUES ("Susana");
INSERT INTO profesores (nombre) VALUES ("Ignacio López");
INSERT INTO profesores (nombre) VALUES ("Ciro Medina");
INSERT INTO profesores (nombre) VALUES ("Fernando Sánchez");
INSERT INTO profesores (nombre) VALUES ("Isabel");
INSERT INTO profesores (nombre) VALUES ("Pedro");
INSERT INTO profesores (nombre) VALUES ("Jose Ramón Fraga");
INSERT INTO profesores (nombre) VALUES ("Alberto Fernández");
INSERT INTO profesores (nombre) VALUES ("Agustín Rivero");

-- ASIGNATURAS EXISTENTES
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Comunicación y atención al cliente", "AF1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Gestión de la documentación jurídica y empresarial", "AF1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Inglés", "AF1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Ofimática y proceso de la información", "AF1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Proceso integral de la actividad comercial", "AF1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Recursos humanos y responsabilidad social corporativa", "AF1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Contabilidad y fiscalidad", "AF2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Formación y orientación laboral", "AF2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Gestión de recursos humanos", "AF2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Gestión financiera", "AF2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Gestión logística y comercial", "AF2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Simulación empresarial", "AF2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Formación y orientación laboral", "ASIR1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Fundamentos de hardware", "ASIR1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Gestión de bases de datos", "ASIR1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Implantación de sistemas operativos", "ASIR1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Lenguajes de marcas y sistemas de gestión de información", "ASIR1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Planificación y administración de redes", "ASIR1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Administración de sistemas gestores de bases de datos", "ASIR2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Administración de sistemas operativos", "ASIR2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Empresa e iniciativa emprendedora", "ASIR2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Implantación de aplicaciones web", "ASIR2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Inglés técnico para grado superior", "ASIR2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Seguridad y alta disponibilidad", "ASIR2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Servicios de red e internet", "ASIR2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Bases de datos", "DAM1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Entornos de desarrollo", "DAM1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Formación y orientación laboral", "DAM1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Lenguaje de marcas y sistemas de gestión de información", "DAM1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Programación", "DAM1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Sistemas informáticos", "DAM1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Acesso a datos", "DAM2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Desarrollo de interfaces", "DAM2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Empresa e iniciativa emprendedora", "DAM2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Inglés técnico para grado superior", "DAM2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Programación de servicios y procesos", "DAM2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Programación multimedia y dispositivos móviles", "DAM2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Sistemas de gestión empresarial", "DAM2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Comunicación empresarial y atención al cliente", "GA1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Empresa y administración", "GA1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Formación y orientación laboral", "GA1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Operaciones administrativas de la compra-venta", "GA1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Inglés", "GA1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Técnica contable", "GA1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Tratamiento informático de la información", "GA1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Empresa en el aula", "GA2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Operaciones auxiliares de gestión de tesorería", "GA2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Operaciones administrativas de recursos humanos", "GA2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Tratamiento de la documentación contable", "GA2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Aplicaciones ofimáticas", "SMR1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Formación y orientación laboral", "SMR1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Montaje y mantenimiento de equipos", "SMR1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Redes locales", "SMR1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Sistemas operativos monopuesto", "SMR1", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Aplicaciones web", "SMR2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Empresa e iniciativa emprendedora", "SMR2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Inglés técnico para grado medio", "SMR2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Seguridad informática", "SMR2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Servicios en red", "SMR2", NULL);
INSERT INTO asignaturas (nombre, ciclo, id_profesor) VALUES ("Sistemas operativos en red", "SMR2", NULL);

-- VALORES POR DEFECTO
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 1", "DAM1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 2", "DAM1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 3", "DAM1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 4", "DAM1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 5", "DAM1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 6", "DAM2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 7", "DAM2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 8", "DAM2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 9", "DAM2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 10", "DAM2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 11", "ASIR1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 12", "ASIR1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 13", "ASIR1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 14", "ASIR1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 15", "ASIR1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 16", "ASIR2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 17", "ASIR2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 18", "ASIR2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 19", "ASIR2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 20", "ASIR2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 21", "AF1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 22", "AF1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 23", "AF1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 24", "AF1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 25", "AF1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 26", "AF2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 27", "AF2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 28", "AF2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 29", "AF2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 30", "AF2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 31", "GA1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 32", "GA1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 33", "GA1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 34", "GA1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 35", "GA1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 36", "GA2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 37", "GA2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 38", "GA2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 39", "GA2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 40", "GA2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 41", "SMR1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 42", "SMR1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 43", "SMR1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 44", "SMR1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 45", "SMR1");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 46", "SMR2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 47", "SMR2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 48", "SMR2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 49", "SMR2");
INSERT INTO alumnos (nombre, ciclo) VALUES ("Persona 50", "SMR2");

INSERT INTO valoraciones (id_alumno, id_asignatura, nota1, nota2, nota3) VALUES (1, 1, 2, 1, 4);
INSERT INTO valoraciones (id_alumno, id_asignatura, nota1, nota2, nota3) VALUES (2, 1, 1, 3, 4);
INSERT INTO valoraciones (id_alumno, id_asignatura, nota1, nota2, nota3) VALUES (3, 1, 5, 2, 3);
INSERT INTO valoraciones (id_alumno, id_asignatura, nota1, nota2, nota3) VALUES (4, 2, 4, 2, 2);
INSERT INTO valoraciones (id_alumno, id_asignatura, nota1, nota2, nota3) VALUES (5, 2, 3, 3, 4);
INSERT INTO valoraciones (id_alumno, id_asignatura, nota1, nota2, nota3) VALUES (3, 1, 4, 3, 2);
INSERT INTO valoraciones (id_alumno, id_asignatura, nota1, nota2, nota3) VALUES (3, 35, 4, 3, 2);

-- PROCEDIMIENTOS ALMACENADOS

-- Asigna a un profesor una asignatura
DELIMITER $$
CREATE OR REPLACE PROCEDURE asignarProfesorAsignatura(profesorID INT, asignaturaID INT)
BEGIN
UPDATE asignaturas SET id_profesor=profesorID WHERE id=asignaturaID;
END $$
DELIMITER ;

-- Obtener todas las valoraciones
DELIMITER $$
CREATE OR REPLACE PROCEDURE obtenerValoraciones(
    paramID INT,
    paramIDalumno INT,
    paramIDasignatura INT,
    paramIDprofesor INT
)
BEGIN
SELECT v.id, id_alumno, id_asignatura, p.id as id_profesor,
    a.nombre as nombre_alumno,
    asi.nombre as nombre_asignatura,
    p.nombre as nombre_profesor,
    nota1,
    nota2,
    nota3,
    (nota1 + nota2 + nota3)/3 AS media
FROM valoraciones v INNER JOIN alumnos a ON a.id = v.id_alumno
    INNER JOIN asignaturas asi ON asi.id = id_asignatura
    INNER JOIN profesores p ON p.id = id_profesor or p.id IS NULL
    WHERE (paramID IS NULL OR v.id=paramID) AND
        (paramIDalumno IS NULL OR id_alumno=paramIDalumno) AND
        (paramIDasignatura IS NULL OR id_asignatura=paramIDasignatura) AND
        (paramIDprofesor IS NULL OR id_profesor=paramIDprofesor);
END $$
DELIMITER ;

-- Retirar una columna
UPDATE asignaturas SET id_profesor=NULL WHERE id_profesor=13;

-- CALL asignarProfesorAsignatura(13, 35)

-- RESULTADO FINAL
SELECT * FROM ciclos;
SELECT * FROM profesores;
SELECT * FROM asignaturas;
SELECT * FROM alumnos;

-- FINALIZADO


