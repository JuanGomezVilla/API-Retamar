-- AQUÍ SE ENCUENTRAN LOS VALORES POR DEFECTO QUE SON EXISTENTES EN RETAMAR
USE RetamarValoracionesFP;

-- Por protección de datos, los profesores se configuran el archivo '3. Valores de prueba.sql'

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

-- ASIGNATURAS EXISTENTES (los profesores son asignados en el archivo siguiente)
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