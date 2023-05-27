
--exec UPD_Paciente 12,'Jean','Darros','montes 435','jeand@gmail.com'

ALTER PROC UPD_Paciente(
				@idpaciente paciente,
				@nombre varchar(50),
				@apellido varchar(50),
				@domicilio varchar(50),
				@email varchar(30))

AS

SET NOCOUNT ON

IF EXISTS(SELECT * FROM paciente
			WHERE idPaciente = @idpaciente)
	UPDATE paciente SET nombre = @nombre,
					apellido = @apellido,
					domicilio = @domicilio,
					email = @email
	WHERE idpaciente = @idpaciente


ELSE
	SELECT 0 as resultado

