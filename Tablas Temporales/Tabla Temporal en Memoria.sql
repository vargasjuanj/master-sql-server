
/*
Va a existir mientras el script se este ejecutando, cuando termine de ejecutarse el script no va a existir más
*/

DECLARE @mitabla TABLE (id bigint IDENTITY(1,1), pais VARCHAR(50))

INSERT INTO @mitabla VALUES ('MEXICO')
INSERT INTO @mitabla VALUES ('PERU')
INSERT INTO @mitabla VALUES ('ARGENTINA')
INSERT INTO @mitabla VALUES ('COLOMBIA')
INSERT INTO @mitabla VALUES ('ECUADOR')

SELECT * FROM @mitabla