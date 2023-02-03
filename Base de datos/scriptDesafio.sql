USE [master]
GO
/****** Object:  Database [db_a94121_desafio]    Script Date: 3/2/2023 14:11:00 ******/
CREATE DATABASE [db_a94121_desafio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_a94121_desafio_Data', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_a94121_desafio_DATA.mdf' , SIZE = 8192KB , MAXSIZE = 1024000KB , FILEGROWTH = 10%)
 LOG ON 
( NAME = N'db_a94121_desafio_Log', FILENAME = N'H:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\db_a94121_desafio_Log.LDF' , SIZE = 3072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [db_a94121_desafio] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_a94121_desafio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_a94121_desafio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_a94121_desafio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_a94121_desafio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET  ENABLE_BROKER 
GO
ALTER DATABASE [db_a94121_desafio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_a94121_desafio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_a94121_desafio] SET  MULTI_USER 
GO
ALTER DATABASE [db_a94121_desafio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_a94121_desafio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [db_a94121_desafio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [db_a94121_desafio] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [db_a94121_desafio] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [db_a94121_desafio] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [db_a94121_desafio] SET QUERY_STORE = OFF
GO
USE [db_a94121_desafio]
GO
/****** Object:  Table [dbo].[Actividades]    Script Date: 3/2/2023 14:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[create_date] [date] NULL,
	[id_usuario] [int] NULL,
	[actividad] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 3/2/2023 14:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](10) NOT NULL,
	[apellido] [varchar](10) NOT NULL,
	[correo_electronico] [char](30) NOT NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[telefono] [varchar](15) NOT NULL,
	[pais] [varchar](10) NOT NULL,
	[contactar] [bit] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Actividades]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  StoredProcedure [dbo].[pr_actividad_insertar]    Script Date: 3/2/2023 14:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_actividad_insertar]
(
	@id_usuario int,
	@actividad varchar(30)
)
AS
INSERT INTO Actividades(create_date,id_usuario,actividad)
VALUES (GETDATE(), @id_usuario,@actividad)
SELECT @@IDENTITY AS id
RETURN

GO
/****** Object:  StoredProcedure [dbo].[pr_actividad_por_usuario]    Script Date: 3/2/2023 14:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_actividad_por_usuario]
AS
BEGIN
	select  A.create_date as fecha_de_actividad, U.nombre, U.apellido, A.actividad
	from Usuarios as U, Actividades as A
	where U.id = A.id_usuario
	ORDER BY A.create_date DESC

END

GO
/****** Object:  StoredProcedure [dbo].[pr_insertarActividad]    Script Date: 3/2/2023 14:11:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_insertarActividad](@create_date date, @id_usuario int, @actividad varchar(30))
AS
BEGIN
	INSERT INTO Actividades(create_date, id_usuario, actividad)
	VALUES (@create_date, @id_usuario, @actividad);
END

GO
USE [master]
GO
ALTER DATABASE [db_a94121_desafio] SET  READ_WRITE 
GO
