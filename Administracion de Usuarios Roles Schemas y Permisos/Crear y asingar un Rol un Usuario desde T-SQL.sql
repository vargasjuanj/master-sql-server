
-- Primeramente debemos crear un Login desde la interfaz, en este caso marcelo
	-- con sql server authentication, desactivamos caducación del password, elegimos bd por default CentroMedico
	-- En usser Mapping le seleccionamos CentroMedico para que le genere el usuario con el mismo nombre alla adentro. Y así podemos acceder al conectarnos

-- Despues de AUTHORIZATION va que usuario va a ser el creador de este rol y tmb propietario
-- El usuairo dbo es el usuario que está asignado al login sa. Es el usuario administrador de la base de datos.
-- Si sale error al crear Rol, fijarse en el nombre dle script, en que login estoy iniciado, en el 'sa' si deja ejecutar este script

CREATE ROLE Pagos AUTHORIZATION dbo

-- asignamos el rol al usuario creado anteriormente
-- para verificar vamos al usuario marcelo, hacemos doble click y en membership vamos a ver que está tildao Pagos
ALTER ROLE Pagos ADD MEMBER marcelo

-- Con esto logramos crear un rol rapidamente y asignarlo a un usuario, despues editaremos los permisos
