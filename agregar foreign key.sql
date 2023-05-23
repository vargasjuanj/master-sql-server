
--------------------
CREATE TABLE humano (
idHumano INT IDENTITY NOT NULL PRIMARY KEY,
nombre INT,
idMascota INT
)

CREATE TABLE mascota (
idMascota INT IDENTITY NOT NULL PRIMARY KEY,
patas INT
)

ALTER TABLE humano ADD FOREIGN KEY(idMascota) REFERENCES mascota(idMascota)
-----------------------

--paciente -> pais

ALTER TABLE paciente

ADD FOREIGN KEY(idPais) REFERENCES pais(idPais)


-- historia_paciente -> paciente

--esta forma da error, por que historia_paciente tiene llave compuesta, y los foreign key solo pueden ser referenciadas a una tabla que tenga una única llave primaria

--ALTER TABLE paciente ADD FOREIGN KEY (idPaciente) REFERENCES (idPaciente)

--forma correcta

ALTER TABLE historia_paciente ADD FOREIGN KEY (idPaciente) REFERENCES (idPaciente)




