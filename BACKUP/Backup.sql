
-- Formato de fecha = 201905281250 fecha y hora

DECLARE @fecha CHAR(12)
DECLARE @path VARCHAR(100)
DECLARE @name VARCHAR(20)


--SET @fecha = GETDATE() -- asi solo devuelve May 28 2023 

--primero se le pasa el tipo de dato al que queremos convertir, el dato a convertir y formato
-- con 112 y 8 chars obtenemos yymmdd y mas la de 108 char(5) obtenemos la hora, con char(8) saldrian los segundos
-- y quitamos los dos puntitos : con replace. Primero se le pasa el texto que queremos editar, dsps el valor que queremos sacar, y tercero el valor que va a reemplazar al segundo

SET @fecha = CONVERT(CHAR(8),GETDATE(),112) + REPLACE ( CONVERT(CHAR(5),GETDATE(),108),':','' )-- convierte en año mes dia pero en numeros, mas el formato que necesitamos. Con 108 retorna la hora. Con 107 fecha en formato texto, 104 fecha separada por punto
--PRINT @fecha
SET @path = 'C:\backupSQL/CentroMedico' + @fecha + '.bak'
SET @name = 'CentroMedico' + @fecha

BACKUP DATABASE CentroMedico
TO DISK = @path -- ruta donde se va a guardar, con el nombre dle archivo
-- el nombre que va aca sería como un identificador del backup, no es el nombre del archivo, ni tampoco de la base de datos
WITH NO_COMPRESSION, NAME = 'ggg' --'asdf' -- 'CentroMedico' -- -- sin compresión y la bd la cual quiero backupear

