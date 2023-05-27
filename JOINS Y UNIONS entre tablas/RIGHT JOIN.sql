

/*
Lo contrario a LEFT JOIN, todo el resultado de la tabla derecha mas las coincidencias de la izquierda
*/


SELECT * FROM paciente p
RIGHT JOIN turno_paciente tp
ON tp.idPaciente = p.idPaciente