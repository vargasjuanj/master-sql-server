

--EXEC ALTA_Medico 'Gerardo', 'Martinez',1,'MEDICO RESIDENTE'

CREATE PROC ALTA_Medico(
				@nombre VARCHAR(50),
				@apellido VARCHAR(50),
				@idEspecialidad BIGINT,
				@descripcion VARCHAR(1000)
				)


as

set nocount on 
IF NOT EXISTS(SELECT TOP 1 idMedico  FROM medico WHERE nombre = @nombre and apellido = @apellido ) 
	BEGIN
		INSERT INTO medico(nombre, apellido)
		VALUES(@nombre, @apellido)
	
		DECLARE @auxIdMedico int
		SET @auxIdMedico = @@IDENTITY 
		INSERT INTO medico_especialidad(idMedico, idEspecialidad, descripcion)
		VALUES (@auxIdMedico, @idEspecialidad, @descripcion)
	
		PRINT 'EL medico se agregó correctamente'
		RETURN
	END

ELSE 
	BEGIN
		PRINT 'El medico ya existe'
	END

