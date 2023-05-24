
-- Eliminan los espacio de una cadena a la izquierda y derecha

DECLARE @var1 VARCHAR(20) = '             Rarmiro  '
DECLARE @var2 VARCHAR(20) = 'Gonzalez     '
--hay que asegurarnos de que cuando nos venga un valor quitarle los espacios 

SELECT @var1 + @var2 + '*'
SELECT LTRIM(@var1) + RTRIM(@var2) + '*'

PRINT LTRIM(@var1)



