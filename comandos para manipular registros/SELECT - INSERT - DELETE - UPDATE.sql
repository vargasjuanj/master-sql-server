

-- INSERT

-- Siempre conviene especificar el insert con los nombres de los valores, porque no sabemos si a esa tabla se le han agregado más campos

--INSERT INTO paciente VALUES ('Roberto','Perez','2017-01-04','piedra buena 21','ESP','','','')

INSERT INTO paciente (nombre, apellido, fNacimiento, domicilio, idPais, telefono, email, observacion)
VALUES ('Luis','Robles','2017-01-04','piedra buena 21','ESP','','','')


SELECT * FROM paciente WHERE nombre = 'Luis'

-- DELETE : Permite eliminar uno o más registros de una tabla determinada


DELETE FROM paciente WHERE idPaciente = 5


-- UPDATE: Actualiza uno o más campos de una tabla especifica

UPDATE paciente SET observacion = 'Pacientes creados desde UI'