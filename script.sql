USE [master]
GO
/****** Object:  Database [ProductDB]    Script Date: 9/9/2018 9:41:19 PM ******/
CREATE DATABASE [ProductDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProductDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ProductDB.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ProductDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ProductDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ProductDB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProductDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProductDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProductDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProductDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProductDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProductDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProductDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProductDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ProductDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProductDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProductDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProductDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProductDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProductDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProductDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProductDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProductDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProductDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProductDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProductDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProductDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProductDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProductDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProductDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProductDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProductDB] SET  MULTI_USER 
GO
ALTER DATABASE [ProductDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProductDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProductDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProductDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ProductDB]
GO
/****** Object:  Table [dbo].[ActivityProduct]    Script Date: 9/9/2018 9:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ActivityProduct](
	[Name] [varchar](50) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [date] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[IsBooked] [bit] NOT NULL,
	[IsSaved] [bit] NOT NULL,
	[Duration] [varchar](50) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AirProduct]    Script Date: 9/9/2018 9:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AirProduct](
	[Name] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Destination] [varchar](50) NOT NULL,
	[DepartureDate] [date] NOT NULL,
	[DepartureTime] [decimal](4, 2) NULL,
	[ArrivalDate] [date] NOT NULL,
	[ArrivalTime] [decimal](4, 2) NULL,
	[IsSaved] [bit] NOT NULL,
	[IsBooked] [bit] NOT NULL,
	[Price] [decimal](19, 2) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CarProduct]    Script Date: 9/9/2018 9:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CarProduct](
	[Name] [varchar](50) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[Source] [varchar](50) NOT NULL,
	[Destination] [varchar](50) NOT NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [date] NOT NULL,
	[IsSaved] [bit] NOT NULL,
	[IsBooked] [bit] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HotelProduct]    Script Date: 9/9/2018 9:41:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HotelProduct](
	[Name] [varchar](50) NOT NULL,
	[Location] [varchar](50) NOT NULL,
	[CheckIn] [date] NOT NULL,
	[CheckOut] [date] NOT NULL,
	[IsSaved] [bit] NOT NULL,
	[IsBooked] [bit] NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [ProductDB] SET  READ_WRITE 
GO
