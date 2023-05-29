
--mostramos el resultado de la función
/*
PRINT dbo.FCN_FechaTexto ('20191011')

PRINT DATEPART(dd,GETDATE())

Al sumar 2 numeros, ya sea en formato de cadena o numero pero distintos formatos si los sumas.
Cuando los dos son formato de cadena los junta
Pero cuando es una letra o palabra no lo une si el otro es un numero, por eso se usa el convert
PRINT 2 + '1' -- 3
PRINT '2' + 1 -- = 3
PRINT '2' + '1' -- 21
PRINT 'MARTES' + '2' -- MARTES2
PRINT 'MARTES' + 2 -- ERROR : Error de conversión al convertir el valor varchar 'MARTES' al tipo de datos int.
PRINT  2 + 'MARTES' -- ERROR
PRINT '2' + 'MARTES'
PRINT 'MARTES' + '2'

*/

ALTER FUNCTION FCN_FechaTexto (@fecha DATETIME)

RETURNS VARCHAR(50)

AS

BEGIN

DECLARE @dia VARCHAR(20)
DECLARE @mes VARCHAR(20)
DECLARE @fechaTexto VARCHAR(50)

SET @dia = (CASE
-- le hago el convert para transformarlo a cadena porque salta error que no se puede sumar un char con un int
			  WHEN DATEPART(dw,@fecha) =  1 THEN 'Domingo ' + CONVERT( CHAR(2),DATEPART(dd,@fecha))
			  WHEN DATEPART(dw,@fecha) =  2 THEN 'Lunes ' + CONVERT( CHAR(2), DATEPART(dd,@fecha))
			  WHEN DATEPART(dw,@fecha) =  3 THEN 'Martes ' +  CONVERT (CHAR(2), DATEPART(dd,@fecha))
			  WHEN DATEPART(dw,@fecha) =  4 THEN 'Miercoles ' + CONVERT( CHAR(2), DATEPART(dd,@fecha))
			  WHEN DATEPART(dw,@fecha) =  5 THEN 'Jueves ' + CONVERT( CHAR(2), DATEPART(dd,@fecha))
			  WHEN DATEPART(dw,@fecha) =  6 THEN 'Viernes ' + CONVERT( CHAR(2), DATEPART(dd,@fecha))
			  WHEN DATEPART(dw,@fecha) =  7 THEN 'Sabado ' + CONVERT( CHAR(2), DATEPART(dd,@fecha))
		    END)

SET @mes = (CASE 
				 WHEN DATEPART(mm,@fecha) = 1 THEN 'Enero'
				 WHEN DATEPART(mm,@fecha) = 2 THEN 'Febrero'
				 WHEN DATEPART(mm,@fecha) = 3 THEN 'Marzo'
				 WHEN DATEPART(mm,@fecha) = 4 THEN 'Abril'
				 WHEN DATEPART(mm,@fecha) = 5 THEN 'Mayo'
				 WHEN DATEPART(mm,@fecha) = 6 THEN 'Junio'
				 WHEN DATEPART(mm,@fecha) = 7 THEN 'Julio'
				 WHEN DATEPART(mm,@fecha) = 8 THEN 'Agosto'
				 WHEN DATEPART(mm,@fecha) = 9 THEN 'Septiembre'
				 WHEN DATEPART(mm,@fecha) = 10 THEN 'Octubre'
				 WHEN DATEPART(mm,@fecha) = 11 THEN 'Noviembre'
				 WHEN DATEPART(mm,@fecha) = 12 THEN 'Diciembre'
			END )

			-- cuando el mes es de dos digitos si necesita el espacio adelante ' de ' asi no queda pegado
SET @fechaTexto = @dia + ' de ' + @mes

RETURN @fechaTexto

END

