
/*
Se diferencia de una tabla en memoria en que la fisica va a existir en la bd hasta que reiniciemos el servicio de base de datos
Mientras el motor de sql se este ejecutando va a existir, pero cuando reiniciemos, o paremos el motor de sql se va a destruir
*/

-- con el numeral # delante indicamos que es fisica
-- siempre es conveniente que despues de usarla se recomienda eliminarla para liberar espacio, memoria
CREATE TABLE #temporal  ( id bigint IDENTITY(1,1), nombre VARCHAR(50), apellido VARCHAR(50))

INSERT INTO #temporal VALUES ('Alejandro','Lopez')
INSERT INTO #temporal VALUES ('Rafael','Castillo')
INSERT INTO #temporal VALUES ('Fernando','Gonzalez')

SELECT * FROM #temporal

DROP TABLE #temporal
