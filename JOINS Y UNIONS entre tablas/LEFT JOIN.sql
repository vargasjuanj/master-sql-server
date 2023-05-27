


/*
Obtiene todos los registros de la tabla de la izquierda y solamente los de la derecha son los que coinciden con la clausula ON, los restos de los valores que no coinciedan en la segunda tabla los deja en NULL
*/

SELECT * FROM paciente
SELECT * FROM turno_paciente

SELECT * FROM paciente p
LEFT JOIN turno_paciente tp
ON tp.idPaciente = p.idPaciente
