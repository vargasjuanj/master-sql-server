
-- Reemplza un caracter por otro en un tipo string-char o campo de una tabla

DECLARE @var1 VARCHAR(20) = 'Ramir"o'
DECLARE @var2 VARCHAR(20) = 'Gonz@alez'

-- Recibe tres parametros el primero es el string o char, el segundo parametro es el que yo quiero buscar y el tercer parametro es el por cual voy a reemplazar el segundo

SELECT REPLACE(@var1,'"','')
SELECT REPLACE(@var2,'@','') -- con print no sale nada

