
/*
Con este stored procedure obtengo los turnos de un paciente
*/
-- Obtener resultado correspondiente a los turnos del paciente con cierto id
--EXEC SELECT_TurnoPaciente 1

ALTER PROC SELECT_TurnoPaciente(
			@idPaciente paciente

)
AS
SET NOCOUNT ON -- para que no realice la cuenta de registros y si traiga el resultado de la consulta

-- Podemos usar tantos JOINS como necesitemos, no tenemos limitación y siempre evitar las repeticiones, no estar haciendo un JOIN repetido
-- No se puede usar un alias que aun no se ha creado, es decir para usar un alias en una consulta, ese alias debe estar mas arriba. Por eso es importante el orden como se pongan los INNER en la consulta

-- como la tabla paciente depende de estas dos tablas turno y turno_paciente la voy a colocar como tabla principal en el select 
--AND tp.idPaciente = p.idPaciente--@idPaciente lo que tenemos q tener en cuenta que los campos sean igualados por otro campo y no por una variable


-- Se van concatenando los resultados, es decir con el primer JOIN se crea una tabla y esa tabla hace un JOIN con otra. Ahi se crea otra tabla mas grande y asi sucesivamente. 
-- y cuando se creó la tabla formada por todos esos JOINS se hace un filtro con la condición del WHERE sobre los registros de esa tabla creada

-- Cruzo los registros que tengan relacion entre paciente y turno paciente (idPaciente). Despues esa tabla la cruzo con la tabla turno para obtener los datos de esos turnos de turno_paciente. 
	-- Luego los idMedico de esa tabla turno se cruzan con lo de especialidad Medico. Y finalmente se obtienen los turnos de un paciente en base a su id
IF EXISTS(SELECT * FROM paciente P -- se pone primero porque es la tabla sobre la que queremos obtener datos, la principal
				INNER JOIN turno_paciente tp
				ON tp.idPaciente = p.idPaciente
				INNER JOIN turno t
				ON t.idTurno = tp.idTurno
				INNER JOIN medico_especialidad me
				ON me.idMedico = tp.idMedico
				WHERE p.idPaciente = @idPaciente
			)

	SELECT * FROM paciente P
					INNER JOIN turno_paciente tp
					ON tp.idPaciente = p.idPaciente
					INNER JOIN turno t
					ON t.idTurno = tp.idTurno
					INNER JOIN medico_especialidad me
					ON me.idMedico = tp.idMedico
					WHERE p.idPaciente = @idPaciente
ELSE
	SELECT 0 as resultado