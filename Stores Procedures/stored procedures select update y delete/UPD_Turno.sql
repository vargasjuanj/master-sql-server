
--Actualiza turno

/*
EXEC UPD_Turno 8,1,'eL paciente llamo para cancelar el turno'
*/
/* -- TABLAS AFECTADAS
SELECT * FROM turno -- para actualizar la fecha hay que asegurarse de que no exista, igual depende de la logica de negocio y el turno no lo podemos otorgar al paciente, la cosa sería eliminar el turno y asignar otro
SELECT * FROM turno_paciente
*/

-- Se actualizan todos los campos o uno de ellos
ALTER PROC UPD_Turno (
			@idTurno turno,
			@estado tinyint,
			@observacion observacion
			)

AS

SET NOCOUNT ON

IF EXISTS (SELECT * FROM turno WHERE idTurno = @idTurno)
	UPDATE turno SET estado = @estado, observacion = @observacion 
	WHERE idturno = @idTurno
ELSE
	SELECT 0 AS resultado	
