
-- se utilizan en los casos que queremos almacenar en las tablas la fecha y la hora en que el registro fue creado


SELECT GETDATE() -- muestra la hora del lugar o servidor donde esta instalado el sql server. Por ejemplo si estuviera alojado en USA, y estamos en Argentina debemos restarle o sumarle la diferencia horaria
SELECT GETUTCDATE()  --trae la hora definida por el meridiano de grenwich