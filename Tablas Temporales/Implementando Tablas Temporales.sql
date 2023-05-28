
DECLARE @turnos  TABLE (id BIGINT IDENTITY(1,1), idTurno turno, idPaciente paciente)
DECLARE @idPaciente paciente

INSERT INTO @turnos 
SELECT tp.idTurno, p.idPaciente FROM paciente p -- tecnica para insertar registros desde un select
	INNER JOIN turno_paciente tp
	ON tp.idpaciente = p.idPaciente

-- recorremos la tabla

DECLARE @i int
DECLARE @total int
SET @total =  (SELECT COUNT(*) FROM @turnos)
SET @i = 1

WHILE ( @i < @total )-- menor o igual a la cantidad de registros
	BEGIN
	-- si en turno_paciente hay un idPaciente 8 funciona mejor
		-- Si el turno no es del paciente 8, es decir es distinto al 8, borro el registro
		IF (SELECT idPaciente FROM @turnos WHERE id = @i) <> 8 -- accedo al registro de la tabla temporal
			DELETE FROM @turnos WHERE id = @i -- borro al registro que no pertenece al paciente 8
		SET @i =@i + 1
	END

--SELECT * FROM @turnos

-- en este caso el select es mas pequeño, en vez de realizar la consulta sobre la tabla real la hacemos sobre una temporal
-- es decir en vez de hacerlo sobre la tabla real que puede tener muchos registros hacemos el inner join sobre una tabla mas pequeña
-- mejoramos la perfonmance y obtenemos resultados mas rapidos
SELECT * FROM paciente p
INNER JOIN @turnos t
ON t.idPaciente = p.idPaciente
