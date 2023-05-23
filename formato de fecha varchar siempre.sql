DECLARE @fecha SMALLDATETIME
DECLARE @fechaConHora DATE -- con tipo DATE la muestra asi 2018-03-15, con datetime igual
--Siempre usar las fechas en String, sql lo toma asi, este es yyymmdd, también esta el de hora, esto es para evitar que desde la aplicación vengan invertidos los meses y los días, siempre desde la aplicación enviar asi el fromato 
SET @fecha = '20180315'
SET @fechaConHora = '20180315 21:30:20.103'

PRINT @fecha -- La va a mostrar así: Mar 15 2018 12:00AM
PRINT @fechaConHora