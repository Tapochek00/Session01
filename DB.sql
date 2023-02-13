USE [master]
GO
/****** Object:  Database [Ses]    Script Date: 13.02.2023 13:44:18 ******/
CREATE DATABASE [Ses]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ses', FILENAME = N'/var/opt/mssql/data/Ses.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'Ses_log', FILENAME = N'/var/opt/mssql/data/Ses_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Ses] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ses].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ses] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ses] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ses] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ses] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ses] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ses] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ses] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ses] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ses] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ses] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ses] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ses] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ses] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ses] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ses] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ses] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ses] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ses] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ses] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ses] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ses] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ses] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ses] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Ses] SET  MULTI_USER 
GO
ALTER DATABASE [Ses] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ses] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ses] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ses] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Ses] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Ses] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Ses] SET QUERY_STORE = OFF
GO
USE [Ses]
GO
/****** Object:  Table [dbo].[Login]    Script Date: 13.02.2023 13:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](15) NULL,
	[Password] [nvarchar](20) NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 13.02.2023 13:44:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Login] ON 

INSERT [dbo].[Login] ([Id], [Number], [Password], [Role]) VALUES (1, N'1234', N'1234', 1)
SET IDENTITY_INSERT [dbo].[Login] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Role]) VALUES (1, N'Руководитель отдела по работе с клиентами')
INSERT [dbo].[Roles] ([Id], [Role]) VALUES (2, N'Менеджер по работе с клиентами')
INSERT [dbo].[Roles] ([Id], [Role]) VALUES (3, N'Руководитель отдела технической поддержки')
INSERT [dbo].[Roles] ([Id], [Role]) VALUES (4, N'Специалист технической поддержки')
INSERT [dbo].[Roles] ([Id], [Role]) VALUES (5, N'Бухгалтер')
INSERT [dbo].[Roles] ([Id], [Role]) VALUES (6, N'Директор по развитию')
INSERT [dbo].[Roles] ([Id], [Role]) VALUES (7, N'Сотрудник технического департамента')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
ALTER TABLE [dbo].[Login]  WITH CHECK ADD  CONSTRAINT [FK_Login_Roles] FOREIGN KEY([Role])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Login] CHECK CONSTRAINT [FK_Login_Roles]
GO
USE [master]
GO
ALTER DATABASE [Ses] SET  READ_WRITE 
GO
