
/*
Cuenta la cantidad de caracteres de una variable CHAR O VARCHAR
*/

DECLARE @var1 VARCHAR(20)
SET @var1 = 'Ramiro'

PRINT LEN(@var1)

PRINT LEFT(@var1,LEN(@var1) -1 )