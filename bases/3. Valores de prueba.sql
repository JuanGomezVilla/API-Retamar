-- MODIFICAR EL SIGUIENTE ARCHIVO CON VALORES REALES
-- PASOS:
-- 1. Dar nombres a los profesores, e insertar dichos valores en la tabla (copiar y pegar)
-- 2. Utilizar el id y la asignatura para asignar valores a los profesores
USE RetamarValoracionesFP;

-- PROFESORES DE PRUEBA
INSERT INTO profesores (nombre) VALUES ("Profesor 1"); -- id 1
INSERT INTO profesores (nombre) VALUES ("Profesor 2"); -- id 2
INSERT INTO profesores (nombre) VALUES ("Profesor 3"); -- id 3
INSERT INTO profesores (nombre) VALUES ("Profesor 4"); -- id 4
INSERT INTO profesores (nombre) VALUES ("Profesor 5"); -- id 5
INSERT INTO profesores (nombre) VALUES ("Profesor 6"); -- id 6
INSERT INTO profesores (nombre) VALUES ("Profesor 7"); -- id 7
INSERT INTO profesores (nombre) VALUES ("Profesor 8"); -- id 8
INSERT INTO profesores (nombre) VALUES ("Profesor 9"); -- id 9

-- ASIGNACIÓN DE ASIGNATURAS (id profesor, id asignatura)
CALL asignarProfesorAsignatura(1, 1); -- Comunicación y atención al cliente (AF1)
CALL asignarProfesorAsignatura(2, 2); -- Gestión de la documentación jurídica y empresarial (AF1)
CALL asignarProfesorAsignatura(3, 3); -- Inglés (AF1)
CALL asignarProfesorAsignatura(4, 4); -- Ofimática y proceso de la información (AF1)
CALL asignarProfesorAsignatura(5, 5); -- Proceso integral de la actividad comercial (AF1)
CALL asignarProfesorAsignatura(6, 6); -- Recursos humanos y responsabilidad social corporativa (AF1)

CALL asignarProfesorAsignatura(7, 7); -- Contabilidad y fiscalidad (AF2)
CALL asignarProfesorAsignatura(8, 8); -- Formación y orientación laboral (AF2)
CALL asignarProfesorAsignatura(9, 9); -- Gestión de recursos humanos (AF2)
CALL asignarProfesorAsignatura(1, 10); -- Gestión financiera (AF2)
CALL asignarProfesorAsignatura(2, 11); -- Gestión logística y comercial (AF2)
CALL asignarProfesorAsignatura(3, 12); -- Simulación empresarial (AF2)

CALL asignarProfesorAsignatura(4, 13); -- Formación y orientación laboral (ASIR1)
CALL asignarProfesorAsignatura(5, 14); -- Fundamentos de hardware (ASIR1)
CALL asignarProfesorAsignatura(6, 15); -- Gestión de bases de datos (ASIR1)
CALL asignarProfesorAsignatura(7, 16); -- Implantación de sistemas operativos (ASIR1)
CALL asignarProfesorAsignatura(8, 17); -- Lenguajes de marcas y sistemas de gestión de información (ASIR1)
CALL asignarProfesorAsignatura(9, 18); -- Planificación y administración de redes (ASIR1)

CALL asignarProfesorAsignatura(1, 19); -- Administración de sistemas gestores de bases de datos (ASIR2)
CALL asignarProfesorAsignatura(2, 20); -- Administración de sistemas operativos (ASIR2)
CALL asignarProfesorAsignatura(3, 21); -- Empresa e iniciativa emprendedora (ASIR2)
CALL asignarProfesorAsignatura(4, 22); -- Implantación de aplicaciones web (ASIR2)
CALL asignarProfesorAsignatura(5, 23); -- Inglés técnico para grado superior (ASIR2)
CALL asignarProfesorAsignatura(6, 24); -- Seguridad y alta disponibilidad (ASIR2)
CALL asignarProfesorAsignatura(7, 25); -- Servicios de red e internet (ASIR2)

