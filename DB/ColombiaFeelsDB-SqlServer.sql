USE [master]
GO
/****** Object:  Database [ColombiaFeels]    Script Date: 30/04/2017 0:54:38 ******/
CREATE DATABASE [ColombiaFeels]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ColombiaFeels', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ColombiaFeels.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ColombiaFeels_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ColombiaFeels_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ColombiaFeels] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ColombiaFeels].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ColombiaFeels] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ColombiaFeels] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ColombiaFeels] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ColombiaFeels] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ColombiaFeels] SET ARITHABORT OFF 
GO
ALTER DATABASE [ColombiaFeels] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ColombiaFeels] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ColombiaFeels] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ColombiaFeels] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ColombiaFeels] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ColombiaFeels] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ColombiaFeels] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ColombiaFeels] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ColombiaFeels] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ColombiaFeels] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ColombiaFeels] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ColombiaFeels] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ColombiaFeels] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ColombiaFeels] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ColombiaFeels] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ColombiaFeels] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ColombiaFeels] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ColombiaFeels] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ColombiaFeels] SET RECOVERY FULL 
GO
ALTER DATABASE [ColombiaFeels] SET  MULTI_USER 
GO
ALTER DATABASE [ColombiaFeels] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ColombiaFeels] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ColombiaFeels] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ColombiaFeels] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ColombiaFeels', N'ON'
GO
USE [ColombiaFeels]
GO
/****** Object:  StoredProcedure [dbo].[XP_CRUD_Personas]    Script Date: 30/04/2017 0:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*---------------------------------------------------------------------------------------------------------------------
Esquema:
Autor: Xiomara Andrea Pulido
Pruebas:
-------------------------------------------------------------------------------------------------------------------------*/
CREATE PROCEDURE [dbo].[XP_CRUD_Personas]
@Op VARCHAR(5) = '-1',
@Usuario VARCHAR(50) = '-1',
@Contraseña VARCHAR(250) = '-1',
@Nombres VARCHAR(250) = '-1', 
@Apellidos VARCHAR(250), 
@Id_TipoDoc INT = '-1', 
@NumDoc VARCHAR(50) = '-1', 
@Correo VARCHAR(250) = '-1', 
@Telefono VARCHAR(250) = '-1', 
@Id_Ciudad INT
AS BEGIN
		IF(@Op = '0')
		BEGIN

			SELECT	*
			FROM	P_Personas P
			WHERE	P.Correo = @Usuario
			AND		P.Contraseña = @Contraseña
		END
		IF(@Op = '1')
		BEGIN

			INSERT INTO P_Personas (Nombres, Apellidos, Id_TipoDoc, NumDoc, Correo, Telefono, Contraseña, Id_Ciudad)  
			VALUES (@Nombres, @Apellidos, @Id_TipoDoc, @NumDoc, @Correo, @Telefono, @Contraseña, @Id_Ciudad)
		END
		

