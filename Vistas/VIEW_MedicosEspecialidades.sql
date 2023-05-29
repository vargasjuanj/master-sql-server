
-- Testeamos la vista
/*
SELECT * FROM VIEW_MedicoEspecialidades

Esta vista puede ser muy util porque si queremos mostrar en una interfaz de usuario un listbox con el nombre de los medicos y su especialidad
hacemos directamente ejecutar la vista y ya tenemos todo sin tener que realizar las queries con este inner join
*/
ALTER VIEW VIEW_MedicoEspecialidades AS

-- Le sacamos el asterisco * y le ponemos nombres de campos (porque hay campos que se llaman igual en ambas) sino salta este error al crear la vista: 
-- Los nombres de columna de cada vista o función deben ser únicos. El nombre de columna 'idMedico' de la vista o función 'VIEW_MedicoEspecialidades' se especifica más de una vez.

SELECT m.idMedico, m.nombre, m.apellido, me.idEspecialidad, me.descripcion FROM medico m
INNER JOIN medico_especialidad me
ON me.idMedico = m.idMedico
