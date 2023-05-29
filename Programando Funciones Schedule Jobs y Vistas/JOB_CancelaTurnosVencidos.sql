
-- Job para cancelar turnos que estan pendientes, es decir colocarlos en estado 2, cancelados

/* 
SELECT * FROM turno  
SELECT * FROM turno_estado
*/
-- turnos que sean menores a la fecha de hoy
-- Comparacion de año, mes dia, por eso convertirmos, formateamos con 112 para obtener algo asi 20190520
-- Una recomendación es que el where este al lado del update porque apurados podemos seleccionar eso y ejecutar solo el update sin la condicion
UPDATE turno SET estado = 2 WHERE CONVERT(CHAR(8),fechaTurno,112) < CONVERT (CHAR(8), GETDATE(), 112)
AND
estado = 0
