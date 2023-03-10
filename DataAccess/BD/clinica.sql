USE [master]
GO
/****** Object:  Database [Clinica]    Script Date: 23/01/2023 17:10:22 ******/
CREATE DATABASE [Clinica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Clinica', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Clinica.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Clinica_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Clinica_log.ldf' , SIZE = 2560KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Clinica] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Clinica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Clinica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Clinica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Clinica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Clinica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Clinica] SET ARITHABORT OFF 
GO
ALTER DATABASE [Clinica] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Clinica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Clinica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Clinica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Clinica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Clinica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Clinica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Clinica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Clinica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Clinica] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Clinica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Clinica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Clinica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Clinica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Clinica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Clinica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Clinica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Clinica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Clinica] SET  MULTI_USER 
GO
ALTER DATABASE [Clinica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Clinica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Clinica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Clinica] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Clinica] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Clinica] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Clinica', N'ON'
GO
ALTER DATABASE [Clinica] SET QUERY_STORE = OFF
GO
USE [Clinica]
GO
/****** Object:  User [emanuel]    Script Date: 23/01/2023 17:10:22 ******/
CREATE USER [emanuel] FOR LOGIN [emanuel] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [emanuel]
GO
/****** Object:  Table [dbo].[T_EstadoCivil]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_EstadoCivil](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](15) NULL,
	[Estado] [bit] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[UsuarioModificacion] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_T_EstadoCivil] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_TEstadoCivil_ObtenerCombo]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[V_TEstadoCivil_ObtenerCombo]
AS
SELECT        Id, Nombre
FROM            dbo.T_EstadoCivil
WHERE        (Estado = 1)
GO
/****** Object:  Table [dbo].[T_Pais]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Pais](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[UsuarioModificacion] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Pais] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_TPais_ObtenerCombo]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create VIEW [dbo].[V_TPais_ObtenerCombo]
AS
SELECT 
	Id, Nombre
FROM dbo.T_Pais
WHERE Estado = 1
GO
/****** Object:  Table [dbo].[T_Sexo]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Sexo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](10) NOT NULL,
	[Estado] [bit] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[UsuarioModificacion] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Sexo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_TSexo_ObtenerCombo]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create VIEW [dbo].[V_TSexo_ObtenerCombo]
AS
SELECT 
	Id, Nombre
FROM dbo.T_Sexo
WHERE Estado = 1
GO
/****** Object:  Table [dbo].[T_TipoDocumento]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TipoDocumento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NOT NULL,
	[Estado] [bit] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[UsuarioModificacion] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_T_TipoDocumento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_TTipoDocumento_ObtenerCombo]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Autor: Emanuel Samaniego Calderón
-- Fecha Creación:19/01/2023
-- Descripción: Vista que retornara el tipo de documento
-- =============================================


CREATE VIEW [dbo].[V_TTipoDocumento_ObtenerCombo]
AS
SELECT 
	Id, Nombre
FROM dbo.T_TipoDocumento
WHERE Estado = 1
GO
/****** Object:  Table [dbo].[T_Tratamiento]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Tratamiento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Estado] [bit] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[UsuarioModificacion] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Tratamiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_TTratamiento_ObtenerCombo]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create VIEW [dbo].[V_TTratamiento_ObtenerCombo]
AS
SELECT 
	Id, Nombre
FROM dbo.T_Tratamiento
WHERE Estado = 1
GO
/****** Object:  Table [dbo].[T_Paciente]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_Paciente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPais] [int] NOT NULL,
	[IdEstadoCivil] [int] NOT NULL,
	[IdTipoDocumento] [int] NOT NULL,
	[IdSexo] [int] NOT NULL,
	[NumeroDocumento] [varchar](11) NOT NULL,
	[ApellidoPaterno] [varchar](50) NOT NULL,
	[ApellidoMaterno] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Celular] [char](9) NOT NULL,
	[CorreoElectronico] [varchar](100) NULL,
	[Direccion] [varchar](200) NULL,
	[Estado] [bit] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[UsuarioModificacion] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_T_Paciente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_TPaciente_Autocompletado]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Autor: Emanuel Samaniego Calderón
-- Fecha Creación:19/01/2023
-- Descripción: Vista que retornara el nombre autocompletado de un paciente
-- =============================================

CREATE VIEW [dbo].[V_TPaciente_Autocompletado]
AS
SELECT Id, CONCAT_WS(' ', Nombre, ApellidoPaterno,ApellidoMaterno) AS NombreCompleto,Estado
FROM T_Paciente
WHERE Estado=1

GO
/****** Object:  View [dbo].[V_Paciente_Detalle]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_Paciente_Detalle]
AS

SELECT pac.[Id], ps.Id AS IdPais,es.Id AS IdEstadoCivil,doc.id AS IdTipoDocumento,sx.Id AS IdSexo, [NumeroDocumento], [ApellidoPaterno], [ApellidoMaterno], pac.[Nombre], [FechaNacimiento], [Celular],
[CorreoElectronico], [Direccion]
FROM T_Paciente AS pac  INNER JOIN T_Pais ps ON pac.IdPais=ps.Id 
INNER JOIN T_EstadoCivil AS es ON pac.IdEstadoCivil=es.Id
INNER JOIN T_TipoDocumento AS doc on pac.IdTipoDocumento=doc.Id  
INNER JOIN T_Sexo AS sx on pac.IdSexo=sx.Id
where pac.Estado=1

GO
/****** Object:  Table [dbo].[T_AsignacionTratamiento]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_AsignacionTratamiento](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[IdTratamiento] [int] NOT NULL,
	[Precio] [decimal](7, 2) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaTratamiento] [datetime] NOT NULL,
	[DescripcionTratamiento] [varchar](max) NULL,
	[MontoTotal] [decimal](7, 2) NOT NULL,
	[FotoTratamiento] [varchar](max) NULL,
	[Observaciones] [varchar](250) NULL,
	[Estado] [bit] NOT NULL,
	[UsuarioCreacion] [varchar](50) NOT NULL,
	[UsuarioModificacion] [varchar](50) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaModificacion] [datetime] NOT NULL,
 CONSTRAINT [PK_T_AsignacionTratamiento] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_ErrorInterno]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ErrorInterno](
	[Id] [nchar](10) NOT NULL,
	[UsuarioSql] [nchar](10) NULL,
	[ErrorNumero] [int] NULL,
	[ErrorEstado] [int] NULL,
	[ErrorSeveridad] [int] NULL,
	[ErrorLinea] [int] NULL,
	[ErrorStoredProcedure] [varchar](250) NULL,
	[ErrorMensaje] [nvarchar](max) NULL,
	[UsuarioCreacion] [varchar](50) NULL,
	[FechaCreacion] [datetime] NULL,
	[Parametros] [varchar](max) NULL,
 CONSTRAINT [PK_T_ErrorInterno] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[T_AsignacionTratamiento] ON 

INSERT [dbo].[T_AsignacionTratamiento] ([Id], [IdPaciente], [IdTratamiento], [Precio], [Cantidad], [FechaTratamiento], [DescripcionTratamiento], [MontoTotal], [FotoTratamiento], [Observaciones], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (4, 3, 1, CAST(10.20 AS Decimal(7, 2)), 1, CAST(N'1905-07-01T00:00:00.000' AS DateTime), N'Se apersono fuera de hora', CAST(10.20 AS Decimal(7, 2)), NULL, N'Ninguna', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[T_AsignacionTratamiento] ([Id], [IdPaciente], [IdTratamiento], [Precio], [Cantidad], [FechaTratamiento], [DescripcionTratamiento], [MontoTotal], [FotoTratamiento], [Observaciones], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (5, 4, 2, CAST(10.20 AS Decimal(7, 2)), 1, CAST(N'1905-07-01T00:00:00.000' AS DateTime), N'Faltaron instrumentos', CAST(10.20 AS Decimal(7, 2)), NULL, N'Nueva Revision la proxima semana', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_AsignacionTratamiento] OFF
GO
SET IDENTITY_INSERT [dbo].[T_EstadoCivil] ON 

INSERT [dbo].[T_EstadoCivil] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (1, N'Soltero', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[T_EstadoCivil] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (2, N'Casado', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[T_EstadoCivil] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (3, N'Divorciado', 0, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[T_EstadoCivil] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (4, N'Viudo', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_EstadoCivil] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Paciente] ON 

INSERT [dbo].[T_Paciente] ([Id], [IdPais], [IdEstadoCivil], [IdTipoDocumento], [IdSexo], [NumeroDocumento], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [FechaNacimiento], [Celular], [CorreoElectronico], [Direccion], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (3, 1, 1, 1, 1, N'95266525', N'Torres', N'vargas', N'Miguel', CAST(N'1995-01-24' AS Date), N'956325896', N'miguel@gmail.com', N'Av. Real N° 350 -  El Tambo', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[T_Paciente] ([Id], [IdPais], [IdEstadoCivil], [IdTipoDocumento], [IdSexo], [NumeroDocumento], [ApellidoPaterno], [ApellidoMaterno], [Nombre], [FechaNacimiento], [Celular], [CorreoElectronico], [Direccion], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (4, 1, 1, 1, 1, N'95266525', N'Hurtado', N'Rojas', N'Yancarlo', CAST(N'1990-11-27' AS Date), N'789652589', N'yancarlo@gmail.com', N'Av. Bolognesi N° 470 -  El Tambo', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Paciente] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Pais] ON 

INSERT [dbo].[T_Pais] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (1, N'Perú', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[T_Pais] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (2, N'Chile', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[T_Pais] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (3, N'Bolivia', 0, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Pais] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Sexo] ON 

INSERT [dbo].[T_Sexo] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (1, N'Masculino', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[T_Sexo] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (2, N'Femenino', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Sexo] OFF
GO
SET IDENTITY_INSERT [dbo].[T_TipoDocumento] ON 

INSERT [dbo].[T_TipoDocumento] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (1, N'DNI', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-26T00:00:00.000' AS DateTime), CAST(N'1905-06-26T00:00:00.000' AS DateTime))
INSERT [dbo].[T_TipoDocumento] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (2, N'Pasaporte', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-26T00:00:00.000' AS DateTime), CAST(N'1905-06-26T00:00:00.000' AS DateTime))
INSERT [dbo].[T_TipoDocumento] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (3, N'Carnet de Extranjeria', 0, N'Emanuel', N'Emanuel', CAST(N'1905-06-26T00:00:00.000' AS DateTime), CAST(N'1905-06-26T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_TipoDocumento] OFF
GO
SET IDENTITY_INSERT [dbo].[T_Tratamiento] ON 

INSERT [dbo].[T_Tratamiento] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (1, N'Profilaxis', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[T_Tratamiento] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (2, N'Endodoncia', 1, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
INSERT [dbo].[T_Tratamiento] ([Id], [Nombre], [Estado], [UsuarioCreacion], [UsuarioModificacion], [FechaCreacion], [FechaModificacion]) VALUES (3, N'Extraccion de Dientes', 0, N'Emanuel', N'Emanuel', CAST(N'1905-06-27T00:00:00.000' AS DateTime), CAST(N'1905-06-27T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[T_Tratamiento] OFF
GO
ALTER TABLE [dbo].[T_AsignacionTratamiento]  WITH CHECK ADD  CONSTRAINT [FK_T_AsignacionTratamiento_T_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[T_Paciente] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_AsignacionTratamiento] CHECK CONSTRAINT [FK_T_AsignacionTratamiento_T_Paciente]
GO
ALTER TABLE [dbo].[T_AsignacionTratamiento]  WITH CHECK ADD  CONSTRAINT [FK_T_AsignacionTratamiento_T_Tratamiento] FOREIGN KEY([IdTratamiento])
REFERENCES [dbo].[T_Tratamiento] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_AsignacionTratamiento] CHECK CONSTRAINT [FK_T_AsignacionTratamiento_T_Tratamiento]
GO
ALTER TABLE [dbo].[T_Paciente]  WITH CHECK ADD  CONSTRAINT [FK_T_Paciente_T_EstadoCivil1] FOREIGN KEY([IdEstadoCivil])
REFERENCES [dbo].[T_EstadoCivil] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Paciente] CHECK CONSTRAINT [FK_T_Paciente_T_EstadoCivil1]
GO
ALTER TABLE [dbo].[T_Paciente]  WITH CHECK ADD  CONSTRAINT [FK_T_Paciente_T_Pais] FOREIGN KEY([IdPais])
REFERENCES [dbo].[T_Pais] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Paciente] CHECK CONSTRAINT [FK_T_Paciente_T_Pais]
GO
ALTER TABLE [dbo].[T_Paciente]  WITH CHECK ADD  CONSTRAINT [FK_T_Paciente_T_Sexo] FOREIGN KEY([IdSexo])
REFERENCES [dbo].[T_Sexo] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Paciente] CHECK CONSTRAINT [FK_T_Paciente_T_Sexo]
GO
ALTER TABLE [dbo].[T_Paciente]  WITH CHECK ADD  CONSTRAINT [FK_T_Paciente_T_TipoDocumento] FOREIGN KEY([IdTipoDocumento])
REFERENCES [dbo].[T_TipoDocumento] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[T_Paciente] CHECK CONSTRAINT [FK_T_Paciente_T_TipoDocumento]
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_AutocompletadoPaciente]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Autor: Emanuel Samaniego Calderón
-- Fecha Creación: 19/01/2023	
-- Descripción: Procedimiento almacenado para obtener los nombres de los pacientes
-- Parámetros: @NombrePaciente permite buscar un nombre del paciente
-- =============================================
CREATE PROC [dbo].[SP_Obtener_AutocompletadoPaciente]
@NombrePaciente varchar(50)
AS

BEGIN TRY
		SELECT * FROM [dbo].[V_TPaciente_Autocompletado] WHERE NombreCompleto Like '%' + @NombrePaciente + '%'
END TRY

BEGIN CATCH
       /*log Error*/
       INSERT INTO T_ErrorInterno
	   ( 
			UsuarioSql,ErrorNumero,ErrorEstado,ErrorSeveridad,ErrorLinea,ErrorStoredProcedure,
			ErrorMensaje,UsuarioCreacion,FechaCreacion,Parametros
	   )
	   VALUES
	   (
			SUSER_NAME(),ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),
			ERROR_MESSAGE(),NULL,GETDATE(),NULL
			   
	   );

	   /*Devuelve El Error al cliente*/

	   DECLARE @Message varchar(MAX) =ERROR_MESSAGE(),
	   @Severity int =ERROR_SEVERITY(),
	   @State smallint=ERROR_STATE();

	   RAISERROR(@Message,@Severity,@State);

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ListaEstadoCivilEstado_Combo]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Autor: Emanuel Samaniego Calderón
-- Fecha Creación: 19/01/2023	
-- Descripción: Procedimiento almacenado para obtener la lista de Estado civil
-- Parámetros: 
-- =============================================
CREATE proc  [dbo].[SP_Obtener_ListaEstadoCivilEstado_Combo]

