

/*

Permite cruzar tablas por el campo que tengan en común para obtener un resultado mas amplio, un resultado que involucre a esas dos tablas

*/


SELECT * FROM paciente
SELECT * FROM turno_paciente

SELECT * FROM paciente p
INNER JOIN turno_paciente tp  -- esta es la tabla que queremos vincular con paciente
ON tp.idPaciente = p.idPaciente-- con ON conectamos los dos campos de las tablas

