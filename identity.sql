


CREATE TABLE prueba (

--IDENTITY(2,3) El primer argumento es desde que numero empieza y el segundo el incrmento es decir id 2, 5 , 8. Es solo aplicable a núemros

idPrueba BIGINT IDENTITY(1,1) NOT NULL PRIMARY KEY,
descripcion varchar(10) --NULL es opcional

)