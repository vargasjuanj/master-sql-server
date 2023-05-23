
--SELECT * FROM turno
--SELECT * FROM turno_paciente
/*
ESTADOS:
0 -> pendiente
1 -> realizado
2 -> cancelado
*/
--si salta este error : Instrucción INSERT en conflicto con la restricción FOREIGN KEY 'FK_turno_paciente_paciente'. El conflicto ha aparecido en la base de datos 'CentroMedico', tabla 'dbo.paciente', column 'idPaciente'.
     -- es porque algun id, el de medico o paciente no existe
	 -- Debido a ese error solo se inserto en la tabla turno, pero no en turno paciente. De todas formas eso no debe pasar, si falla algo no deberia insertarse nada, eso se logra usando transacciones
--EXEC ALTA_Turno '20241015 10:30',1,1,'El paciente tiene que estar en ayunas'

ALTER PROC ALTA_Turno (
				@fecha char(14), --20190215 12:00 // lo ideal es que sea char establesco este formate por la cantidad de caracteres
				@idPaciente paciente, --tipo de dato paciente
				@idMedico medico,
				@observacion observacion = ''
				)


as

set nocount on -- esto es para que cuando inserte los registros no salta "row affected" no cuente los registros, para que no haga esa cuenta y muestre correctamente los mensajes
-- es mas rapido sacandole el asterisco(que consulta en toda la tabla) y poniendole top 1, ya que apenas encuentre un turno con esa fecha. Es mas perfonmante
IF NOT EXISTS(SELECT TOP 1 idTurno  FROM turno WHERE fechaTurno = @fecha ) 
	BEGIN
		INSERT INTO turno(fechaTurno, estado, observacion)
		VALUES(@fecha,0, @observacion)
	
		--obtengo ultimo id de turno
		DECLARE @auxIdTurno turno
		SET @auxIdTurno = @@IDENTITY --@@Identity obtiene el ultimo valor de identidad insertado con el INSERT, con el campo en identity ON
		-- para hacer esto debo tener el ultimo id que tengo en turno
		INSERT INTO turno_paciente(idTurno, idPaciente, idMedico)
		VALUES (@auxIdTurno, @idPaciente, @idMedico)
	
		PRINT 'EL turno se agregó correctamente'
		RETURN
	END

ELSE 
	BEGIN
		PRINT 'El turno ya existe'
	END


