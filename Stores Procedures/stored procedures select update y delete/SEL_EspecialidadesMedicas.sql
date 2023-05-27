
/*
Obtener especialidades medicas
*/

--EXEC SEL_EspecialidadesMedicas

-- no necesita parametros porque quiero todas las especialidades
ALTER PROC SEL_EspecialidadesMedicas 
AS

SET NOCOUNT ON

IF EXISTS (SELECT * FROM especialidad)
	BEGIN
		SELECT * FROM especialidad
	END
ELSE
	SELECT 0 AS result

GO

PRINT 'esto no va en el stored'