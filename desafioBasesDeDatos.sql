CREATE DATABASE IF NOT EXISTS Empresa
 DEFAULT CHARACTER SET UTF8 COLLATE UTF8_SPANISH_CI;

CREATE TABLE empleados (
     id INTEGER PRIMARY KEY AUTO_INCREMENT,
     dni TINYINT (10),
     nombre VARCHAR (40),
     apellido VARCHAR (40),
     id_departamentos INTEGER,
     FOREIGN KEY (id_departamentos) REFERENCES departamentos (id)
);
  
  

 CREATE TABLE departamentos (
     id INTEGER PRIMARY KEY,
     nombre_departamento VARCHAR (40),
     presupuesto INTEGER
     );

    
     INSERT INTO empleados (dni, nombre, apellido, id_departamentos)
     VALUES (31096678, "Juan", "Lopez", 14),
      (31096675, "Martin", "Zarabia", 77), 
      (34269854, "Jose", "Velez", 77),
      (41369852, "Paula", "Madariaga", 77),
      (33698521, "Pedro", "Perez", 14),
      (32698547, "Mariana", "Lopez", 15),
      (42369854, "Abril", "Sanchez", 37),
      (36125896, "Martin", "Julia", 14),
      (36985471, "Omar", "Diaz", 15),
      (32145698, "Guadalupe", "Perez", 77),
      (32369854, "Bernardo", "Pantera", 37),
      (36125965, "Lucia", "Pesaro", 14),
      (31236985, "Maria", "Diamante", 14),
      (32698547, "Carmen", "Barbieri", 16);

SELECT * FROM empleados;
SELECT * FROM departamentos;
SHOW  TABLES;
DROP TABLE departamentos;
DROP TABLE empleados;

     INSERT INTO Empresa.departamentos (id, nombre_departamento, presupuesto)
     VALUES (14, "Informática", 80000),
     (77, "Investigación", 40000),
     (15, "Gestión", 95000),
     (37, "Desarrollo", 65000),
     (16, "Comunicación", 75000);


     //consultas:
     //2.1 obtener los apellidos de los empleados:

     SELECT apellido FROM empleados;

     //2.2 obtener los apellidos de los empleados sin repeticiones:
     SELECT apellido FROM empleados GROUP BY apellido;

     //2.3 obtener los datos de los impleados que tengan el apellido Lopez:
     SELECT * FROM empleados WHERE apellido LIKE "Lopez";

    //2.4 obtener los datos de los impleados que tengan el apellido Lopez y apellido Perez:
    SELECT * FROM empleados WHERE apellido LIKE "Lopez" OR apellido LIKE "Perez";

    //2.5 obtener todos los datos de los empleados que trabajan en el departamento 14
     SELECT * FROM empleados WHERE id_departamentos =14;
    
    //2.6 obtener todos los datos de los empleados que trabajan en el departamento 37 y 77
    SELECT * FROM empleados WHERE id_departamentos IN (37, 77);

    //2.7 obtener todos los datos de los empleados cuyo apellido comience con p
    SELECT * FROM empleados WHERE apellido LIKE 'p%';

    //2.8 obtener el presupuesto total de todos los departamentos
     SELECT SUM (presupuesto) AS TotalSumaPresupuesto FROM Empresa.departamentos;

    //2.9 obtener un listado completo de empleados, incluyendo por cada empleado 
    // los datos del empleado y su departamento
    SELECT empleados.nombre, empleados.apellido, empleados.dni, em.nombre_departamento 
    FROM Empresa.empleados JOIN  Empresa.departamentos AS em
    ON empleados.id_departamentos = em.id;


    //2.10 obtener un listado completo de empleados, incluyendo nombre y apellido del 
    // empleado junto al nombre y presupuesto de su departamento.
    SELECT empleados.nombre, empleados.apellido, em.nombre_departamento, em.presupuesto 
    FROM Empresa.empleados INNER JOIN  Empresa.departamentos AS em
    ON empleados.id_departamentos = em.id;


    //2.11 obtener los nombres y apellidos de los empleados que trabajen en departamentos
    // cuyo presupuesto sea mayor que 60.000
    SELECT empleados.nombre, empleados.apellido
    FROM Empresa.empleados INNER JOIN  Empresa.departamentos AS em
    ON empleados.id_departamentos = em.id
    WHERE em.presupuesto >60000;


    //2.12 añadir un nuevo departamento: Calidad con un presupuesto de 40.000 y codigo 11
    // añadir un empleado vinculado al departamento recien creado: Esther Vazquez, 
    // DNI 89267109

    INSERT INTO Empresa.departamentos VALUES (11, "calidad", 40000);


    INSERT INTO Empresa.empleados (dni, nombre, apellido, id_departamentos) 
    VALUES (89267109, "Esther", "Vazquez", 11);


    //2.13 aplicar un recorte presupuestario de 10% a todos los departamentos
    UPDATE Empresa.departamentos AS em
    SET em.presupuesto = (em.presupuesto*0.9);


    //2.14 reasignar a los empleados del departamento de Investigación 77 al 14
    UPDATE Empresa.empleados AS ee 
    SET ee.id_departamentos =14 WHERE ee.id_departamentos = 77;



    //2.15 Despedir a los empleados del departamento 14 Informática
     DELETE FROM empleados  WHERE id_departamentos = 14;

    //2.16 Despedir a los empleados que trabajen en departamentos con un 
    // presupuesto superior a 90.000
    DELETE FROM empleados  WHERE id_departamentos IN 
    (SELECT id_departamentos FROM departamentos WHERE presupuesto>90000);

// verificacion de que ya no esten;
   SELECT empleados.nombre, empleados.apellido, em.presupuesto
    FROM Empresa.empleados INNER JOIN  Empresa.departamentos AS em
    ON empleados.id_departamentos = em.id
    WHERE em.presupuesto >60000;