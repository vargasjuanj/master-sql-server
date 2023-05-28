
-- Trigger para guardar un log, si el paciente que se ingresa es de la ciudad de Mexico

-- Primero creamos una tabla que nos va a servir de log
/*
CREATE TABLE paciente_log (
idPaciente paciente PRIMARY KEY,
idPais CHAR(3),
fechaAlta DATETIME
)
*/
ALTER TRIGGER PacientesCreados ON paciente -- con el ON especificamos sobre que tablas vamos a disparar este evento
AFTER INSERT -- despues del insert se tiene que ejecutar, le podemos colocar los 3 eventos juntos si queremos
AS

IF (SELECT idPais FROM inserted) = 'MEX'-- La palabra inserted es reconocida dentro del triiger. La toma como que es el ultimo registro insertado en la tabla paciente
		INSERT INTO paciente_log (idPaciente,idPais,fechaAlta) -- hacemos un insert select
		SELECT i.idPaciente, i.idPais, GETDATE() FROM inserted i	