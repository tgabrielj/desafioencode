USE [master]
GO
/****** Object:  Database [db_a94121_desafio]    Script Date: 09/02/2023 9:08:38 ******/
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
/****** Object:  Table [dbo].[Actividades]    Script Date: 09/02/2023 9:08:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actividades](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NULL,
	[actividad] [varchar](30) NULL,
	[create_date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 09/02/2023 9:08:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](10) NOT NULL,
	[apellido] [varchar](10) NOT NULL,
	[correo_electronico] [char](30) NOT NULL,
	[telefono] [varchar](15) NOT NULL,
	[pais] [varchar](10) NOT NULL,
	[contactar] [bit] NOT NULL,
	[estado] [bit] NULL,
	[fecha_nacimiento] [datetime] NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actividades] ON 

INSERT [dbo].[Actividades] ([id], [id_usuario], [actividad], [create_date]) VALUES (93, 50, N'creacion de usuario', CAST(N'2023-02-08T09:46:14.690' AS DateTime))
INSERT [dbo].[Actividades] ([id], [id_usuario], [actividad], [create_date]) VALUES (95, 50, N'consulta de usuario', CAST(N'2023-02-08T09:47:20.917' AS DateTime))
INSERT [dbo].[Actividades] ([id], [id_usuario], [actividad], [create_date]) VALUES (96, 50, N'consulta de usuario', CAST(N'2023-02-08T09:47:37.473' AS DateTime))
INSERT [dbo].[Actividades] ([id], [id_usuario], [actividad], [create_date]) VALUES (97, 50, N'actualizacion de usuario', CAST(N'2023-02-08T09:47:47.613' AS DateTime))
INSERT [dbo].[Actividades] ([id], [id_usuario], [actividad], [create_date]) VALUES (98, 51, N'creacion de usuario', CAST(N'2023-02-08T09:48:25.933' AS DateTime))
INSERT [dbo].[Actividades] ([id], [id_usuario], [actividad], [create_date]) VALUES (100, 52, N'creacion de usuario', CAST(N'2023-02-08T09:50:24.250' AS DateTime))
INSERT [dbo].[Actividades] ([id], [id_usuario], [actividad], [create_date]) VALUES (102, 52, N'consulta de usuario', CAST(N'2023-02-08T09:51:15.040' AS DateTime))
INSERT [dbo].[Actividades] ([id], [id_usuario], [actividad], [create_date]) VALUES (103, 52, N'actualizacion de usuario', CAST(N'2023-02-08T09:51:26.473' AS DateTime))
INSERT [dbo].[Actividades] ([id], [id_usuario], [actividad], [create_date]) VALUES (104, 52, N'eliminacion de usuario', CAST(N'2023-02-08T09:51:42.943' AS DateTime))
SET IDENTITY_INSERT [dbo].[Actividades] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([id], [nombre], [apellido], [correo_electronico], [telefono], [pais], [contactar], [estado], [fecha_nacimiento]) VALUES (50, N'gabriel', N'juncos', N'gjuncos@gmail.com             ', N'3513265987', N'ARG', 1, 1, CAST(N'2023-02-08T09:46:14.687' AS DateTime))
INSERT [dbo].[Usuarios] ([id], [nombre], [apellido], [correo_electronico], [telefono], [pais], [contactar], [estado], [fecha_nacimiento]) VALUES (51, N'leo', N'messi', N'leomessi@hotmail.com          ', N'3652154987', N'ARG', 0, 1, CAST(N'2023-02-08T09:48:25.933' AS DateTime))
INSERT [dbo].[Usuarios] ([id], [nombre], [apellido], [correo_electronico], [telefono], [pais], [contactar], [estado], [fecha_nacimiento]) VALUES (52, N'jorge', N'gonzales', N'mariano@hotmail.com           ', N'3513265632', N'BRA', 0, 0, CAST(N'2023-02-08T09:50:24.247' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
GO
ALTER TABLE [dbo].[Actividades]  WITH CHECK ADD FOREIGN KEY([id_usuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  StoredProcedure [dbo].[pr_actividad_insertar]    Script Date: 09/02/2023 9:08:44 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_actividad_por_usuario]    Script Date: 09/02/2023 9:08:44 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_baja_usuario]    Script Date: 09/02/2023 9:08:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_baja_usuario](
@id int,
@estado bit)

AS
BEGIN

	UPDATE Usuarios
	SET estado = @estado
	WHERE id = @id;

END

GO
/****** Object:  StoredProcedure [dbo].[pr_insertar_usuario]    Script Date: 09/02/2023 9:08:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[pr_insertar_usuario](
	
	@nombre varchar(10),
	@apellido varchar(10),
	@correo_electronico varchar(30),
	@telefono varchar(15),
	@pais varchar(10),
	@contactar bit

)
AS
DECLARE @id int
INSERT INTO Usuarios(nombre, apellido, correo_electronico, fecha_nacimiento, telefono, pais, contactar,estado)
VALUES (@nombre,@apellido,@correo_electronico, GETDATE(), @telefono, @pais, @contactar, 1)
SET @id = SCOPE_IDENTITY()

EXEC pr_actividad_insertar @id, 'creacion de usuario'

RETURN

GO
/****** Object:  StoredProcedure [dbo].[pr_insertarActividad]    Script Date: 09/02/2023 9:08:44 ******/
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
/****** Object:  StoredProcedure [dbo].[pr_usuarios_dados_alta]    Script Date: 09/02/2023 9:08:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_usuarios_dados_alta]
AS
BEGIN

select U.id, U.nombre, apellido, correo_electronico, fecha_nacimiento, telefono, pais,contactar 
from Usuarios as U
where U.estado = 1
	
END

GO
USE [master]
GO
ALTER DATABASE [db_a94121_desafio] SET  READ_WRITE 
GO
