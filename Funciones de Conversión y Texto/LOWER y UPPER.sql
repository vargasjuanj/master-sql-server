
DECLARE @var1 VARCHAR(20)
SET @var1 = 'rAMiro'

PRINT LOWER(@var1)

PRINT UPPER(@var1)

-- suponiendo que tenemos una app donde el usuario ingresa su nombre. El usuario lo va a ingresar como quiera pero con esto nos aseguramos de que este uniforme el nombre
PRINT  UPPER(LEFT(@var1,1)) + LOWER( RIGHT( @var1 , LEN(@var1) -1 ) )