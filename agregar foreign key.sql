


--paciente -> pais

ALTER TABLE paciente

ADD FOREIGN KEY(idPaciente) REFERENCES pais(idPaciente)


-- historia_paciente -> paciente

--esta forma da error, por que historia_paciente tiene llave compuesta, y los foreign key solo pueden ser referenciadas a una tabla que tenga una única llave primaria

--ALTER TABLE paciente ADD FOREIGN KEY (idPaciente) REFERENCES (idPaciente)

--forma correcta

ALTER TABLE historia_paciente ADD FOREIGN KEY (idPaciente) REFERENCES (idPaciente)




