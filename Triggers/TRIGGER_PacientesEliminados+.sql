
/*
ALTER TABLE paciente_log ADD fechaBaja DATETIME
*/

ALTER TRIGGER PacientesEliminados ON Paciente
FOR DELETE  -- No se utiliza AFTER DELETE, ya que en ese caso perderíamos los datos antes de actualizar nuestro Log.
AS

IF EXISTS (SELECT idPaciente FROM paciente_log
			WHERE idPaciente = (SELECT idPaciente FROM Deleted))
	UPDATE paciente_log SET fechaBaja = GETDATE()
		WHERE idPaciente = (SELECT idPaciente FROM Deleted) -- Se usa usa el objeto deleted en vez del inserted
ELSE
	INSERT INTO paciente_log(idPaciente, idPais, fechaBaja)
	SELECT idPaciente, idPais, GETDATE() FROM Deleted

