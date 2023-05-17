--DECLARE @ordenamiento CHAR(1) = 'A' --declaración e inicialización

DECLARE @ordenamiento CHAR(1) -- declaración, valor queda en null
DECLARE @valorOrdenamiento CHAR(1)

-- SET @ordenamiento = 'D' -- asi la podemos inicializar

-- El segundo argumento que recibe ISNULL es en el caso de que el primer argumento sea NULL
SET @valorOrdenamiento = ISNULL(@ordenamiento, 'F')

PRINT @valorOrdenamiento