END
GO
/****** Object:  Table [dbo].[A_Actividades]    Script Date: 30/04/2017 0:54:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[A_Actividades](
	[Id_Actividad] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](500) NULL,
 CONSTRAINT [PK_A_Actividades] PRIMARY KEY CLUSTERED 
(
	[Id_Actividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AM_ActividadModulo]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AM_ActividadModulo](
	[Id_Actividad] [int] NOT NULL,
	[Id_Modulo] [int] NOT NULL,
	[Id_ActividadModulo] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AM_ActividadModulo] PRIMARY KEY CLUSTERED 
(
	[Id_ActividadModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AP_ActividadPersona]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AP_ActividadPersona](
	[Id_ActividadPersona] [int] IDENTITY(1,1) NOT NULL,
	[Id_ActividadModulo] [int] NULL,
	[Estado] [int] NULL,
 CONSTRAINT [PK_AP_ActividadPersona] PRIMARY KEY CLUSTERED 
(
	[Id_ActividadPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[I_Insignias]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[I_Insignias](
	[Id_Insignia] [int] IDENTITY(1,1) NOT NULL,
	[Id_Progreso] [int] NULL,
	[Id_ActividadPersona] [int] NULL,
	[Id_TipoInsignia] [int] NULL,
 CONSTRAINT [PK_I_Insignias] PRIMARY KEY CLUSTERED 
(
	[Id_Insignia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[M_Modulos]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[M_Modulos](
	[Id_Modulo] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](500) NULL,
	[Id_TipoModulo] [int] NULL,
 CONSTRAINT [PK_M_Modulos] PRIMARY KEY CLUSTERED 
(
	[Id_Modulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[P_Personas]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[P_Personas](
	[Id_Persona] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](250) NULL,
	[Apellidos] [varchar](250) NULL,
	[Id_TipoDoc] [int] NULL,
	[NumDoc] [varchar](50) NULL,
	[Correo] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Contraseña] [varchar](50) NULL,
	[Id_Ciudad] [int] NULL,
 CONSTRAINT [PK_Personas] PRIMARY KEY CLUSTERED 
(
	[Id_Persona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PR_Progreso]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PR_Progreso](
	[Id_Progreso] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](250) NULL,
	[Id_Actividad] [int] NULL,
 CONSTRAINT [PK_PR_Progreso] PRIMARY KEY CLUSTERED 
(
	[Id_Progreso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRE_Pregunta]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRE_Pregunta](
	[Id_Preguntas] [int] IDENTITY(1,1) NOT NULL,
	[Pregunta] [varbinary](500) NULL,
	[Id_Respuesta] [int] NULL,
 CONSTRAINT [PK_PRE_Pregunta] PRIMARY KEY CLUSTERED 
(
	[Id_Preguntas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[R_Respuesta]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[R_Respuesta](
	[Id_Respuesta] [int] IDENTITY(1,1) NOT NULL,
	[Respuesta] [varchar](500) NULL,
 CONSTRAINT [PK_R_Respuesta] PRIMARY KEY CLUSTERED 
(
	[Id_Respuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_Test]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[T_Test](
	[Id_Test] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](500) NULL,
	[Id_Actividad] [int] NULL,
 CONSTRAINT [PK_T_Test] PRIMARY KEY CLUSTERED 
(
	[Id_Test] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[T_TestPersona]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TestPersona](
	[Id_TestPersona] [int] IDENTITY(1,1) NOT NULL,
	[Id_Test] [int] NULL,
	[Id_Persona] [int] NULL,
	[Estado] [int] NULL,
	[Caificacion] [int] NULL,
 CONSTRAINT [PK_T_TestPersona] PRIMARY KEY CLUSTERED 
(
	[Id_TestPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TI_TipoInsignia]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TI_TipoInsignia](
	[Id_TipoInsignia] [int] NOT NULL,
	[Tipo] [int] NULL,
	[Descripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TI_TipoInsignia] PRIMARY KEY CLUSTERED 
(
	[Id_TipoInsignia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TM_TiposModulos]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TM_TiposModulos](
	[Id_TipoModulo] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NULL,
 CONSTRAINT [PK_TM_TiposModulos] PRIMARY KEY CLUSTERED 
(
	[Id_TipoModulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TP_TiposDocumento]    Script Date: 30/04/2017 0:54:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TP_TiposDocumento](
	[Id_Tipo] [int] NOT NULL,
	[Tipo] [varchar](50) NULL,
 CONSTRAINT [PK_TP_TiposDocumento] PRIMARY KEY CLUSTERED 
(
	[Id_Tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[P_Personas] ON 

INSERT [dbo].[P_Personas] ([Id_Persona], [Nombres], [Apellidos], [Id_TipoDoc], [NumDoc], [Correo], [Telefono], [Contraseña], [Id_Ciudad]) 
VALUES (1, N'Xiomara Andrea', N'Pulido Balmaceda', 1, N'1031148207', N'xiomaraa.pulido@gmail.com', N'3193921909', N'Qwertyuiop', NULL)
SET IDENTITY_INSERT [dbo].[P_Personas] OFF
INSERT [dbo].[TP_TiposDocumento] ([Id_Tipo], [Tipo]) VALUES (1, N'CedulaCiudadania')
INSERT [dbo].[TP_TiposDocumento] ([Id_Tipo], [Tipo]) VALUES (2, N'TargetaIdentidad')
INSERT [dbo].[TP_TiposDocumento] ([Id_Tipo], [Tipo]) VALUES (3, N'CedulaExtranjeria')
INSERT [dbo].[TP_TiposDocumento] ([Id_Tipo], [Tipo]) VALUES (4, N'Pasaporte')

ALTER TABLE [dbo].[AM_ActividadModulo]  WITH CHECK ADD  CONSTRAINT [FK_AM_ActividadModulo_M_Modulos] FOREIGN KEY([Id_Modulo])
REFERENCES [dbo].[M_Modulos] ([Id_Modulo])
GO
ALTER TABLE [dbo].[AM_ActividadModulo] CHECK CONSTRAINT [FK_AM_ActividadModulo_M_Modulos]
GO
ALTER TABLE [dbo].[AM_ActividadModulo]  WITH CHECK ADD  CONSTRAINT [FK_AM_ActividadModulo_M_Modulos1] FOREIGN KEY([Id_Modulo])
REFERENCES [dbo].[M_Modulos] ([Id_Modulo])
GO
ALTER TABLE [dbo].[AM_ActividadModulo] CHECK CONSTRAINT [FK_AM_ActividadModulo_M_Modulos1]
GO
ALTER TABLE [dbo].[AP_ActividadPersona]  WITH CHECK ADD  CONSTRAINT [FK_AP_ActividadPersona_AM_ActividadModulo] FOREIGN KEY([Id_ActividadModulo])
REFERENCES [dbo].[AM_ActividadModulo] ([Id_ActividadModulo])
GO
ALTER TABLE [dbo].[AP_ActividadPersona] CHECK CONSTRAINT [FK_AP_ActividadPersona_AM_ActividadModulo]
GO
ALTER TABLE [dbo].[I_Insignias]  WITH CHECK ADD  CONSTRAINT [FK_I_Insignias_AP_ActividadPersona] FOREIGN KEY([Id_ActividadPersona])
REFERENCES [dbo].[AP_ActividadPersona] ([Id_ActividadPersona])
GO
ALTER TABLE [dbo].[I_Insignias] CHECK CONSTRAINT [FK_I_Insignias_AP_ActividadPersona]
GO
ALTER TABLE [dbo].[I_Insignias]  WITH CHECK ADD  CONSTRAINT [FK_I_Insignias_PR_Progreso] FOREIGN KEY([Id_Progreso])
REFERENCES [dbo].[PR_Progreso] ([Id_Progreso])
GO
ALTER TABLE [dbo].[I_Insignias] CHECK CONSTRAINT [FK_I_Insignias_PR_Progreso]
GO
ALTER TABLE [dbo].[I_Insignias]  WITH CHECK ADD  CONSTRAINT [FK_I_Insignias_TI_TipoInsignia] FOREIGN KEY([Id_TipoInsignia])
REFERENCES [dbo].[TI_TipoInsignia] ([Id_TipoInsignia])
GO
ALTER TABLE [dbo].[I_Insignias] CHECK CONSTRAINT [FK_I_Insignias_TI_TipoInsignia]
GO
ALTER TABLE [dbo].[M_Modulos]  WITH CHECK ADD  CONSTRAINT [FK_M_Modulos_TM_TiposModulos] FOREIGN KEY([Id_Modulo])
REFERENCES [dbo].[TM_TiposModulos] ([Id_TipoModulo])
GO
ALTER TABLE [dbo].[M_Modulos] CHECK CONSTRAINT [FK_M_Modulos_TM_TiposModulos]
GO
ALTER TABLE [dbo].[P_Personas]  WITH CHECK ADD  CONSTRAINT [FK_P_Personas_TP_TiposDocumento] FOREIGN KEY([Id_TipoDoc])
REFERENCES [dbo].[TP_TiposDocumento] ([Id_Tipo])
GO
ALTER TABLE [dbo].[P_Personas] CHECK CONSTRAINT [FK_P_Personas_TP_TiposDocumento]
GO
ALTER TABLE [dbo].[PR_Progreso]  WITH CHECK ADD  CONSTRAINT [FK_PR_Progreso_A_Actividades] FOREIGN KEY([Id_Actividad])
REFERENCES [dbo].[A_Actividades] ([Id_Actividad])
GO
ALTER TABLE [dbo].[PR_Progreso] CHECK CONSTRAINT [FK_PR_Progreso_A_Actividades]
GO
ALTER TABLE [dbo].[PRE_Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_PRE_Pregunta_R_Respuesta] FOREIGN KEY([Id_Respuesta])
REFERENCES [dbo].[R_Respuesta] ([Id_Respuesta])
GO
ALTER TABLE [dbo].[PRE_Pregunta] CHECK CONSTRAINT [FK_PRE_Pregunta_R_Respuesta]
GO
ALTER TABLE [dbo].[T_Test]  WITH CHECK ADD  CONSTRAINT [FK_T_Test_A_Actividades] FOREIGN KEY([Id_Actividad])
REFERENCES [dbo].[A_Actividades] ([Id_Actividad])
GO
ALTER TABLE [dbo].[T_Test] CHECK CONSTRAINT [FK_T_Test_A_Actividades]
GO
ALTER TABLE [dbo].[T_TestPersona]  WITH CHECK ADD  CONSTRAINT [FK_T_TestPersona_P_Personas] FOREIGN KEY([Id_Persona])
REFERENCES [dbo].[P_Personas] ([Id_Persona])
GO
ALTER TABLE [dbo].[T_TestPersona] CHECK CONSTRAINT [FK_T_TestPersona_P_Personas]
GO
ALTER TABLE [dbo].[T_TestPersona]  WITH CHECK ADD  CONSTRAINT [FK_T_TestPersona_T_Test] FOREIGN KEY([Id_Test])
REFERENCES [dbo].[T_Test] ([Id_Test])
GO
ALTER TABLE [dbo].[T_TestPersona] CHECK CONSTRAINT [FK_T_TestPersona_T_Test]
GO
USE [master]
GO
ALTER DATABASE [ColombiaFeels] SET  READ_WRITE 
GO


/****** FELIPE CHAUX Proceso almacenado modulos ******/
USE [ColombiaFeels]
GO
/****** Object:  StoredProcedure [dbo].[FC_CRUD_Modulos]    Script Date: 05/22/2017 10:06:42 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FC_CRUD_Modulos]
	-- Add the parameters for the stored procedure here
	@idmodulo int = 0, 
	@tipo int = 0,
	@nombre varchar(50) = '',
	@descripcion varchar(500) = '',
	@idtipomodulo int = 0
AS
BEGIN
	if (@tipo = 1)
	BEGIN
	SELECT * FROM M_Modulos
	END
	if (@tipo = 2)
	BEGIN
    UPDATE M_Modulos set Nombre=@nombre,Descripcion=@descripcion,Id_TipoModulo=@idtipomodulo 
    WHERE Id_Modulo = @idmodulo
	END
	if (@tipo = 3)
	BEGIN
    INSERT M_Modulos(Nombre,Descripcion,Id_TipoModulo) VALUES (@nombre,@descripcion,@idtipomodulo)
	END
END
GO


/****** agregar columna idPersona a AP_ActividadPersona  JHON RAMIREZ ******/
ALTER TABLE AP_ActividadPersona ADD Id_Persona int not null

