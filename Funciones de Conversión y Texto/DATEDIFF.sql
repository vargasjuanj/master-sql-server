

-- Devuelve la diferencia entre fechas segun el intervalo utilizado (day o dd, year o yyy, etc)

-- Nos permite calcular la diferencia entre dos fechas para ver si una esta vencida, o el reango entre fechas permite realizar al usuario cierta acción.

SELECT DATEDIFF(year,GETDATE(),'20170120') --devuelve la diferencia entre años, da negativo porque hace 2017 - 2023, atrasado años 

SELECT DATEDIFF(year,'20170120',GETDATE()) --aca da un valor positivo