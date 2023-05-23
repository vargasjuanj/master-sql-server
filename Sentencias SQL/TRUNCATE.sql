

-- En vez de eliminar una tabla como el DROP, elimina por completo los registros de una tabla
-- y resetea los valores de los campos identity

CREATE TABLE ejemplo (id INT IDENTITY(1,1), campo1 INT, campo2 INT)
SELECT * FROM ejemplo
INSERT INTO ejemplo (campo1, campo2) VALUES(2,3)


TRUNCATE TABLE ejemplo
SELECT * FROM ejemplo
INSERT INTO ejemplo (campo1, campo2) VALUES(5,10)
SELECT * FROM ejemplo

