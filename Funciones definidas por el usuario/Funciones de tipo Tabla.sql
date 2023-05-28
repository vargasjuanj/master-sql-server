
/*
Similar a la escalar solo que retorna una tabla, es decir un conjunto de registros
Estas funciones no aparecen en la carpeta de escalares sino que en la carpeta  funciones con valores de tipo tabla
*/
SELECT * FROM PAIS

-- probamos la funcion
SELECT * FROM dbo.listaPaises() 
--SELECT pais FROM dbo.listaPaises() -- aca mostraría solo un campo

-- en este caso no recibe parametros
ALTER FUNCTION listaPaises()
RETURNS @paises TABLE(idPais char(3), pais VARCHAR(50)) -- es decir que el retorno va a ser de tipo tabla, y colocamos los campos y sus tipos
AS
BEGIN
	--  @paises representa una tabla 

	INSERT INTO @paises values('ESP','España')
	INSERT INTO @paises values('MEX','Mexico')
	INSERT INTO @paises values('CHI','Chile')
	INSERT INTO @paises values('PER','Peru')
	INSERT INTO @paises values('ARG','Argentina')

	RETURN 
END
