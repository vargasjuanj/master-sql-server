
--EXEC ALTA_Paciente '252525','Jorge','Lopez','20180518','calle1','MEX','','jorge@gmail.com',''


--SELECT * FROM paciente

ALTER PROC ALTA_Paciente (
				@dni VARCHAR(20),
				@nombre VARCHAR(50), -- si este parametro es de 20 por ejem, y el argumento que se le pasa es de 40, va a saltar un warning y es posible que pierda datos
				@apellido VARCHAR(50), 
				--en este caso la vamos a tratar como varchar
				--para evitar problemas, la fecha estandar es de char o varchar de 8, a menos que tenga hora. Pero char ya que es fijo
				@fNacimiento CHAR(8),
				@domicilio VARCHAR(50),
				@idPais CHAR(3),
				@telefono VARCHAR(20) = '',
				@email VARCHAR(30),
				@observacion VARCHAR(1000) = '' -- Si el argumento llega como NULL, el valor por defecto va a ser '' -> vacio, para que no se grabe como NULL
				)


as

IF NOT EXISTS(SELECT * FROM paciente WHERE dni = @dni ) --Pregunta si no existe el pariente que está viniendo como parametro y lo agrega si no existiera
BEGIN
	INSERT INTO paciente(dni,nombre,apellido,fNacimiento,domicilio,idPais,telefono,email,observacion)
	VALUES(@dni,@nombre,@apellido,@fNacimiento,@domicilio,@idPais,@telefono,@email,@observacion)
	PRINT 'EL paciente se agregó correctamente'
	RETURN
END

ELSE 
	BEGIN
	PRINT 'El paciente ya existe'
	END