AS

BEGIN TRY
		SELECT * FROM [dbo].[V_TEstadoCivil_ObtenerCombo]
END TRY

BEGIN CATCH
       /*log Error*/
       INSERT INTO T_ErrorInterno
	   ( 
			UsuarioSql,ErrorNumero,ErrorEstado,ErrorSeveridad,ErrorLinea,ErrorStoredProcedure,
			ErrorMensaje,UsuarioCreacion,FechaCreacion,Parametros
	   )
	   VALUES
	   (
			SUSER_NAME(),ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),
			ERROR_MESSAGE(),NULL,GETDATE(),NULL
			
	   
	   );

	   /*Devuelve El Error al cliente*/

	   DECLARE @Message varchar(MAX) =ERROR_MESSAGE(),
	   @Severity int =ERROR_SEVERITY(),
	   @State smallint=ERROR_STATE();

	   RAISERROR(@Message,@Severity,@State);

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ListaPaisEstado_Combo]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Autor: Emanuel Samaniego Calderón
-- Fecha Creación: 19/01/2023	
-- Descripción: Procedimiento almacenado para obtener la lista de Paises
-- Parámetros: 
-- =============================================
CREATE proc  [dbo].[SP_Obtener_ListaPaisEstado_Combo]

AS

BEGIN TRY
		SELECT * FROM V_TPais_ObtenerCombo
