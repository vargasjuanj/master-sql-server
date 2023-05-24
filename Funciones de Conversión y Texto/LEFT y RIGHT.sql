
/*
Sirven para tratar el tipo de dato CHAR Y VARCHAR
Permiten obtener determinados caracteres de la cadena de carácteres a la izquierda o derecha
*/

DECLARE @var1 VARCHAR(20)
DECLARE @var2 VARCHAR(20)
SET @var1 = 'Ramiro'
SET @var2 = 'Gonzales'

-- El segundo parametro va a ser la cantidad de caracteres que quiero tomar a la izauierda, sería Ra
PRINT LEFT (@var1,2)

PRINT RIGHT (@var1,2)

PRINT LEFT (@var1,1) + LEFT(@var2,1) --iniciales



