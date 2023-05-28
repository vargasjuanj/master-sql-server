
/*
Permiten recibir uno o mas parametros y devolver un tipo especifico, realizar un calvulo con el parametro y devolver un valor
*/

-- probamos laS funciónes. Se le ponde dbo porque si no no la reconoce
--SELECT dbo.concatenar('Lopez','Roberto')

SELECT dbo.obtenerPais (1)

ALTER FUNCTION concatenar (
			@apellido VARCHAR(50),
			@nombre VARCHAR(50)
			)
RETURNS VARCHAR(100)

AS

BEGIN
	DECLARE @resultado VARCHAR(100)
	SET @resultado = @apellido + @nombre
	return @resultado
END


-- Devuelve la descripcion del pais de donde proviene el paciente

ALTER FUNCTION obtenerPais (
					@idPaciente paciente
				)
RETURNS VARCHAR(50)

AS

BEGIN 
	DECLARE @pais VARCHAR(50)
	SET @pais = (
		SELECT ps.pais FROM paciente p  -- sino pongo ps.pais, es decir, si no elijo una sola columna va a saltar un error de selección, porque solo deve devolver un valor, no una fila. SELECT ps.pais (pais) representaria el nombre del campo y el resultado de la consulta o las consultas, sería el valor unico
		INNER JOIN Pais ps
		ON p.idPais = ps.idPais
		WHERE idPaciente = 1
	)

	RETURN @pais

END