USE [mi_BaseDatos1]
GO

/****** Object:  Table [dbo].[Empleados]    Script Date: 3/04/2026 16:09:10 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Empleados](
	[IDempleado] [int] NULL,
	[Nombre] [varchar](20) NULL,
	[Apellidos] [varchar](20) NULL,
	[Edad] [numeric](2, 0) NULL,
	[Telefono] [numeric](11, 0) NULL,
	[Direccion] [varchar](50) NULL,
	[Fecha_nacimiento] [date] NULL,
	[Sueldo] [decimal](20, 2) NULL,
	[activo] [char](2) NULL
) ON [PRIMARY]
GO


