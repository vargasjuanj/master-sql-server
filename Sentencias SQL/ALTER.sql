

-- agrego el campo estado
ALTER TABLE paciente ADD estado SMALLINT
SELECT * FROM paciente

-- ahora ese campo estado agregado me arrepentí y quiero modificarlo para cambiarlo el tipo de dato
ALTER TABLE paciente ALTER COLUMN estado BIT
SP_HELP paciente

-- ahora lo quiero eliminar
ALTER TABLE paciente DROP COLUMN 
SP_HELP