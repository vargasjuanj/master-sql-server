
/*
-- Es una sentencia SELECT especifica almacenada en la bd
Basicamente lo que hace la vista es almacenar una consulta en la bd localmente, y cuando ejecutamos la vista lo que hace es actualizarse y devolvernos los datos actualizados.
Lo que hace sql es guardarse una copia de la consulta para devovler los datos mas rapido
Es decir que nos sirve para guardar consultas especificas que nos va a servir para ahorrar mucho codigo cuando tengamos consultas grandes.
	y entonces directamente lo que hacemos ejecutar el select que invoca esa vista y tranquilamente lo podemos combinar un inner JOIN y demas, como si fuera una tabla más

Una vez ejecutado el script se crea la vista, y al poner design sobre esta se abre un esquema donde sale la conexion de las tablas, campos usados y script, con los campos habilitados o deshabilitados en cada tabla, dependiendo cuales se usen
El diagrama es muy parecido al diagrama entidad relación. En el detalle hace como un join automaticamente. Para unir tablas, agarramos el campo y lo arrastramos hasta la tabla a unir. Y automaticamente en el detalle (en el script de abajo) conecta con inner join
La flecha debe salir desde la que tiene la fk
Se puede crear desde el entorno (visualmente) o a traves de script

El tratamiento que se le da a una vista una vez creada es lo mismo que una tabla, hacemos de cuenta que es una tabla


*/

/*
obtenemos los datos de la vista creada

SELECT * FROM PacientesYTurnosPendientes

-- probamos la vista creada desde la interfaz

SELECT * FROM VistaPruebaInterfazGrafica
*/

/*
Para crear esta vista visualmente como el script, una vez unidas las tablas,
agregamos en el recuadro de abajo los campos que queramos que aparesca. Y en la columna filter, del campo estado agregamos = 0, esto reemplazaria el where. Y lo coloca automatimente en el script. 
El isnull lo modificamos desde el recuadro del script
*/


ALTER VIEW PacientesYTurnosPendientes 

AS

SELECT p.nombre, p.idPaciente, p.apellido, t.idTurno, t.estado 
FROM paciente p  -- con asterico + devuelve campos repetidos
INNER JOIN turno_paciente tp
ON tp.idPaciente = p.idPaciente
INNER JOIN turno t
ON t.idTurno = tp.idTurno
WHERE ISNULL(t.estado,0) = 0 -- Lo salvamos con un isnull por las dudas, si ese campo llega a estar en null le asignamos un cero por default

