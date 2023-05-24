

-- Obtiene un intervalo especifico de la fecha

-- Un intervalo especifico para esta función es dw, que devuelve el día de la semana
SELECT DATEPART(month,GETDATE()) -- si estamos en mayo devuelve 5, el mes 5
SELECT DATEPART(dw,GETDATE()) -- dia 3 es miercoles, domingo 0