END TRY

BEGIN CATCH
       /*log Error*/
       INSERT INTO T_ErrorInterno
	   ( 
			UsuarioSql,ErrorNumero,ErrorEstado,ErrorSeveridad,ErrorLinea,ErrorStoredProcedure,
			ErrorMensaje,UsuarioCreacion,FechaCreacion,Parametros
	   )
	   VALUES
	   (
			SUSER_NAME(),ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),
			ERROR_MESSAGE(),NULL,GETDATE(),NULL
			
	   
	   );

	   /*Devuelve El Error al cliente*/

	   DECLARE @Message varchar(MAX) =ERROR_MESSAGE(),
	   @Severity int =ERROR_SEVERITY(),
	   @State smallint=ERROR_STATE();

	   RAISERROR(@Message,@Severity,@State);

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ListaSexoEstado_Combo]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Autor: Emanuel Samaniego Calderón
-- Fecha Creación: 19/01/2023	
-- Descripción: Procedimiento almacenado para obtener la lista de Sexo
-- Parámetros: 
-- =============================================
CREATE proc  [dbo].[SP_Obtener_ListaSexoEstado_Combo]

AS

BEGIN TRY
		SELECT * FROM [dbo].[V_TSexo_ObtenerCombo]
END TRY

BEGIN CATCH
       /*log Error*/
       INSERT INTO T_ErrorInterno
	   ( 
			UsuarioSql,ErrorNumero,ErrorEstado,ErrorSeveridad,ErrorLinea,ErrorStoredProcedure,
			ErrorMensaje,UsuarioCreacion,FechaCreacion,Parametros
	   )
	   VALUES
	   (
			SUSER_NAME(),ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),
			ERROR_MESSAGE(),NULL,GETDATE(),NULL
			
	   
	   );

	   /*Devuelve El Error al cliente*/

	   DECLARE @Message varchar(MAX) =ERROR_MESSAGE(),
	   @Severity int =ERROR_SEVERITY(),
	   @State smallint=ERROR_STATE();

	   RAISERROR(@Message,@Severity,@State);

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ListaTipoDocumentoEstado_Combo]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Autor: Emanuel Samaniego Calderón
-- Fecha Creación: 19/01/2023	
-- Descripción: Procedimiento almacenado para obtener la lista de Tipo Doumento
-- Parámetros: 
-- =============================================
CREATE proc  [dbo].[SP_Obtener_ListaTipoDocumentoEstado_Combo]

