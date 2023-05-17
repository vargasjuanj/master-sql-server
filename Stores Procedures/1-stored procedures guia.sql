
/*
Es un conjunto de instrucciones sql que está almacenado. 
Es decir está almacenado internamente en el sql, pero también se puede almacenar en un archivo

Estan diseñados para ejecutar una o un conjunto de instrucciones concretas

Por lo general se usa para un insercción, eliminación o actualización de registros, tambien se usan selects

Cuando termino de ejecutar el Stored, lo ejecuto y nos vamos a la carpeta programability y ahi va a Stored Procedures
*/

--crearlo
-- se puede colocar PROCEDURE también pero es más practico poner PROC

CREATE PROC S_pacientes (   -- recibe parametros de entradas, que son los datos a procesar
			@idPaciente int -- tipo de dato que ya estaba definido
)
AS

SELECT * FROM paciente WHERE idPaciente = @idPaciente

GO

/*
 -- con el GO termina la instrucción, lo que decimos es que cualquier instrucción que haya por debajo la va a ejecutar como separada, por ejemplo otro Stored Procedures que haya abajo
SET ANSI_NULLS OFF
--Por defecto esta sentencia no va a devolver nada, por mas que el campo domicilio del registro este en NULL, por eso poniendo OFF, en la linea de arriba, si va devolver los registros
SELECT * FROM paciente WHERE domicilio = NULL

SET QUOTED_IDENTIFIER ON -- con esto en off me permite crear tablas con nombres reservados
CREATE TABLE "select" (
campo1 varchar(50)
-- SI puede significar un stored que inserta datos
/*CREATE PROC SI_ejemplo2 (
)*/


*/



-- Ejecutar un el Stored

EXEC S_pacientes 3 -- 3 es el valor que recibe