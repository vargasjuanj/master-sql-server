
/*
-- se agrega campo nuevo
ALTER TABLE paciente_log ADD fechaModificacion DATETIME

SELECT * FROM paciente_log

SELECT * FROM paciente

UPDATE paciente SET nombre = 'Mario' WHERE idPaciente = 23
*/

ALTER TRIGGER PacientesModificados ON paciente
AFTER UPDATE -- after es despues
AS

-- Si ya existe un registro de log de ese paciene lo unico que se hace es cambiar la fecha de modificación
-- Si no existe inserta un nuevo registro en la tabla de log
IF EXISTS( SELECT idPaciente FROM paciente_log 
				WHERE idPaciente = (SELECT idPaciente FROM INSERTED) ) -- tanto en triggers de update e insert se usa el objeto inserted 
	UPDATE paciente_log SET fechaModificacion = GETDATE()
		WHERE idPaciente = (SELECT idPaciente FROM INSERTED)
ELSE 
	INSERT INTO paciente_log (idPaciente, idPais, fechaModificacion)
		SELECT idPaciente, idPais, GETDATE() FROM INSERTED


