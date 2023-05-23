
-- CREAR TABLA

USE [CentroMedico]
GO

/****** Object:  Table [dbo].[historia]    Script Date: 23/05/2023 13:06:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[historia](
	[idHistoria] [dbo].[historia] IDENTITY(1,1) NOT NULL,
	[fechaHistoria] [datetime] NULL,
	[observacion] [dbo].[observacion] NULL,
 CONSTRAINT [PK_idHistoria] PRIMARY KEY CLUSTERED  -- asi maneja la pk transact sql
(
	[idHistoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


-- CREAR TIPO DE DATA Y FUNCION

CREATE TYPE tipo2 FROM CHAR(3)

nombrefun (3)  -- no devuelve nada porque se le debe poner el select adelante si es una función
SELECT dbo.nombrefun (3) -- se le debe poner el nombre del esquema ques dbo, si no no la toma salta este error: 'nombrefun' no es un nombre de función integrada reconocido.


-- con alter es para modificarla
ALTER FUNCTION nombrefun (@var INT) -- parametro que recibe
RETURNS INT -- tipo de dato que retorna, RETURNS con 'S'

AS

BEGIN   -- CUERPO, como en el store procedure

SET @var = @var * 5
RETURN @var
END

