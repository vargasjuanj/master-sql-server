


CREATE TABLE medico_especialidad (
	
	idMedico medico  NOT NULL,
	idEspecialidad BIGINT NOT NULL,
	descripcion varchar(1000)

	PRIMARY KEY(idMedico, idEspecialidad)
)