ALTER TABLE [dbo].[AP_ActividadPersona]  WITH CHECK ADD  CONSTRAINT [FK_AP_ActividadPersona_P_Personas] FOREIGN KEY([Id_Persona])
REFERENCES [dbo].[P_Personas] ([Id_Persona])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[AP_ActividadPersona] CHECK CONSTRAINT [FK_AP_ActividadPersona_P_Personas]
GO


/****** agregar los tipos de insignias a la base de datos  JHON RAMIREZ ******/
USE [ColombiaFeels]
GO
INSERT INTO [dbo].[TI_TipoInsignia]
           ([Id_TipoInsignia]
           ,[Tipo]
           ,[Descripcion])
     VALUES
           ('1', '25', 'Civil')
GO
USE [ColombiaFeels]
GO
INSERT INTO [dbo].[TI_TipoInsignia]
           ([Id_TipoInsignia]
           ,[Tipo]
           ,[Descripcion])
     VALUES
           ('2', '50', 'Combatiente')
GO
USE [ColombiaFeels]
GO
INSERT INTO [dbo].[TI_TipoInsignia]
           ([Id_TipoInsignia]
           ,[Tipo]
           ,[Descripcion])
     VALUES
           ('3', '75', 'Veterano')
GO


/****** Procedimiento almacenado insginias JHON RAMIREZ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jhon Ramirez
-- Create date: 17-05-2017
-- Description:	
-- =============================================
CREATE PROCEDURE JR_crud_insignias
	@Op int = 0,
	@Id_Insignia int = 0,
	@Id_Progreso int = 0,
	@Id_ActividadPersona int = 0,
	@Id_TipoInsignia int = 0,
	@Id_persona int = 0,  -- Variable agregada de AP_ActividadPersona ver la Op = 1
	@Id_modulo int = 0  -- Variable agregada de AM_ActividadModulo ver la Op = 1
AS
BEGIN
    IF (@Op = 1)
	BEGIN
		SELECT I.Id_TipoInsignia, AP.Id_Persona, AM.Id_Modulo 
		  FROM I_Insignias I, AP_ActividadPersona AP, AM_ActividadModulo AM
		 WHERE AP.Id_ActividadPersona = I.Id_ActividadPersona
		   AND AP.Id_ActividadModulo = AM.Id_ActividadModulo 
		   AND AP.Id_Persona = @Id_persona
		   AND AM.Id_Modulo = @Id_modulo
	END
END
GO


/****** Procedimiento actividad_persona insginias JHON RAMIREZ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jhon Ramirez
-- Create date: 17-05-2017
-- Description:	
-- =============================================
CREATE PROCEDURE JR_actividad_persona
	@Op int = 0,
	@Id_ActividadPersona int = 0,
    @Id_ActividadModulo int = 0,
    @Estado int = 0,
    @Id_Persona int = 0
AS
BEGIN
    IF (@Op = 1)
	BEGIN
		SELECT Id_ActividadPersona FROM AP_ActividadPersona WHERE Id_Persona = @Id_Persona
	END
END
GO

/****** Agregar tipo de modulo por defecto a la base de datos JHON RAMIREZ ******/
USE [ColombiaFeels]
GO

