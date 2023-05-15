-- DROP SCHEMA dbo;

CREATE SCHEMA dbo;
-- CentroMedico.dbo.concepto definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.concepto;

CREATE TABLE concepto (
	idConcepto tinyint IDENTITY(1,1) NOT NULL,
	descripcion varchar(100) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK__concepto__25A881FDFDF9F7BA PRIMARY KEY (idConcepto)
);


-- CentroMedico.dbo.especialidad definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.especialidad;

CREATE TABLE especialidad (
	idEspecialidad bigint IDENTITY(1,1) NOT NULL,
	especialidad varchar(30) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK__especial__E8AB16002F4940F3 PRIMARY KEY (idEspecialidad)
);


-- CentroMedico.dbo.historia definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.historia;

CREATE TABLE historia (
	idHistoria historia IDENTITY(1,1) NOT NULL,
	fechaHistoria datetime NULL,
	observacion observacion COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK_idHistoria PRIMARY KEY (idHistoria)
);


-- CentroMedico.dbo.medico definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.medico;

CREATE TABLE medico (
	idMedico medico IDENTITY(1,1) NOT NULL,
	nombre varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	apellido varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	CONSTRAINT PK__medico__4E03DEBAC9B21E13 PRIMARY KEY (idMedico)
);


-- CentroMedico.dbo.pais definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.pais;

CREATE TABLE pais (
	idPais char(3) COLLATE Modern_Spanish_CI_AS NOT NULL,
	pais varchar(30) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK__pais__BD2285E3A6A5110C PRIMARY KEY (idPais)
);


-- CentroMedico.dbo.sysdiagrams definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.sysdiagrams;

CREATE TABLE sysdiagrams (
	name sysname COLLATE Modern_Spanish_CI_AS NOT NULL,
	principal_id int NOT NULL,
	diagram_id int IDENTITY(1,1) NOT NULL,
	version int NULL,
	definition varbinary(MAX) NULL,
	CONSTRAINT PK__sysdiagr__C2B05B614C8C8D5F PRIMARY KEY (diagram_id),
	CONSTRAINT UK_principal_name UNIQUE (principal_id,name)
);


-- CentroMedico.dbo.table1 definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.table1;

CREATE TABLE table1 (
	col1 int IDENTITY(1,1) NOT NULL,
	col2 int NULL,
	CONSTRAINT PK__table1__357D0D3ED156BBDE PRIMARY KEY (col1)
);


-- CentroMedico.dbo.turno_estado definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.turno_estado;

CREATE TABLE turno_estado (
	idEstado smallint NOT NULL,
	descripcion varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK__turno_es__5406DDABB73212D1 PRIMARY KEY (idEstado)
);


-- CentroMedico.dbo.medico_especialidad definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.medico_especialidad;

CREATE TABLE medico_especialidad (
	idMedico medico NOT NULL,
	idEspecialidad bigint NOT NULL,
	descripcion varchar(1000) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK__medico_e__50896FDAC4251013 PRIMARY KEY (idMedico,idEspecialidad),
	CONSTRAINT FK_medico_especialidad_especialidad FOREIGN KEY (idEspecialidad) REFERENCES especialidad(idEspecialidad),
	CONSTRAINT FK_medico_especialidad_medico FOREIGN KEY (idMedico) REFERENCES medico(idMedico)
);


-- CentroMedico.dbo.paciente definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.paciente;

CREATE TABLE paciente (
	idPaciente paciente IDENTITY(1,1) NOT NULL,
	nombre varchar(50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	apellido varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
	fNacimiento date NULL,
	domicilio varchar(50) COLLATE Modern_Spanish_CI_AS NULL,
	idPais char(3) COLLATE Modern_Spanish_CI_AS NULL,
	telefono varchar(20) COLLATE Modern_Spanish_CI_AS NULL,
	email varchar(30) COLLATE Modern_Spanish_CI_AS NULL,
	observacion observacion COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK_idPaciente PRIMARY KEY (idPaciente),
	CONSTRAINT FK_paciente_pais FOREIGN KEY (idPais) REFERENCES pais(idPais)
);


-- CentroMedico.dbo.pago definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.pago;

CREATE TABLE pago (
	idPago bigint IDENTITY(1,1) NOT NULL,
	concepto tinyint NOT NULL,
	fecha datetime NOT NULL,
	monto money NOT NULL,
	estado tinyint NULL,
	observacion varchar(1000) COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK__pago__BD2295AD16152676 PRIMARY KEY (idPago),
	CONSTRAINT FK_pago_concepto FOREIGN KEY (concepto) REFERENCES concepto(idConcepto)
);


-- CentroMedico.dbo.turno definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.turno;

CREATE TABLE turno (
	idTurno turno IDENTITY(1,1) NOT NULL,
	fechaTurno datetime NULL,
	estado smallint NULL,
	observacion observacion COLLATE Modern_Spanish_CI_AS NULL,
	CONSTRAINT PK_Turno PRIMARY KEY (idTurno),
	CONSTRAINT FK_turno_turno_estado FOREIGN KEY (estado) REFERENCES turno_estado(idEstado)
);


-- CentroMedico.dbo.turno_paciente definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.turno_paciente;

CREATE TABLE turno_paciente (
	idTurno bigint NOT NULL,
	idPaciente bigint NOT NULL,
	idMedico bigint NOT NULL,
	CONSTRAINT PK_turno_paciente PRIMARY KEY (idTurno,idPaciente,idMedico),
	CONSTRAINT FK_turno_paciente_medico FOREIGN KEY (idMedico) REFERENCES medico(idMedico),
	CONSTRAINT FK_turno_paciente_paciente FOREIGN KEY (idPaciente) REFERENCES paciente(idPaciente),
	CONSTRAINT FK_turno_paciente_turno FOREIGN KEY (idTurno) REFERENCES turno(idTurno)
);


-- CentroMedico.dbo.historia_paciente definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.historia_paciente;

CREATE TABLE historia_paciente (
	idHistoria historia NOT NULL,
	idPaciente paciente NOT NULL,
	idMedico medico NOT NULL,
	CONSTRAINT PK_historia_paciente PRIMARY KEY (idHistoria,idPaciente,idMedico),
	CONSTRAINT FK__historia___idPac__02FC7413 FOREIGN KEY (idPaciente) REFERENCES paciente(idPaciente),
	CONSTRAINT FK_historia_paciente_historia FOREIGN KEY (idHistoria) REFERENCES historia(idHistoria),
	CONSTRAINT FK_historia_paciente_medico FOREIGN KEY (idMedico) REFERENCES medico(idMedico)
);


-- CentroMedico.dbo.pago_paciente definition

-- Drop table

-- DROP TABLE CentroMedico.dbo.pago_paciente;

CREATE TABLE pago_paciente (
	idPago bigint NOT NULL,
	idPaciente bigint NOT NULL,
	idTurno bigint NOT NULL,
	CONSTRAINT PK__pago_pac__82C033A9ECF1191C PRIMARY KEY (idPago,idPaciente,idTurno),
	CONSTRAINT FK_pago_paciente_paciente FOREIGN KEY (idPaciente) REFERENCES paciente(idPaciente),
	CONSTRAINT FK_pago_paciente_pago FOREIGN KEY (idPago) REFERENCES pago(idPago),
	CONSTRAINT FK_pago_paciente_turno FOREIGN KEY (idTurno) REFERENCES turno(idTurno)
);
