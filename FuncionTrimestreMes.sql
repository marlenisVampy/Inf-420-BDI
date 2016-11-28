/*que reciba numeros del 1 al 12, simulando los meses del anio 
y que la funcion diga en que trimestre 
del anio esta ese mes*/

CREATE TABLE TRIMESTRE
(
  MES INTEGER NOT NULL,
  Num_Trimestre INTEGER NOT NULL,
  CONSTRAINT pk_MES_TRIM PRIMARY KEY(MES,Num_Trimestre)
);

-------------------------------------------------
CREATE OR REPLACE FUNCTION MES_TRIMESTRE RETURN INTEGER AS

BEGIN
  DECLARE 
    TRIME TRIMESTRE.Num_Trimestre%TYPE;
    BEGIN 
     SELECT TRIMESTRE.Num_Trimestre
     INTO TRIME
      FROM TRIMESTRE
      WHERE TRIMESTRE.MES = 12 ;
  
  RETURN  TRIME;
  END;
END;
/
--FUNCIONA PARA UN DATO ESTABLECIDO YA
----------------------------------------------------

SELECT JL.MES_TRIMESTRE FROM DUAL;
----------------------------------
DROP TABLE TRIMESTRE;
DROP FUNCTION MES_TRIMESTRE1;
----------------------

SET SERVEROUTPUT ON;
----------------------------
/*AL INTRODUCIRLO POR TECLADO*/
-----------------------------------------------------------

CREATE OR REPLACE FUNCTION MES_TRIMESTRES RETURN INTEGER AS

BEGIN
  DECLARE 
    TRIME TRIMESTRE.Num_Trimestre%TYPE;
    P_MES TRIMESTRE.MES%TYPE:=&MESASK;
    BEGIN 
     SELECT TRIMESTRE.Num_Trimestre
     INTO TRIME
      FROM TRIMESTRE
      WHERE TRIMESTRE.MES = P_MES;
    RETURN  TRIME;
     END;
END;
/

SELECT JL.MES_TRIMESTRES FROM DUAL;
-----------------------------------------------------------