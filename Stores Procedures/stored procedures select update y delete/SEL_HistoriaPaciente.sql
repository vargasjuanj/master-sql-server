/*
Obtener la historia clinica de un paciente en particular

*/

-- Ejecutamos, esto debe mantenerse comentado sino el store no se guarda o modifica bn
--EXEC SEL_HistoriaPaciente 6

-- Comienza con SEL para que no se confunca con el SELECT

ALTER PROC SEL_HistoriaPaciente (
				@idPaciente paciente
			)
AS

SET NOCOUNT ON

-- es para tener una vista previa de que datos hay y hacer los dos selects de una vez
--SELECT * FROM historia
--SELECT * FROM historia_paciente

IF EXISTS (
		SELECT * FROM paciente p
		INNER JOIN historia_paciente hp
		ON hp.idPaciente = p.idPaciente
		INNER JOIN historia h
		ON h.idHistoria = hp.idHistoria -- hasta acá se podria dejar, pero debemos también colocar los datos de medicos por eso hacemos  con los siguientes JOINS
		INNER JOIN medico m
		ON m.idMedico = hp.idMedico AND m.apellido = p.apellido -- En este caso además de ser el medico que lo atendió, el medico debe tener el mismo apellido que el paciente
		INNER JOIN medico_especialidad me
		ON me.idMedico = m.idMedico
		WHERE p.idPaciente = @idPaciente  -- Si hubiesen mas de 1 registro que hubiera coinicido con las lineas anteriores y solo necesatamos un id, con este descartamos los demas registros
		)
	SELECT * FROM paciente p
	INNER JOIN historia_paciente hp
	ON hp.idPaciente = p.idPaciente
	INNER JOIN historia h
	ON h.idHistoria = hp.idHistoria -- hasta acá se podria dejar, pero debemos también colocar los datos de medicos por eso hacemos  con los siguientes JOINS
	INNER JOIN medico m
	ON m.idMedico = hp.idMedico AND m.apellido = p.apellido -- En este caso además de ser el medico que lo atendió, el medico debe tener el mismo apellido que el paciente
	INNER JOIN medico_especialidad me
	ON me.idMedico = m.idMedico
	WHERE p.idPaciente = @idPaciente  -- Si hubiesen mas de 1 registro que hubiera coinicido con las lineas anteriores y solo necesatamos un id, con este descartamos los demas registros

ELSE
	-- puedo usar el print para mostrar por interface o puedo usar un select de resultado en el caso de que no se haya hallado nada
	-- PRINT 'El paciente no tiene historia clinica'
	SELECT 0 as resultado -- campo resultado, con valor 0