INSERT INTO [dbo].[TM_TiposModulos]
           ([Tipo])
     VALUES
           ('Ninguno')
GO

/****** Agregar modulos principales a la base de datos JHON RAMIREZ ******/
USE [ColombiaFeels]
GO
INSERT INTO [dbo].[M_Modulos]
           ([Nombre]
           ,[Descripcion]
           ,[Id_TipoModulo])
     VALUES
           ('Material - 1'
           ,'Los caminos de la memoria histórica.'
           ,'1')

INSERT INTO [dbo].[M_Modulos]
           ([Nombre]
           ,[Descripcion]
           ,[Id_TipoModulo])
     VALUES
           ('Material - 2'
           ,'Portete: El Camino hacia la Paz - Guía de maestros y maestras.'
           ,'1')

INSERT INTO [dbo].[M_Modulos]
           ([Nombre]
           ,[Descripcion]
           ,[Id_TipoModulo])
     VALUES
           ('Material - 3'
           ,'Portete: El Camino hacia la Paz - Libro para estudiantes.'
           ,'1')

INSERT INTO [dbo].[M_Modulos]
           ([Nombre]
           ,[Descripcion]
           ,[Id_TipoModulo])
     VALUES
           ('Material - 4'
           ,'Guía para maestros y maestras sobre la masacre de El Saldo.'
           ,'1')

