

-- MAX MIN

SELECT MAX(idPaciente) from paciente
SELECT MIN(idPaciente) from paciente

	--aca combina group by con min y max. Primero toma solo los valores distintos, luego de esos apellidos distintos elije el id mas chico de los  apellidos perez
SELECT apellido, MIN(idPaciente) FROM paciente GROUP BY apellido



-- SUM : Se aplica directamente sobre el campo (numerico) que queremos sumarizar. Es muy útil para consultas y reportes. Por ejemplo cuantas cantidades se vendió de tal producto

SELECT SUM(idPaciente) FROM paciente  -- me suma todos los ids

    -- Primero los agrupa por apellido, es decir va a mostrar solo apellidos distintos. Después muestra en la columna de al lado la suma de los ids del mismo apellido. Por ejemplo si hay 2 Perez, uno con id 3 y el otro con id 7, al lado de Perez va aparecer el 10
	-- La sintaxis indica que a cada apellido(repetido o no) quiere sacarle la suma total de sus ids, pero agrupado por apellidos distintos

SELECT SUM(idPaciente) FROM paciente GROUP BY apellido -- si lo dejamos asi sin el campo apellido al lado del SELECT, va a mostrar solo la suma de los ids de los distintos nombres


SELECT SUM(idPaciente) as suma_ids_de_los_distintos_apelidos FROM paciente GROUP BY apellido

SELECT apellido, SUM(idPaciente) as sumaIds FROM paciente GROUP BY apellido -- aca colocamos el apellido a la izquierdo, y la suma de todos los ids de ese apellido (se repita o no)


-- AVG (Average) : Permite calcular un promedio de un total de registros sobre un campo de tipo numerico


SELECT AVG(idPaciente) FROM paciente


-- COUNT : Cuenta la cantidad de filas o registros de la tabla

	--hacer un COUNT de toda la tabla tiene un costo de procesamiento, con condiciones es más optimo
SELECT COUNT(*) FROM paciente -- aca cuenta todos los registros, supongamos que hay 6
SELECT COUNT(apellido) FROM paciente -- acá puede variar la cantidad de registros. Suponiendo que en total hay 6 registros pero uno de ellos tiene el apellido en NULL, va a mostrar 5, no 6
SELECT COUNT(idPaciente) FROM paciente WHERE apellido = 'Perez' -- En este caso colocamos en el count la llave primaria para asegurarnos de que no sea null, y a su vez buscamos con el where la cantidade de registros con apellido Perez

-- HAVING : (donde el valor sea ...) Se diferencia del WHERE (se aplica sobre un registro particular) el havin lo hace sobre un conjunto de registros, es decir que siempre se usa con group by

SELECT estado FROM turno WHERE estado = 2

	--hasta este punto las siguientes dos sentencias hacen lo mismo, pero combinando HAVING con Count ahi cambia la cosa
SELECT estado FROM turno WHERE estado = 2 GROUP BY estado
SELECT estado FROM turno GROUP BY estado HAVING estado = 2

	-- en este caso lo que nos indica esta sentencia, es que muestre los estados que aparecen 3 veces.
	-- primero agrupa por los distintos estados, luego cuenta las repeticiones de cada estado en los registros de la tabla, y finalmente se fija cual de esos estados aparece 3 veces
	-- el resultado finalmente son los estados(los valores) que aparecen tres veces
	-- cuenta las repeticiones que aparecen los estado en la tabla, con el where no es tan facil hacerlo, o no se puede
SELECT estado FROM turno GROUP BY estado HAVING COUNT( estado) = 3

	-- si quisieramos simular la linea anterior con el WHERE, nos saltaría el siguiente error:
	-- No puede aparecer un agregado en la cláusula WHERE si no es en una subconsulta contenida en una cláusula HAVING o en una lista de selección, y siempre que la columna agregada sea una referencia externa.

SELECT estado FROM turno WHERE COUNT(estado) = 3 GROUP BY estado

--Muestra los distintos estados que aparecen menos de 4 veces
SELECT estado, COUNT(estado) cantidad FROM turno GROUP BY estado HAVING COUNT(estado) < 4

