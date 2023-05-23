
/*
SP_HELP: Ayuda a obtener el detalle de los objetos que tenemos definidos en nuestra base de datos.
Ya sean tablas, stored procedures o vistas
*/

-- Lo marca en color marrón porque es un proceso de sistema
-- Le pasamos como parametro un objeto de nuestra base de datos

--SP_HELP paciente
SP_HELP ALTA_Turno -- stored procedure


/*
SP_HELPTEXT: A diferencia del anterior solo recibe un stored procedure 
me muestra el stored procedure, me ahorra tiempo al mostrarmelo todo para copiarlo, modificarlo y ejecutarlo
*/

sp_helptext alta_turno

-- Para crear shortcuts ir  a menu tools - options - enviorements - keyboards - Query shourcuits 
-- Por defecto sp_help esta con Alt+f1 y sp_helptext con ctrl+3. Cerrar la solapa y volver a brir otra query