
-- Permite evaluar si una fecha especifica tiene un formato correcto o no, va a devolver true o false dependiendo de la fecha

PRINT ISDATE(GETDATE()) -- 1 es true, 0 es false

PRINT ISDATE('2023') -- 1 porqe indicaria un años

PRINT ISDATE('202') -- 0

IF (  ISDATE('20220132') )= 1 -- 32 de enero no existe
	BEGIN
		PRINT 'Fecha Correcta'
	END
ELSE
	BEGIN
		PRINT 'Fecha Incorrecta'
	END