

-- IF BEGIN END ELSE EXISTS IF ANIDADO


DECLARE @idPaciente INT
DECLARE @idTurno INT


SET @idPaciente = 7

-- El IF sin Begin  solo toma la primer instrucción que le sigue, pero usando el BEGIN toma el bloque de instrucciones
IF @idPaciente = 7
	BEGIN
		SET @idTurno = 20
		--Si el resultado está en modo grilla me va a mostrar la primer devolución, es decir este select
		-- para que muestre varios resultados presionamos ctrl+t y los devuelve en modo texto
		SELECT * FROM paciente WHERE idPaciente = @idPaciente
		PRINT @idTurno

		--IF anidado
		--EXISTS: Evalua si existe un grupo de registros de determinada consulta
			--Recibe una consulta de selección
		IF EXISTS( SELECT * FROM paciente WHERE idPaciente = 3 )
			PRINT 'existe'

	END
ELSE -- Si vamos a escribir mas de unalinea usamos el BEGIN - END, sino es la linea que le sigue la que vale
	BEGIN
		PRINT 'No se cumplió la condición'
		PRINT 'Lo siento'
	END





   --WHILE : Eejecuta un bloque de código hasta que se cumpla cierta condición, a menos que haya un return o break sale del bucle

DECLARE @contador INT = 0

-- Hay que tener cuidado con los bucles infinitos, while loops porque debemos reiniciar el servidor sql para parar la ejecución infinita
-- Va a devolver las consultas con lentitud, hasta qu eno haya mas memoria
WHILE @contador <= 10
	BEGIN
		PRINT @contador
		SET @contador = @contador + 1
	END


	-- CASE : Condicional que permite tomar deciciones en función del valor de una variable o un campo
	-- Podría usarse en un SELECT

DECLARE @valor INT
DECLARE @resultado CHAR(10) = '' 
SET @valor = 20

	--Cuando valor sea igual a 10 devolver 'ROJO'
SET @resultado = ( 
CASE
	WHEN @valor = 10 THEN 'ROJO'
	WHEN @valor = 20 THEN 'VERDE'
	WHEN @Valor = 30 THEN 'AZUL'
	ELSE 'GRIS'
END
)

PRINT @resultado
		------------------------------
		--agrego una columna más para jugar y relacionar un valor númerico en Sring 
		-- puedo usarlo para usar por ejemplo una clase de css y cargar ese color para mostrar el turno
SELECT *,(CASE
				WHEN estado = 0 THEN 'VERDE'
				WHEN estado = 1 THEN 'ROJO'
				WHEN estado = 3 THEN 'AZUL'
				ELSE 'GRIS' -- default
		  END) colorTurno FROM turno 				


 -- RETURN: Permite salir del scripts forzosamente donde estoy ejecutando instrucciones, si yo estoy por ejemplo en un procedimiento almacenado las instruccions despúes del return no se van a ejecutar
 
DECLARE @cont INT = 0

WHILE @cont <= 10
	BEGIN
		PRINT @cont
		SET @cont = @cont + 1
		IF @cont = 3 
			RETURN
		PRINT 'HOLA'
	END
PRINT 'CHAU'  -- este no lo ejecuta


-- BREAK: Sale del bucle también como el RETURN, pero la diferencia es que sigue ejecutando lo que hay afuera del bucle, en cambio el RETURN sale completamente del script

DECLARE @contBreak INT = 0

WHILE @contBreak <= 10
	BEGIN
		PRINT @contBreak
		SET @contBreak = @contBreak + 1
		IF @contBreak = 3 
			BREAK
		PRINT 'HI'
	END
PRINT 'sigue ejecutando'  -- si lo ejecuta


-- TRY CATCH : Manejo de errores en tiempo de ejecución, cuando no se tiene contemplado el error, error controlado

DECLARE @numero INT
DECLARE @palabras VARCHAR
SET @palabras = 1234324
-- generamos un error en tiempo de ejecución. Si fuera al reves, que a un varchar le asigne numeros no habría invonveniente porque el varchar admite numeros también
--SET @numero = 'texto'


BEGIN TRY
	SET @numero = 'texto'
END TRY

BEGIN CATCH
	PRINT 'no es posible asignar un texto a la variable @numero'
END CATCH




	 