AS

BEGIN TRY
		SELECT * FROM [dbo].[V_TTipoDocumento_ObtenerCombo]
END TRY

BEGIN CATCH
       /*log Error*/
       INSERT INTO T_ErrorInterno
	   ( 
			UsuarioSql,ErrorNumero,ErrorEstado,ErrorSeveridad,ErrorLinea,ErrorStoredProcedure,
			ErrorMensaje,UsuarioCreacion,FechaCreacion,Parametros
	   )
	   VALUES
	   (
			SUSER_NAME(),ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),
			ERROR_MESSAGE(),NULL,GETDATE(),NULL
			
	   
	   );

	   /*Devuelve El Error al cliente*/

	   DECLARE @Message varchar(MAX) =ERROR_MESSAGE(),
	   @Severity int =ERROR_SEVERITY(),
	   @State smallint=ERROR_STATE();

	   RAISERROR(@Message,@Severity,@State);

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_ListaTratamientoEstado_Combo]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Autor: Emanuel Samaniego Calderón
-- Fecha Creación: 19/01/2023	
-- Descripción: Procedimiento almacenado para obtener la lista de Tratamiento
-- Parámetros: 
-- =============================================
CREATE proc  [dbo].[SP_Obtener_ListaTratamientoEstado_Combo]

AS

