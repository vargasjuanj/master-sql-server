
-- CLAUSULA WHERE

SELECT * FROM paciente WHERE nombre = 'Claudio' AND apellido = 'Lopez'

--En el caso del delete y update la logica del where es la misma

DELETE FROM paciente WHERE nombre = 'Claudio' AND apellido = 'Lopez'


SELECT * FROM paciente

UPDATE paciente SET observacion = 'Observación modificada' WHERE idPaciente = 1


-- CLAUSULA TOP : Permite seleccionar un limite de registros

SELECT TOP 2 * FROM paciente WHERE apellido = 'Perez' 
--con la clausula TOP sola, trae los primeros registros es decir los más viejos, pero con order by desc trae cierta cantidad de los ultimos
SELECT TOP 1 * FROM turno ORDER BY fechaTurno DESC -- trael el ultimo registro 



-- CLAUSULA ORDER BY: Trae un conjunto de registros ordenados por un campo especifico

SELECT * FROM paciente ORDER BY fNacimiento   -- Por default lo ordena de forma Ascendente


-- CLAUSULA DISTINCT : Agrupa todos los registros con valores distintos

SELECT DISTINCT apellido FROM paciente -- Aca muestra todos los apellidos distintos

/*Aca mandan los ids distintos, por eso se repito el apellido, porque los ids son distintos
	No importa en la posición que se coloquen los campos, mientras uno de esos campos tenga valores distintos va a priorizar ese campo, y los demas se repetiran o no

*/

SELECT DISTINCT apellido FROM paciente

SELECT DISTINCT idPaciente, apellido FROM paciente 

SELECT DISTINCT apellido, idPaciente FROM paciente



-- CLAUSULA GROUP BY: El resultado es igual a DISTINCT, solo que cambia la sintaxis, se le pueden agregar funciones y tiene mayor perfonmance

--SELECT * FROM paciente GROUP BY apellido -- asi no funciona porque la columna resultante debe ser solo la de apellido, y con el * estamos indicando que le haga group by a todos los campos, por eso no es logico

SELECT apellido FROM paciente GROUP BY apellido