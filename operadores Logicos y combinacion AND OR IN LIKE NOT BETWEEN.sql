

-- AND : Concatena varias condiciones dentro de la clausula WHERE

	-- el and restringe los filtros, deben cumplirse todas las condiciones
SELECT * FROM paciente WHERE apellido = 'Perez' AND nombre = 'Roberto' AND idPaciente = 3


-- OR : Debe cumplirse cualquiera de las condiciones

SELECT * FROM paciente WHERE apellido = 'PEREZ' OR nombre = 'roberto' OR idPaciente = 3

-- IN (dentro) : Filtra por un grupo de valores que podemos establecer

SELECT * FROM turno WHERE estado IN (0,2,99,100) -- Los estados 99 y 100 no existen, pero a pesar de eso va a mostrar los registros que si tengan 0 y 2
SELECT * FROM paciente WHERE apellido IN ('perez','ramires')


-- LIKE: Permite trabajar sobre cadena de caracteres. Filtra segun cierto valor

SELECT * FROM paciente WHERE nombre LIKE 'roberto' --aca busca la coincidencia exacta, sería igual que el where en este uso

SELECT * FROM paciente WHERE nombre LIKE 'rober%' -- busca la palabra que comienza con rober y sigue con cualquier caracter

SELECT * FROM paciente WHERE nombre LIKE '%rober' --en este caso busca cualquier caracter al principio de la palabra, pero que termine en rober

SELECT * FROM paciente WHERE nombre LIKE '%rober%' -- busca cualquier nombre que contenga la cadena rober


-- NOT : Niega cualquier operador ejecutado antes
	
	-- busca los que sean distintos de %rober%
SELECT * FROM paciente WHERE nombre NOT LIKE '%rober%' -- busca cualquier nombre que contenga la cadena rober

	-- aca busca todos los apellidos menos perez y ramires
SELECT * FROM paciente WHERE apellido NOT IN ('perez','ramires')


-- BETWEEN: Filtra los registros por un determinado rango. Puede ser un rango de fechas, numeros o texto.
											 -- 20190102 00:00:00.000 (es igual a 20190102) la fecha en el formato SQL ES yyyymmdd año mes dia
SELECT * FROM turno WHERE fechaTurno BETWEEN '20190102 ' AND '20190104' -- toma hasta el 04 00:00:00.000. por defecto la hora que toma (sin ponerle la hora) es 00:00.000 por eso no agarra las mismas fechas de otras horas asi		
SELECT * FROM turno WHERE fechaTurno BETWEEN '20190102 ' AND '20190104 13:00:00.000' -- acá toma hasta la hora 13

SELECT * FROM turno WHERE estado BETWEEN 1 AND 2

	-- tambien se puede filtrar por cadena de caracteres en el elugar donde va la fecha
	-- Tener en cuenta que BETWEEN se basa en el alfabeto para ordenar el texto, con los caracteres comprendidos en el between
SELECT * FROM paciente WHERE apellido BETWEEN 'perez' AND 'ramires' -- toma todos los registros con apellidos perez y ramirez


-- COMBINANDO OPERADORES

	--hago uso de los parentesis, en este casi si o si se tiene que llamar perez y cumplir alguna de las condiciones dentro del parentesis
SELECT * FROM paciente WHERE apellido = 'PEREZ' AND (nombre = 'roberto' OR idPaciente = 3 OR idPais = 'PER')


SELECT * FROM paciente WHERE apellido = 'PEREZ' AND (nombre = 'roberto'  OR idPais = 'PER')
AND idPaciente IN (1,3)