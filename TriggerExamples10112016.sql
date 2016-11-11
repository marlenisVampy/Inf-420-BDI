CREATE TABLE VAMPY.EMPLEADO
(
  DNI VARCHAR2(9) PRIMARY KEY,
  NOMBRE VARCHAR2(80) NOT NULL,
  APELLIDOS VARCHAR2(80) NOT NULL,
  SUELDO DECIMAL(10,3) NOT NULL,
  SUPERDNI VARCHAR2(9),
  DNO NUMERIC NOT NULL  
);

ALTER TABLE VAMPY.EMPLEADO ADD CONSTRAINT FK_EMPL_D
FOREIGN KEY(DNO)
REFERENCES DEPARTAMENTO(NUMERODPTO);

ALTER TABLE VAMPY.EMPLEADO ADD CONSTRAINT FK_EMPL_Super
FOREIGN KEY(SUPERDNI)
REFERENCES EMPLEADO(DNI);
---------------------------------------------------
ALTER TABLE EMPLEADO
DROP CONSTRAINT FK_EMPLEADO_DEP;

ALTER TABLE EMPLEADO
DROP CONSTRAINT FK_EMPLEADO_DEP;
-------------------------------------------------

CREATE TABLE DEPARTAMENTO(
  NUMERODPTO NUMERIC PRIMARY KEY,
  NOMBREDPTO VARCHAR2(80) NOT NULL,
  DniDirector VARCHAR2(9)
  );
ALTER TABLE DEPARTAMENTO ADD CONSTRAINT FK_DEPT_DIR
FOREIGN KEY(DniDirector)
REFERENCES EMPLEADOS(DNI);

INSERT INTO VAMPY.EMPLEADO
(DNI, NOMBRE, APELLIDOS,SUELDO,DNO)
VALUES('100301097','Marlenis','Concepcion',2000.36,5);

INSERT INTO VAMPY.EMPLEADO
(DNI, NOMBRE, APELLIDOS,SUELDO,SuperDni,DNO)
VALUES('100347382','LISA','Concepcion',20259.36,'100301097',4);

INSERT INTO VAMPY.EMPLEADO
(DNI, NOMBRE, APELLIDOS,SUELDO,SuperDni,DNO)
VALUES('10000002','jUAN','ALMONTE',20000.00,'100301097',5);

INSERT INTO VAMPY.EMPLEADO
(DNI, NOMBRE, APELLIDOS,SUELDO,SuperDni,DNO)
VALUES('10000000','jUAN','Rodriguez',305958.00,'100301097',5);

INSERT INTO DEPARTAMENTO
(NUMERODPTO,NOMBREDPTO,DniDirector)
VALUES(5,'Investigacion',null);

INSERT INTO DEPARTAMENTO
(NUMERODPTO,NOMBREDPTO,DniDirector)
VALUES(4,'ADM',null);

---------------------------------------------------------------
/*TRIGGER para incrementar en un 10% el sueldo de los empleados 
asignados al departamento  5 */
-------------------------------------------------------------

CREATE OR REPLACE TRIGGER Empleado_aumento_dept
AFTER INSERT ON EMPLEADO
ENABLE
BEGIN
IF INSERTING THEN
UPDATE EMPLEADO
  SET EMPLEADO.SUELDO = EMPLEADO.SUELDO * 1.1
  WHERE DNO = 5;
  END IF;
END;
/
--------------------------------------------
/*Como omitimos FOR EACH ROW, por defecto est� FOR EACH STATEMENT
**SOLO SE ACTIVA UNA SOLA VEZ*/

drop table VAMPY.EMPLEADO;
drop table DEPARTAMENTO;

SELECT * FROM VAMPY.DEPARTAMENTO;
DROP TRIGGER Empleado_aumento_dept;
SELECT * FROM VAMPY.EMPLEADO;