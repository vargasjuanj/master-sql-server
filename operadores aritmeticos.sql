
-- + - * / % el modulo es el resto de la división
DECLARE @num1 DECIMAL(9,2) = 30 --parte entera de 9 digitos y parte decimal de 2. Es deciar 7 numeros para la parte entera y 2 para la decimal
DECLARE @num2 DECIMAL(9,2) = 20
DECLARE @resultado DECIMAL(9,2)

SET @resultado = @num1 % @num2

PRINT @resultado

--concatenacion
DECLARE @cadena1 VARCHAR(10) = 'Hola me llamo juan ' -- lo trunca hasta 10 cuando lo sumo
DECLARE @cadena2 VARCHAR(10) = 'Jose Vargas'
DECLARE @cadenaResultado VARCHAR(20) = @cadena1 + @cadena2

PRINT @cadenaResultado

/*
>
<
=
>=
<=
<>
Se pueden realizar tanto con numeros como caracteres alfanumericos. Al comparar texto compara en relación al abecedario
*/

IF (@num2 < @num1)
	PRINT 'SI'

IF (@cadena1 <> @cadena2)
	PRINT 'DISTINTAS' 