CALL asignarProfesorAsignatura(8, 26); -- Bases de datos (DAM1)
CALL asignarProfesorAsignatura(9, 27); -- Entornos de desarrollo (DAM1)
CALL asignarProfesorAsignatura(1, 28); -- Formación y orientación laboral (DAM1)
CALL asignarProfesorAsignatura(2, 29); -- Lenguaje de marcas y sistemas de gestión de información (DAM1)
CALL asignarProfesorAsignatura(3, 30); -- Programación (DAM1)
CALL asignarProfesorAsignatura(4, 31); -- Sistemas informáticos (DAM1)

CALL asignarProfesorAsignatura(5, 32); -- Acesso a datos (DAM2)
CALL asignarProfesorAsignatura(6, 33); -- Desarrollo de interfaces (DAM2)
CALL asignarProfesorAsignatura(7, 34); -- Empresa e iniciativa emprendedora (DAM2)
CALL asignarProfesorAsignatura(8, 35); -- Inglés técnico para grado superior (DAM2)
CALL asignarProfesorAsignatura(9, 36); -- Programación de servicios y procesos (DAM2)
CALL asignarProfesorAsignatura(1, 37); -- Programación multimedia y dispositivos móviles (DAM2)
CALL asignarProfesorAsignatura(2, 38); -- Sistemas de gestión empresarial (DAM2)

CALL asignarProfesorAsignatura(3, 39); -- Comunicación empresarial y atención al cliente (GA1)
CALL asignarProfesorAsignatura(4, 40); -- Empresa y administración (GA1)
CALL asignarProfesorAsignatura(5, 41); -- Formación y orientación laboral (GA1)
CALL asignarProfesorAsignatura(6, 42); -- Operaciones administrativas de la compra-venta (GA1)
CALL asignarProfesorAsignatura(7, 43); -- Inglés (GA1)
CALL asignarProfesorAsignatura(8, 44); -- Técnica contable (GA1)
CALL asignarProfesorAsignatura(9, 45); -- Tratamiento informático de la información (GA1)

CALL asignarProfesorAsignatura(1, 46); -- Empresa en el aula (GA2)
CALL asignarProfesorAsignatura(2, 47); -- Operaciones auxiliares de gestión de tesorería (GA2)
CALL asignarProfesorAsignatura(3, 48); -- Operaciones administrativas de recursos humanos (GA2)
CALL asignarProfesorAsignatura(4, 49); -- Tratamiento de la documentación contable (GA2)

CALL asignarProfesorAsignatura(5, 50); -- Aplicaciones ofimáticas (SMR1)
CALL asignarProfesorAsignatura(6, 51); -- Formación y orientación laboral (SMR1)
CALL asignarProfesorAsignatura(7, 52); -- Montaje y mantenimiento de equipos (SMR1)
CALL asignarProfesorAsignatura(8, 53); -- Redes locales (SMR1)
CALL asignarProfesorAsignatura(9, 54); -- Sistemas operativos monopuesto (SMR1)

CALL asignarProfesorAsignatura(1, 55); -- Aplicaciones web (SMR2)
CALL asignarProfesorAsignatura(2, 56); -- Empresa e iniciativa emprendedora (SMR2)
CALL asignarProfesorAsignatura(3, 57); -- Inglés técnico para grado medio (SMR2)
CALL asignarProfesorAsignatura(4, 58); -- Seguridad informática (SMR2)
CALL asignarProfesorAsignatura(5, 59); -- Servicios en red (SMR2)
CALL asignarProfesorAsignatura(6, 60); -- Sistemas operativos en red (SMR2)

-- ALUMNOS DE PRUEBA
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

-- VALORACIONES
INSERT INTO valoraciones (id_alumno, id_asignatura, nota) VALUES (1, 1, 4);
INSERT INTO valoraciones (id_alumno, id_asignatura, nota) VALUES (2, 1, 4);
INSERT INTO valoraciones (id_alumno, id_asignatura, nota) VALUES (3, 1, 3);
INSERT INTO valoraciones (id_alumno, id_asignatura, nota) VALUES (4, 2, 2);
INSERT INTO valoraciones (id_alumno, id_asignatura, nota) VALUES (5, 2, 4);
INSERT INTO valoraciones (id_alumno, id_asignatura, nota) VALUES (3, 1, 2);
INSERT INTO valoraciones (id_alumno, id_asignatura, nota) VALUES (3, 35, 2);