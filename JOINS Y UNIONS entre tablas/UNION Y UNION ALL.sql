
/*
La diferencia principal entre la clausula UNION y la INNER, es que la UNION nos permite
unir dos resultados de dos consultas diferentes.
La inner Join nos permite conectar una tabla con otra, preferentemente conectarlas por las primary ke. Obteniendo el total de campo de una tabla sumado al total de campos de otra

En este caso con UNION podemos obtener dos consultas diferentes con la misma cantidad de campos 

Lo que requiere el UNION es que los campos que se quieren unir se pongan la misma cantidad de un lado y sean del mismo tipo de dato
Es decir que podriamos unir el idTurno de la tabla turno con el idPaciente de la tabla paciente

UNION: Se unen las dos consultas devolviendo filas unicas sin repetición
UNION ALL: Devuelve todas las filas, incluido las repetidas
INTERSECT : Devuelve filas que cumplan los dos selects a la vez
EXCEPT: Devuelve Filas que solo cumplan el primer SELECT, y si algunos registros Tambien cumplen la condición del segundo SELECT también los descarta
*/

SELECT * FROM turno

-- aca devuelve lo mismo que SELECT * FROM turno
SELECT * FROM turno 
UNION
SELECT * FROM turno

-- resultados donde estado = 3 y resultado = 1
-- acá funciona porque las tablas son iguales y los campos son los mismos
SELECT * FROM turno WHERE estado = 3
UNION
SELECT * FROM turno where estado = 1


-- Esto da este error: Todas las consultas combinadas que usan un operador UNION, INTERSECT o EXCEPT deben tener el mismo número de expresiones en sus listas de destino.

SELECT * FROM turno WHERE estado = 3
UNION
SELECT * FROM paciente


-- Aca funciona porque son la misma cantidad de campos y tienen el mismo tipo de dato

select idTurno from turno
select idPaciente from paciente
--SELECT estado  idTurno FROM turno WHERE estado = 2  --??

SELECT idTurno FROM turno WHERE estado = 2 
UNION
SELECT idPaciente FROM paciente