INSERT INTO [dbo].[M_Modulos]
           ([Nombre]
           ,[Descripcion]
           ,[Id_TipoModulo])
     VALUES
           ('Material - 5'
           ,'El Salado, Montes de María: tierra de luchas y contrastes.'
           ,'1')
GO
/*---------------------------------------------------------------------------------------------------------------------
Esquema:
Autor: Xiomara Andrea Pulido

Pruebas: Se corrigue el error al alterar el proceso almacenado en apellidos falta establecer valor por defecto en la variable
@Apellidos, para la primera opcion de consulta de usuarios por usuario y contraseña, corregido por John Ramirez
-------------------------------------------------------------------------------------------------------------------------*/
ALTER PROCEDURE [dbo].[XP_CRUD_Personas]
@Op VARCHAR(5) = '-1',
@Usuario VARCHAR(50) = '-1',
@Contraseña VARCHAR(250) = '-1',
@Nombres VARCHAR(250) = '-1', 
@Apellidos VARCHAR(250) = '-1',  
@Id_TipoDoc INT = '-1', 
@NumDoc VARCHAR(50) = '-1', 
@Telefono VARCHAR(250) = '-1'
AS BEGIN
		IF(@Op = '0')
		BEGIN

			SELECT	*
			FROM	P_Personas P
			WHERE	P.Correo = @Usuario
			AND		P.Contraseña = @Contraseña
		END
		IF(@Op = '1')
		BEGIN

			INSERT INTO P_Personas (Nombres, Apellidos, Id_TipoDoc, NumDoc, Correo, Telefono, Contraseña)  
			VALUES (@Nombres, @Apellidos, @Id_TipoDoc, @NumDoc, @Usuario, @Telefono, @Contraseña)
		END
		

END