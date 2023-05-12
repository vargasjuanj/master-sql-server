


CREATE TABLE table1 (

col1 INT IDENTITY(1,1) PRIMARY KEY,
col2 INT 

)

--Salta error cuando dentro de values pongo el valor de la col1 porque col1 tiene identity
--insert into table1 values (1,3) // Para poder insertar en el campo que tiene identity true, hay que hacer lo siguiente :  SET IDENTITY_INSERT table1 ON
-- Luego hay que desactivarlo con , luego volverlo a desactivar SET IDENTITY_INSERT table1 OFF porque si se deja activado podemos meter ids repetidos, ya que no verifica eso. A menos que sea una pk, ahi si salta error
-- Otra cosa que hay que tener en cuenta es que al realizar el insert hay que colocar el campo, sino salta error. Ej: insert into table1 (id,col) values (10,asd)

insert into table1 values (1) --aca toma a col2
insert into table1 (col2) values (2)
insert into table1 values (90)


set identity_insert table1 on
insert into table1 (col1, col2) values (14,50) 
set identity_insert table1 off



select * from table1


-- Para restablecer el identity primero hay que borrar los datos de la tabla y después usar la función CHECKIDENT, Y al agregar nuevos registros se verá reflejado

--elimina todos los datos

delete from table1

-- en el segundo parametro le digo que quiero hacer un RESEED, y el tercer parametro desde donde quiero que comience, en este caso 0
dbcc CHECKIDENT ('table1', RESEED, 0)