BEGIN TRY
		SELECT * FROM [dbo].[V_TTratamiento_ObtenerCombo]
END TRY

BEGIN CATCH
       /*log Error*/
       INSERT INTO T_ErrorInterno
	   ( 
			UsuarioSql,ErrorNumero,ErrorEstado,ErrorSeveridad,ErrorLinea,ErrorStoredProcedure,
			ErrorMensaje,UsuarioCreacion,FechaCreacion,Parametros
	   )
	   VALUES
	   (
			SUSER_NAME(),ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),
			ERROR_MESSAGE(),NULL,GETDATE(),NULL
			
	   
	   );

	   /*Devuelve El Error al cliente*/

	   DECLARE @Message varchar(MAX) =ERROR_MESSAGE(),
	   @Severity int =ERROR_SEVERITY(),
	   @State smallint=ERROR_STATE();

	   RAISERROR(@Message,@Severity,@State);

END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_PacienteValido_PorCriteriosDeBusqueda]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================

-- =============================================
CREATE PROCEDURE [dbo].[SP_Obtener_PacienteValido_PorCriteriosDeBusqueda]
	
	@NombrePaciente varchar(max)
AS
BEGIN TRY
	DECLARE @SQL NVARCHAR(MAX) = N'SELECT * FROM dbo.V_TPaciente_AutoCompletado WHERE 1=1';
	DECLARE @WHERE NVARCHAR(MAX) = N'';	


	IF @NombrePaciente IS NOT NULL
		BEGIN
			SET @WHERE = @WHERE + ' AND NombreCompleto LIKE ''%'' ' +'+'+''''+@NombrePaciente+''''+'+ ''%'''
		END
	

	SET @SQL = @SQL + @WHERE + ' ORDER BY 1 DESC';
	 
	PRINT (@SQL);
	EXECUTE sp_executesql @SQL;
	 
END TRY
BEGIN CATCH
       /*log Error*/
       INSERT INTO T_ErrorInterno
	   ( 
			UsuarioSql,ErrorNumero,ErrorEstado,ErrorSeveridad,ErrorLinea,ErrorStoredProcedure,
			ErrorMensaje,UsuarioCreacion,FechaCreacion,Parametros
	   )
	   VALUES
	   (
			SUSER_NAME(),ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),
			ERROR_MESSAGE(),NULL,GETDATE(),NULL
			   
	   );

	   /*Devuelve El Error al cliente*/

	   DECLARE @Message varchar(MAX) =ERROR_MESSAGE(),
	   @Severity int =ERROR_SEVERITY(),
	   @State smallint=ERROR_STATE();

	   RAISERROR(@Message,@Severity,@State);

END CATCH


GO
/****** Object:  StoredProcedure [dbo].[SP_Paciente_Detalle]    Script Date: 23/01/2023 17:10:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Autor: Emanuel Samaniego Calderón
-- Fecha Creación: 19/01/2023	
-- Descripción: Procedimiento almacenado para obtener los datos de un paciente
-- Parámetros: @id permite buscar un paciente a partir de su llave primaria
-- =============================================
CREATE PROC [dbo].[SP_Paciente_Detalle]
@id int
AS

BEGIN TRY
		SELECT * FROM [dbo].[V_Paciente_Detalle] WHERE Id=@id
END TRY

BEGIN CATCH
       /*log Error*/
       INSERT INTO T_ErrorInterno
	   ( 
			UsuarioSql,ErrorNumero,ErrorEstado,ErrorSeveridad,ErrorLinea,ErrorStoredProcedure,
			ErrorMensaje,UsuarioCreacion,FechaCreacion,Parametros
	   )
	   VALUES
	   (
			SUSER_NAME(),ERROR_NUMBER(),ERROR_STATE(),ERROR_SEVERITY(),ERROR_LINE(),ERROR_PROCEDURE(),
			ERROR_MESSAGE(),NULL,GETDATE(),NULL
			   
	   );

	   /*Devuelve El Error al cliente*/

	   DECLARE @Message varchar(MAX) =ERROR_MESSAGE(),
	   @Severity int =ERROR_SEVERITY(),
	   @State smallint=ERROR_STATE();

	   RAISERROR(@Message,@Severity,@State);

END CATCH
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de llave primaria de la tabla Asigacion de Tratamiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_AsignacionTratamiento', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de llave foranea de la tabla Paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_AsignacionTratamiento', @level2type=N'COLUMN',@level2name=N'IdPaciente'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de la llave foranea de la tabla tratamiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_AsignacionTratamiento', @level2type=N'COLUMN',@level2name=N'IdTratamiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Precio del tratamiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_AsignacionTratamiento', @level2type=N'COLUMN',@level2name=N'Precio'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de tratamientos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_AsignacionTratamiento', @level2type=N'COLUMN',@level2name=N'Cantidad'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha del trataminento del paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_AsignacionTratamiento', @level2type=N'COLUMN',@level2name=N'FechaTratamiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion del tratamiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_AsignacionTratamiento', @level2type=N'COLUMN',@level2name=N'DescripcionTratamiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Monto total a pagar por el paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_AsignacionTratamiento', @level2type=N'COLUMN',@level2name=N'MontoTotal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foto del tratamiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_AsignacionTratamiento', @level2type=N'COLUMN',@level2name=N'FotoTratamiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Observacion del tratamiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_AsignacionTratamiento', @level2type=N'COLUMN',@level2name=N'Observaciones'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de llave primaria de la tabla Error Interno' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_ErrorInterno', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de llave primaria de la tabla Estado Civil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_EstadoCivil', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del estado civil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_EstadoCivil', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de llave primaria de la tabla paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de llave foranea de la tabla Pais' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'IdPais'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de llave foranea de la tabla Estado Civil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'IdEstadoCivil'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de documento del paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'IdTipoDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Sexo del paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'IdSexo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de documento del paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'NumeroDocumento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellido paterno del paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'ApellidoPaterno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Apellidos materno del paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'ApellidoMaterno'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombres del paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de nacimiento del paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'FechaNacimiento'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero de celular del paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'Celular'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Correo Electronico del paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'CorreoElectronico'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Direccion del domicilio del paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Paciente', @level2type=N'COLUMN',@level2name=N'Direccion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de llave primaria de la tabla Pais' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Pais', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del Pais' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Pais', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de  llave primaria de la tabla sexo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Sexo', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del sexo del paciente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Sexo', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de llave primaria de la tabla tipo de documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_TipoDocumento', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identificador de llave primaria de la tabla tratamiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Tratamiento', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del Tratamiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_Tratamiento', @level2type=N'COLUMN',@level2name=N'Nombre'
GO
USE [master]
GO
ALTER DATABASE [Clinica] SET  READ_WRITE 
GO
