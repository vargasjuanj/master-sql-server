
/*
-- Asignar un esquema a un objeto, a una tabla o store procedure
Un Schema es un espacio de nombres que agrupa objetos. Y estos objetos pueden ser tablas, stored procedures, vistas, funciones, tipos de datos, etc

Todos estos objetos se agrupan en espacios de nombres separados.

A parte del usuari dbo. Si entramos desde la carpeta security-schemas de cada bd, podemos encontrar el schema 'dbo', a diferencia del usuario 'dbo'

El usuario dbo está asignado al login 'sa' y a su vez el usuario 'dbo' pertenece al schema 'dbo' y puede visualizar todo lo que está dentro de ese schema.

Las tablas u otro objeto, tienen asignado cierto esquema, ejemplo dbo.turno, dbo.paciente todo dentro de una misma bd, pero pueden haber tablas que tengan otro asignado otro esquema
	por ejemplo prueba.especialidad prueba.direccion.
	Si el usuario no tiene asignado el schema 'prueba' no podrar ver esas tablas, solo podrá ver los objetos del esquema especifico que tenga asignado

# Los esquemas de base de datos los podemos utilizar si queremos aislar ciertas tablas de determinado sector de la empreza. Por ejemplo queremos que el sector de facturacion vea ciertas tablas con facturacion
	para eso hacemos cierto esquema y colocaremos los objetos bajo ese schema
Entonces el usuario solo visualizaria las tablas que tenga asignada el esquema al q pertenece el usario

# Para crear un esquema lo hacemos desde la carpeta Security especifica, new schema, y colocamos el nombre y le asignamos un propietario. Por ej, esquema 'Facturacion'
# Para usar el esquema hacemos lo siguiente:
  . Luego creamos un login por ejemplo jose, base de datos por default centro medico, y mapeamos ese login, para que creee tambien el usuario en centromedico.
  . Hacemos doble click sobre ese usuario y en schema relation o algo asi, tildamos 'Facturacion'
  . Volvemos a conectarnaos a otra instancia, ingresamos con el login jose y veremos que no aparece ninguna tabla, a pesar de ser usuarios de CentroMedico, eso se debe a que las otras tablas y demas objetos estan bajo el esquema 'dbo'
  . Volvemos al login 'sa' y ahi hacemos el cambio de esquema de la tabla, podemos ver las distintas tablas con los distintos schemas asignados



*/

-- Ya estando de vuelta en el login 'sa' ejecutamos lo siguiente para cambiarle el esquema a cierta tabla
ALTER SCHEMA facturacion TRANSFER pais; -- sin el punto y coma, me salta error en el select de abajo

-- ahora esta sentencia va a saltar error, porque al tener dos esquemas debo colocar a cual esquema pertenece
SELECT * FROM facturacion.pais
-- y si desde el usuario juan quisiera acceder a una tabla que está en otro schema va a saltar que no tengo permisos, permiso denegado, no tengo permiso a ese objeto.


