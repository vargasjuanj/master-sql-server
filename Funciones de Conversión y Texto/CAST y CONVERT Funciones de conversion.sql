

-- CAST : Es generica convierte un tipo de dato en otro siempre y cuando sea del mismo genero digamos, por ejemplo de varchar a char o decimal a numero, pero no de numero a letra porque devoveria una excepcion
	-- Devolveria error de ejecucion porque no puede realizar la conversión

-- CONVERT: Implementacion de la funcion CAST, con la particularidad que va a permitir convertir con un poco mas de detalle ese tipo de dato

DECLARE @numero MONEY
SET @numero = 500.40
PRINT @numero
--trabaja con select porque estamos seleccionando un valor



SELECT CAST(@numero as INT) numero -- no cambia el tipo de dato de la variable, lo castea en el momento. Convierte el valor en el momento a modo de visualizacion

--SELECT CAST(idPaciente as money) idPaciente from paciente -- esto lo que hace es agregarle decimales a los valores del campo idPaciente que es un entero

DECLARE @fecha DATETIME
SET @fecha = GETDATE()
-- el primer argumento es el tipo de dato al que yo quiero convertir la variable que yo estoy pasando como parametro
SELECT CONVERT(INT, @numero) -- aca estaria haciendo lo mismo que el CAST
SELECT CONVERT(char(20),@fecha )

-- En el tercer parametro le puedo poner el formato de fecha que quiero devolver
SELECT CONVERT(char(20),@fecha, 112) -- > 120? puedo hacer una comparacion de fechas rapidamente haber cual numero es mayor -- numero reservado, formato año - mes y dia, esto es util para realizar comparacion
-- también podriamos hacer la comparacion de fechas sin hacer la conversión
-- otro formato es 104, 111, ver pdf


