
/*
Una transaccion normalmente se utiliza para evaluar una porción de codigo en la que estamos actualizando o borrando datos, update y delete, tambien lo vamos a configurar para validar inserts
*/

select * from paciente

/*
Cuando se inicia una transacción los comandos que siguen despues hacen que la tabla involucrada en este caso pacientes
quede loqueoada hasta que ejecutemos un commit o rollback.
Por que cuando iniciemos la transaccion lo que esta esperando esta, es un commit o rollback para poder continuar,
sino queda en espera hasta que esa transacción finalice.
Entonces si nosotros no colocamos un commit o rollback esa tabla involucrada va a quedar loqueoada, por lo que vamos a tener
resultados en las bases de datos, vamos a tener loqueos de estos usuarios que van a querer consultarla y no van a poder.
Por ende vamos a tener un loqueo allí y vamos a tener que solucionarlo.
Y es terminar la transacción, realizar un commit o un rollback



*/
BEGIN TRAN  -- o BEGIN TRANSACTION es lo mismo
	UPDATE paciente SET telefono = 444 WHERE idPaciente = 8
-- si es igual a 1 significa que el update se realizo sobre un paciente no más
	IF (@@ROWCOUNT = 1) -- Variable del sistema, esta instrucción nos dice cuantos registros fueron modificados en la instrucción interior (eliminados, seleccionados, actualizados, insertados)
		COMMIT TRAN -- confirma la transacción si la validacion es true. Si no ejecutamos un commit el update no se hace efectivo
	ELSE -- supongamos que devolvio 2, por algun motivo actualizo dos registros, lo que hago ahi es un rollback
		ROLLBACK TRAN -- Me cancela el update y me deja el resultado tal como estaba


SELECT * FROM paciente

-- se fuerza a que vaya al else porque en la tabla en este momento hay varios 'Perez'
-- Al ejecutarlo va a salir 3 row afectadas, pero al revisar la tabla no hay ningun cambio porque hizo el rollback
BEGIN TRAN
	UPDATE paciente SET telefono = 444 WHERE apellido = 'Perez'
	IF (@@ROWCOUNT = 1) 
		COMMIT TRAN
	ELSE
		ROLLBACK TRAN

SELECT * FROM paciente

-- ejercicio sobre tabla turno
SELECT * FROM turno_estado
SELECT * from turno

	BEGIN TRAN
	    -- Aca se da una sencación distintas. Cuando a nivel de tablas se quieren eliminar las relacionadas se deben empezar por las tablas padres para que deje. Pero a nivel de registro se deben empezar por los registros que tienen los datos de las fk (de las tablas hijas) para que deje eliminar el registro padre.
		-- Puede surgin un error al aliminarlo si en la tabla turno_paciente llegase a estar en idTurno, primero habria que cambiar el idTurno por otro, sino en null no dejaria

		DELETE FROM turno WHERE estado = 3
		if (@@ROWCOUNT = 1) 
			COMMIT TRAN
		ELSE
			ROLLBACK TRAN

SELECT * from turno

	