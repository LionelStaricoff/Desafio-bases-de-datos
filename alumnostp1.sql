CREATE DATABASE IF NOT EXISTS c22021
 DEFAULT CHARACTER SET UTF8 COLLATE UTF8_SPANISH_CI;


 CREATE TABLE alumnos (
     id INTEGER PRIMARY KEY AUTO_INCREMENT,
     nombre VARCHAR (40)  ,
     apellido VARCHAR (40) ,
     edad TINYINT (2),
     fecha TIMESTAMP ,
     provincia VARCHAR (30) 
 );


 SHOW TABLES;

 drop TABLE alumnos;

 drop DATABASE  c22021;
