
/*
Intervalos usados en en este tipo de funciones:
year o yy
mont mm
day : para manejar dias o dd
hour
minute o min
second,
millisecond,
nanosecond,
microsecond
*/
-- Permite agregarle a una fecha intervalos, dias, horas, minutos, segundos, etc

-- El primer parametro es el intervalo que queremos editar, el tipo, en este caso day de dia
-- el segundo es agregar, con el menos le restamos -2
-- el tercer parametro es la fecha a la que le queremos restar dias en este caso

SELECT DATEADD(day,2,getdate()) --le suma dos dias a la fecha actual
-- se puede usar para ir ajustando la fecha al uso horario correspondiente, la ajusto al guardar la fecha o al mostrarla la modifico con esta función