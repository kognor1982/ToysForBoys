USE [master]
GO
/****** Object:  Database [webshop]    Script Date: 17 May 2017 10:47:30 Hrs ******/
CREATE DATABASE [webshop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'webshop', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\webshop.mdf' , SIZE = 6072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'webshop_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL13.SQLEXPRESS\MSSQL\DATA\webshop_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [webshop] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [webshop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [webshop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [webshop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [webshop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [webshop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [webshop] SET ARITHABORT OFF 
GO
ALTER DATABASE [webshop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [webshop] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [webshop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [webshop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [webshop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [webshop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [webshop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [webshop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [webshop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [webshop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [webshop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [webshop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [webshop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [webshop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [webshop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [webshop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [webshop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [webshop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [webshop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [webshop] SET  MULTI_USER 
GO
ALTER DATABASE [webshop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [webshop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [webshop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [webshop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [webshop]
GO
/****** Object:  User [ASPNET]    Script Date: 17 May 2017 10:47:30 Hrs ******/
CREATE USER [ASPNET] FOR LOGIN [ASPNET] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ASPNET]
GO
/****** Object:  Table [dbo].[besteldetails]    Script Date: 17 May 2017 10:47:30 Hrs ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[besteldetails](
	[bestellingID] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[aantal] [int] NOT NULL,
	[bestelPrijs] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_besteldetails] PRIMARY KEY CLUSTERED 
(
	[bestellingID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bestellingen]    Script Date: 17 May 2017 10:47:30 Hrs ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bestellingen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[bestelDatum] [datetime] NOT NULL,
	[leverDatum] [datetime] NULL,
	[verzendDatum] [datetime] NULL,
	[opmerkingen] [ntext] NULL,
	[klantID] [int] NOT NULL,
	[status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_bestellingen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[klanten]    Script Date: 17 May 2017 10:47:30 Hrs ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[klanten](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[naam] [nvarchar](50) NOT NULL,
	[straat] [nvarchar](50) NOT NULL,
	[postcode] [nvarchar](10) NULL,
	[gemeente] [nvarchar](50) NOT NULL,
	[provincie] [nvarchar](50) NULL,
	[landID] [int] NOT NULL,
	[userlevel] [int] NOT NULL,
 CONSTRAINT [PK_klanten] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[landen]    Script Date: 17 May 2017 10:47:30 Hrs ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[landen](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[naam] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_landen] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[productcategories]    Script Date: 17 May 2017 10:47:30 Hrs ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productcategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[naam] [nvarchar](50) NOT NULL,
	[omschrijving] [ntext] NULL,
 CONSTRAINT [PK_productcategories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[producten]    Script Date: 17 May 2017 10:47:30 Hrs ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[producten](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[naam] [nvarchar](50) NOT NULL,
	[schaal] [nvarchar](10) NULL,
	[omschrijving] [ntext] NULL,
	[opVoorraad] [int] NOT NULL,
	[besteld] [int] NOT NULL,
	[prijs] [numeric](10, 2) NOT NULL,
	[categorieID] [int] NOT NULL,
 CONSTRAINT [PK_producten] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (1, 22, 30, CAST(136.00 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (1, 23, 30, CAST(136.00 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (2, 28, 25, CAST(108.06 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (2, 29, 25, CAST(108.06 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (3, 19, 39, CAST(95.55 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (4, 2, 26, CAST(214.30 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (5, 11, 34, CAST(131.44 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (6, 5, 50, CAST(127.84 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (7, 22, 36, CAST(134.04 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (8, 1, 30, CAST(81.35 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (9, 7, 33, CAST(165.38 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (10, 18, 26, CAST(117.48 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (11, 21, 37, CAST(118.22 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (12, 19, 33, CAST(87.33 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (13, 2, 29, CAST(197.16 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (14, 9, 21, CAST(121.64 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (15, 6, 31, CAST(128.53 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (16, 15, 46, CAST(111.39 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (17, 89, 27, CAST(60.28 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (18, 8, 33, CAST(195.33 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (19, 106, 36, CAST(86.15 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (20, 5, 46, CAST(112.88 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (22, 1, 34, CAST(86.13 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (23, 7, 42, CAST(155.66 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (24, 21, 26, CAST(120.71 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (25, 23, 21, CAST(153.00 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (27, 2, 38, CAST(205.73 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (28, 8, 46, CAST(193.25 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (29, 39, 41, CAST(120.20 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (30, 5, 33, CAST(123.76 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (31, 37, 40, CAST(68.82 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (32, 22, 21, CAST(141.92 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (33, 105, 36, CAST(80.00 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (34, 31, 49, CAST(80.26 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (35, 1, 41, CAST(90.92 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (36, 7, 42, CAST(173.17 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (37, 18, 25, CAST(117.48 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (38, 21, 44, CAST(115.73 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (39, 23, 33, CAST(149.60 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (41, 2, 37, CAST(186.44 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (42, 15, 21, CAST(114.95 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (43, 8, 33, CAST(166.24 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (44, 5, 49, CAST(133.28 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (45, 91, 20, CAST(56.41 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (46, 1, 45, CAST(76.56 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (47, 47, 47, CAST(60.30 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (48, 7, 48, CAST(161.49 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (50, 19, 50, CAST(87.33 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (51, 2, 45, CAST(182.16 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (52, 15, 24, CAST(114.95 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (54, 8, 20, CAST(201.57 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (55, 72, 31, CAST(75.23 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (56, 5, 32, CAST(129.20 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (57, 93, 20, CAST(43.64 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (58, 31, 33, CAST(69.27 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (59, 62, 22, CAST(67.79 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (60, 1, 49, CAST(81.35 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (61, 12, 46, CAST(96.30 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (62, 18, 28, CAST(121.72 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (63, 19, 48, CAST(87.33 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (64, 2, 21, CAST(212.16 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (65, 6, 21, CAST(143.31 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (66, 8, 44, CAST(168.32 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (67, 39, 43, CAST(136.59 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (68, 5, 44, CAST(123.76 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (69, 1, 36, CAST(94.74 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (71, 12, 47, CAST(116.27 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (72, 18, 35, CAST(134.46 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (73, 21, 42, CAST(109.51 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (74, 19, 43, CAST(101.71 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (76, 6, 33, CAST(119.67 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (77, 8, 33, CAST(166.24 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (78, 39, 23, CAST(113.37 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (79, 5, 24, CAST(131.92 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (80, 31, 24, CAST(82.79 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (81, 1, 29, CAST(76.56 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (82, 7, 27, CAST(155.66 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (83, 19, 25, CAST(83.22 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (84, 2, 23, CAST(180.01 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (85, 15, 37, CAST(105.47 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (86, 8, 21, CAST(195.33 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (87, 5, 26, CAST(108.80 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (88, 31, 45, CAST(70.12 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (89, 1, 48, CAST(95.70 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (90, 10, 28, CAST(138.57 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (91, 66, 42, CAST(58.87 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (92, 7, 21, CAST(155.66 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (93, 16, 27, CAST(99.04 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (95, 2, 42, CAST(203.59 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (96, 15, 49, CAST(118.50 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (97, 8, 47, CAST(203.64 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (98, 5, 45, CAST(118.32 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (99, 22, 42, CAST(149.81 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (100, 93, 29, CAST(37.97 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (101, 31, 28, CAST(74.34 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (102, 1, 22, CAST(82.30 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (103, 47, 30, CAST(55.33 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (104, 7, 20, CAST(161.49 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (105, 18, 42, CAST(114.65 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (106, 19, 36, CAST(98.63 AS Numeric(10, 2)))
GO
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (107, 2, 47, CAST(203.59 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (108, 6, 31, CAST(125.58 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (109, 8, 46, CAST(176.63 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (110, 5, 39, CAST(129.20 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (111, 3, 23, CAST(112.99 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (112, 1, 41, CAST(90.92 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (113, 12, 39, CAST(99.82 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (114, 50, 38, CAST(84.67 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (115, 23, 30, CAST(166.60 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (116, 2, 35, CAST(205.73 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (117, 9, 43, CAST(133.94 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (118, 6, 48, CAST(132.97 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (119, 28, 22, CAST(110.46 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (120, 15, 48, CAST(94.80 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (121, 8, 32, CAST(189.10 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (122, 39, 33, CAST(133.86 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (123, 5, 49, CAST(133.28 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (125, 10, 43, CAST(141.58 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (126, 7, 27, CAST(157.60 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (127, 21, 38, CAST(108.26 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (128, 19, 25, CAST(85.27 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (129, 2, 29, CAST(214.30 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (130, 6, 50, CAST(138.88 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (131, 11, 43, CAST(128.42 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (132, 8, 42, CAST(193.25 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (133, 39, 22, CAST(133.86 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (134, 72, 40, CAST(70.81 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (135, 5, 48, CAST(118.32 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (136, 31, 24, CAST(81.95 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (137, 3, 22, CAST(105.86 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (138, 1, 23, CAST(91.87 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (139, 7, 28, CAST(161.49 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (140, 16, 21, CAST(100.19 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (141, 18, 41, CAST(125.97 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (142, 21, 21, CAST(119.46 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (143, 80, 46, CAST(36.52 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (144, 29, 47, CAST(111.87 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (145, 19, 40, CAST(99.66 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (146, 2, 34, CAST(195.01 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (147, 15, 46, CAST(99.54 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (148, 8, 44, CAST(195.33 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (149, 5, 20, CAST(126.48 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (150, 48, 46, CAST(88.93 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (151, 22, 45, CAST(148.23 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (152, 1, 59, CAST(93.79 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (153, 43, 20, CAST(74.78 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (154, 7, 24, CAST(157.60 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (155, 23, 49, CAST(137.70 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (156, 33, 24, CAST(135.00 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (157, 19, 34, CAST(93.49 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (158, 35, 50, CAST(92.19 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (159, 2, 32, CAST(177.87 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (160, 6, 26, CAST(121.15 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (161, 8, 46, CAST(180.79 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (162, 5, 27, CAST(116.96 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (163, 22, 49, CAST(157.69 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (164, 1, 34, CAST(89.00 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (165, 47, 48, CAST(58.44 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (167, 7, 44, CAST(188.73 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (168, 55, 36, CAST(71.27 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (169, 19, 49, CAST(93.49 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (170, 36, 32, CAST(57.46 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (172, 15, 31, CAST(99.54 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (173, 8, 35, CAST(187.02 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (174, 5, 30, CAST(136.00 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (175, 22, 41, CAST(129.31 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (176, 1, 45, CAST(81.35 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (177, 7, 50, CAST(184.84 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (178, 16, 28, CAST(93.28 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (179, 18, 34, CAST(114.65 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (180, 55, 26, CAST(68.42 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (181, 2, 34, CAST(205.73 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (182, 6, 44, CAST(132.97 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (183, 8, 41, CAST(176.63 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (184, 5, 25, CAST(130.56 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (185, 22, 45, CAST(137.19 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (186, 1, 36, CAST(95.70 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (187, 47, 38, CAST(51.60 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (188, 7, 21, CAST(190.68 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (189, 21, 20, CAST(120.71 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (190, 19, 38, CAST(92.47 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (191, 44, 26, CAST(80.36 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (192, 2, 37, CAST(210.01 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (193, 15, 21, CAST(94.80 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (194, 8, 46, CAST(187.02 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (195, 107, 45, CAST(98.32 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (196, 5, 24, CAST(136.00 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (197, 22, 36, CAST(146.65 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (198, 31, 25, CAST(81.95 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (199, 3, 39, CAST(105.86 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (200, 1, 23, CAST(76.56 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (201, 7, 33, CAST(184.84 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (202, 18, 37, CAST(114.65 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (203, 23, 43, CAST(166.60 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (204, 27, 46, CAST(56.91 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (205, 2, 47, CAST(201.44 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (206, 6, 38, CAST(130.01 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (207, 8, 31, CAST(182.86 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (208, 5, 22, CAST(118.32 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (209, 3, 34, CAST(115.37 AS Numeric(10, 2)))
GO
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (210, 1, 41, CAST(94.74 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (211, 7, 33, CAST(165.38 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (212, 21, 29, CAST(124.44 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (213, 2, 48, CAST(214.30 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (214, 6, 40, CAST(141.83 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (215, 8, 38, CAST(176.63 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (216, 51, 36, CAST(78.12 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (217, 5, 33, CAST(126.48 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (218, 83, 35, CAST(69.55 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (219, 1, 46, CAST(84.22 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (220, 10, 30, CAST(134.05 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (221, 7, 31, CAST(184.84 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (222, 16, 24, CAST(105.95 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (223, 2, 40, CAST(180.01 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (224, 44, 33, CAST(88.30 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (225, 11, 27, CAST(148.06 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (226, 5, 47, CAST(111.52 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (227, 42, 32, CAST(94.79 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (228, 22, 25, CAST(154.54 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (229, 48, 34, CAST(104.81 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (230, 1, 42, CAST(80.39 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (231, 45, 37, CAST(136.70 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (232, 18, 46, CAST(120.31 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (233, 19, 46, CAST(89.38 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (234, 2, 26, CAST(188.58 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (235, 6, 26, CAST(130.01 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (236, 68, 33, CAST(32.88 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (237, 8, 33, CAST(176.63 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (238, 5, 25, CAST(131.92 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (239, 22, 41, CAST(137.19 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (240, 3, 40, CAST(117.75 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (241, 62, 55, CAST(62.46 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (242, 1, 41, CAST(84.22 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (244, 21, 36, CAST(109.51 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (245, 23, 45, CAST(168.30 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (246, 64, 43, CAST(38.98 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (247, 19, 42, CAST(88.36 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (249, 8, 48, CAST(207.80 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (250, 13, 26, CAST(166.10 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (251, 5, 26, CAST(110.16 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (252, 22, 39, CAST(143.50 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (253, 100, 23, CAST(75.13 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (254, 31, 27, CAST(71.81 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (255, 1, 42, CAST(84.22 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (256, 45, 23, CAST(117.59 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (257, 18, 43, CAST(120.31 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (258, 2, 32, CAST(199.30 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (259, 11, 49, CAST(129.93 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (260, 5, 48, CAST(122.40 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (261, 22, 50, CAST(126.15 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (263, 4, 22, CAST(182.04 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (264, 7, 33, CAST(180.95 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (265, 87, 48, CAST(38.22 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (266, 18, 30, CAST(116.06 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (267, 25, 34, CAST(116.65 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (268, 21, 49, CAST(105.77 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (269, 67, 40, CAST(73.60 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (270, 2, 41, CAST(195.01 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (272, 8, 32, CAST(178.71 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (273, 11, 40, CAST(146.55 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (274, 5, 39, CAST(118.32 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (276, 1, 21, CAST(76.56 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (277, 12, 35, CAST(98.65 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (278, 14, 24, CAST(65.44 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (279, 21, 34, CAST(121.95 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (280, 23, 39, CAST(156.40 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (281, 19, 27, CAST(88.36 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (282, 2, 36, CAST(182.16 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (283, 8, 34, CAST(166.24 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (284, 28, 27, CAST(119.05 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (285, 5, 34, CAST(129.20 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (286, 77, 37, CAST(78.83 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (287, 22, 25, CAST(130.88 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (288, 86, 44, CAST(79.91 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (289, 1, 42, CAST(80.39 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (290, 7, 26, CAST(182.90 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (291, 18, 36, CAST(117.48 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (293, 36, 37, CAST(61.21 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (294, 11, 35, CAST(145.04 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (295, 40, 22, CAST(135.47 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (296, 5, 32, CAST(125.12 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (297, 13, 33, CAST(155.72 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (298, 99, 32, CAST(69.29 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (299, 22, 33, CAST(130.88 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (300, 1, 40, CAST(77.52 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (301, 5, 64, CAST(134.64 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (302, 31, 42, CAST(75.19 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (303, 3, 45, CAST(118.94 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (304, 1, 24, CAST(85.17 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (305, 7, 64, CAST(163.44 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (306, 16, 97, CAST(115.16 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (307, 18, 61, CAST(124.56 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (308, 21, 59, CAST(114.48 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (309, 80, 15, CAST(41.03 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (310, 29, 6, CAST(104.25 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (311, 19, 65, CAST(99.66 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (312, 2, 23, CAST(205.73 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (313, 15, 54, CAST(100.73 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (314, 8, 36, CAST(201.57 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (315, 5, 49, CAST(114.24 AS Numeric(10, 2)))
GO
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (317, 22, 24, CAST(129.31 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (318, 1, 66, CAST(79.43 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (319, 43, 16, CAST(70.76 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (320, 7, 12, CAST(182.90 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (322, 33, 35, CAST(167.06 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (323, 19, 51, CAST(91.44 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (324, 35, 10, CAST(89.15 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (325, 2, 50, CAST(201.44 AS Numeric(10, 2)))
INSERT [dbo].[besteldetails] ([bestellingID], [productID], [aantal], [bestelPrijs]) VALUES (326, 6, 38, CAST(131.49 AS Numeric(10, 2)))
SET IDENTITY_INSERT [dbo].[bestellingen] ON 

INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (1, CAST(0x000092F900000000 AS DateTime), CAST(0x0000930000000000 AS DateTime), NULL, NULL, 86, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (2, CAST(0x000092FC00000000 AS DateTime), CAST(0x0000930500000000 AS DateTime), NULL, N'Check on availability.', 8, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (3, CAST(0x000092FD00000000 AS DateTime), CAST(0x0000930500000000 AS DateTime), NULL, NULL, 28, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (4, CAST(0x0000931000000000 AS DateTime), CAST(0x0000931900000000 AS DateTime), NULL, NULL, 5, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (5, CAST(0x0000931200000000 AS DateTime), CAST(0x0000931B00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (6, CAST(0x0000931D00000000 AS DateTime), CAST(0x0000932700000000 AS DateTime), NULL, NULL, 13, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (7, CAST(0x0000932300000000 AS DateTime), CAST(0x0000932A00000000 AS DateTime), NULL, NULL, 57, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (8, CAST(0x0000932A00000000 AS DateTime), CAST(0x0000933100000000 AS DateTime), NULL, N'Difficult to negotiate with customer. We need more marketing materials', 10, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (9, CAST(0x0000933100000000 AS DateTime), CAST(0x0000933A00000000 AS DateTime), NULL, NULL, 92, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (10, CAST(0x0000933800000000 AS DateTime), CAST(0x0000934100000000 AS DateTime), NULL, N'Customer requested that FedEx Ground is used for this shipping', 118, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (11, CAST(0x0000934000000000 AS DateTime), CAST(0x0000934600000000 AS DateTime), CAST(0x0000934200000000 AS DateTime), NULL, 30, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (12, CAST(0x0000934700000000 AS DateTime), CAST(0x0000934D00000000 AS DateTime), NULL, NULL, 9, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (13, CAST(0x0000934600000000 AS DateTime), CAST(0x0000935000000000 AS DateTime), CAST(0x0000934B00000000 AS DateTime), NULL, 12, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (14, CAST(0x0000934800000000 AS DateTime), CAST(0x0000934F00000000 AS DateTime), CAST(0x0000934900000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (15, CAST(0x0000934E00000000 AS DateTime), CAST(0x0000935400000000 AS DateTime), CAST(0x0000934F00000000 AS DateTime), NULL, 24, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (16, CAST(0x0000935100000000 AS DateTime), CAST(0x0000935900000000 AS DateTime), NULL, NULL, 99, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (17, CAST(0x0000935800000000 AS DateTime), CAST(0x0000936000000000 AS DateTime), CAST(0x0000935A00000000 AS DateTime), NULL, 90, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (18, CAST(0x0000935D00000000 AS DateTime), CAST(0x0000936500000000 AS DateTime), NULL, NULL, 15, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (19, CAST(0x0000936200000000 AS DateTime), CAST(0x0000936A00000000 AS DateTime), NULL, N'Customer has worked with some of our vendors in the past and is aware of their MSRP', 40, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (20, CAST(0x0000936900000000 AS DateTime), CAST(0x0000937000000000 AS DateTime), NULL, NULL, 91, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (22, CAST(0x0000937200000000 AS DateTime), CAST(0x0000937800000000 AS DateTime), NULL, NULL, 81, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (23, CAST(0x0000937300000000 AS DateTime), CAST(0x0000937B00000000 AS DateTime), NULL, NULL, 80, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (24, CAST(0x0000937F00000000 AS DateTime), CAST(0x0000938800000000 AS DateTime), NULL, NULL, 1, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (25, CAST(0x0000938000000000 AS DateTime), CAST(0x0000938800000000 AS DateTime), NULL, N'Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 2, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (27, CAST(0x0000938700000000 AS DateTime), CAST(0x0000939100000000 AS DateTime), NULL, NULL, 107, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (28, CAST(0x0000938D00000000 AS DateTime), CAST(0x0000939300000000 AS DateTime), NULL, N'Customer requested special shippment. The instructions were passed along to the warehouse', 16, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (29, CAST(0x0000939000000000 AS DateTime), CAST(0x0000939600000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (30, CAST(0x0000939600000000 AS DateTime), CAST(0x0000939C00000000 AS DateTime), NULL, NULL, 71, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (31, CAST(0x0000939A00000000 AS DateTime), CAST(0x000093A200000000 AS DateTime), NULL, NULL, 32, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (32, CAST(0x0000939A00000000 AS DateTime), CAST(0x000093A300000000 AS DateTime), NULL, NULL, 101, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (33, CAST(0x000093A300000000 AS DateTime), CAST(0x000093A900000000 AS DateTime), NULL, NULL, 70, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (34, CAST(0x000093A500000000 AS DateTime), CAST(0x000093AC00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (35, CAST(0x000093A900000000 AS DateTime), CAST(0x000093B200000000 AS DateTime), NULL, NULL, 51, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (36, CAST(0x000093AA00000000 AS DateTime), CAST(0x000093B400000000 AS DateTime), CAST(0x000093AB00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (37, CAST(0x000093AC00000000 AS DateTime), CAST(0x000093B600000000 AS DateTime), CAST(0x000093AE00000000 AS DateTime), NULL, 48, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (38, CAST(0x000093B200000000 AS DateTime), CAST(0x000093BC00000000 AS DateTime), NULL, NULL, 81, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (39, CAST(0x000093AF00000000 AS DateTime), CAST(0x000093B800000000 AS DateTime), NULL, NULL, 122, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (41, CAST(0x000093C000000000 AS DateTime), CAST(0x000093C900000000 AS DateTime), CAST(0x000093C600000000 AS DateTime), NULL, 18, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (42, CAST(0x000093C800000000 AS DateTime), CAST(0x000093D000000000 AS DateTime), NULL, NULL, 74, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (43, CAST(0x000093CF00000000 AS DateTime), CAST(0x000093D700000000 AS DateTime), CAST(0x000093D400000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (44, CAST(0x000093D100000000 AS DateTime), CAST(0x000093D900000000 AS DateTime), NULL, N'Can we deliver the new Ford Mustang models by end-of-quarter?', 68, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (45, CAST(0x000093D400000000 AS DateTime), CAST(0x000093DC00000000 AS DateTime), CAST(0x000093D500000000 AS DateTime), NULL, 90, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (46, CAST(0x000093E000000000 AS DateTime), CAST(0x000093E800000000 AS DateTime), CAST(0x000093E600000000 AS DateTime), NULL, 36, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (47, CAST(0x000093E900000000 AS DateTime), CAST(0x000093F300000000 AS DateTime), NULL, NULL, 101, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (48, CAST(0x000093EB00000000 AS DateTime), CAST(0x000093F200000000 AS DateTime), NULL, NULL, 89, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (50, CAST(0x000093F200000000 AS DateTime), CAST(0x000093F800000000 AS DateTime), NULL, NULL, 119, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (51, CAST(0x000093F900000000 AS DateTime), CAST(0x0000940100000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 15, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (52, CAST(0x000093FB00000000 AS DateTime), CAST(0x0000940400000000 AS DateTime), NULL, NULL, 65, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (54, CAST(0x0000940200000000 AS DateTime), CAST(0x0000940900000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (55, CAST(0x0000940600000000 AS DateTime), CAST(0x0000941000000000 AS DateTime), NULL, NULL, 41, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (56, CAST(0x0000940A00000000 AS DateTime), CAST(0x0000941100000000 AS DateTime), NULL, NULL, 29, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (57, CAST(0x0000940C00000000 AS DateTime), CAST(0x0000941500000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (58, CAST(0x0000940D00000000 AS DateTime), CAST(0x0000941300000000 AS DateTime), NULL, NULL, 112, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (59, CAST(0x0000940E00000000 AS DateTime), CAST(0x0000941600000000 AS DateTime), NULL, NULL, 5, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (60, CAST(0x0000940E00000000 AS DateTime), CAST(0x0000941700000000 AS DateTime), NULL, NULL, 69, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (61, CAST(0x0000940F00000000 AS DateTime), CAST(0x0000941500000000 AS DateTime), CAST(0x0000941500000000 AS DateTime), NULL, 78, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (62, CAST(0x0000941500000000 AS DateTime), CAST(0x0000941D00000000 AS DateTime), NULL, NULL, 43, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (63, CAST(0x0000941600000000 AS DateTime), CAST(0x0000941E00000000 AS DateTime), NULL, NULL, 69, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (64, CAST(0x0000941800000000 AS DateTime), CAST(0x0000941F00000000 AS DateTime), NULL, NULL, 99, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (65, CAST(0x0000941900000000 AS DateTime), CAST(0x0000942200000000 AS DateTime), NULL, N'This order was disputed, but resolved on 11/1/2003; Customer doesn''t like the colors and precision of the models.', 104, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (66, CAST(0x0000941A00000000 AS DateTime), CAST(0x0000942300000000 AS DateTime), NULL, N'This order was on hold because customers''s credit limit had been exceeded. Order will ship when payment is received', 15, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (67, CAST(0x0000941900000000 AS DateTime), CAST(0x0000942200000000 AS DateTime), NULL, NULL, 109, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (68, CAST(0x0000941B00000000 AS DateTime), CAST(0x0000942200000000 AS DateTime), CAST(0x0000941600000000 AS DateTime), NULL, 102, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (69, CAST(0x0000942000000000 AS DateTime), CAST(0x0000942600000000 AS DateTime), CAST(0x0000942400000000 AS DateTime), NULL, 18, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (71, CAST(0x0000942700000000 AS DateTime), CAST(0x0000942F00000000 AS DateTime), NULL, NULL, 104, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (72, CAST(0x0000942800000000 AS DateTime), CAST(0x0000943000000000 AS DateTime), NULL, NULL, 44, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (73, CAST(0x0000942800000000 AS DateTime), CAST(0x0000943100000000 AS DateTime), NULL, NULL, 26, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (74, CAST(0x0000942800000000 AS DateTime), CAST(0x0000943200000000 AS DateTime), NULL, N'Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 57, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (76, CAST(0x0000942900000000 AS DateTime), CAST(0x0000943100000000 AS DateTime), NULL, NULL, 71, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (77, CAST(0x0000942900000000 AS DateTime), CAST(0x0000943200000000 AS DateTime), NULL, NULL, 93, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (78, CAST(0x0000942A00000000 AS DateTime), CAST(0x0000943400000000 AS DateTime), NULL, NULL, 77, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (79, CAST(0x0000942B00000000 AS DateTime), CAST(0x0000943300000000 AS DateTime), CAST(0x0000942D00000000 AS DateTime), NULL, 48, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (80, CAST(0x0000942E00000000 AS DateTime), CAST(0x0000943400000000 AS DateTime), NULL, N'Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.', 122, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (81, CAST(0x0000942E00000000 AS DateTime), CAST(0x0000943600000000 AS DateTime), NULL, NULL, 23, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (82, CAST(0x0000942F00000000 AS DateTime), CAST(0x0000943600000000 AS DateTime), NULL, NULL, 20, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (83, CAST(0x0000942F00000000 AS DateTime), CAST(0x0000943800000000 AS DateTime), CAST(0x0000943500000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (84, CAST(0x0000943000000000 AS DateTime), CAST(0x0000943900000000 AS DateTime), NULL, N'We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 76, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (85, CAST(0x0000943100000000 AS DateTime), CAST(0x0000943900000000 AS DateTime), NULL, NULL, 117, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (86, CAST(0x0000943100000000 AS DateTime), CAST(0x0000943800000000 AS DateTime), NULL, NULL, 68, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (87, CAST(0x0000943100000000 AS DateTime), CAST(0x0000943700000000 AS DateTime), CAST(0x0000943500000000 AS DateTime), NULL, 120, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (88, CAST(0x0000943200000000 AS DateTime), CAST(0x0000943B00000000 AS DateTime), NULL, NULL, 39, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (89, CAST(0x0000943500000000 AS DateTime), CAST(0x0000943D00000000 AS DateTime), NULL, NULL, 20, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (90, CAST(0x0000943500000000 AS DateTime), CAST(0x0000943C00000000 AS DateTime), CAST(0x0000943B00000000 AS DateTime), NULL, 36, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (91, CAST(0x0000943600000000 AS DateTime), CAST(0x0000944000000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (92, CAST(0x0000943700000000 AS DateTime), CAST(0x0000944100000000 AS DateTime), NULL, N'We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 53, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (93, CAST(0x0000943700000000 AS DateTime), CAST(0x0000944000000000 AS DateTime), NULL, NULL, 86, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (95, CAST(0x0000943C00000000 AS DateTime), CAST(0x0000944300000000 AS DateTime), NULL, NULL, 14, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (96, CAST(0x0000943C00000000 AS DateTime), CAST(0x0000944200000000 AS DateTime), NULL, NULL, 67, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (97, CAST(0x0000943D00000000 AS DateTime), CAST(0x0000944400000000 AS DateTime), NULL, NULL, 105, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (98, CAST(0x0000943D00000000 AS DateTime), CAST(0x0000944300000000 AS DateTime), NULL, N'Customer inquired about remote controlled models and gold models.', 40, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (99, CAST(0x0000943E00000000 AS DateTime), CAST(0x0000944700000000 AS DateTime), NULL, NULL, 92, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (100, CAST(0x0000944200000000 AS DateTime), CAST(0x0000944B00000000 AS DateTime), NULL, NULL, 113, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (101, CAST(0x0000944200000000 AS DateTime), CAST(0x0000944A00000000 AS DateTime), NULL, NULL, 39, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (102, CAST(0x0000944200000000 AS DateTime), CAST(0x0000944C00000000 AS DateTime), NULL, NULL, 9, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (103, CAST(0x0000944300000000 AS DateTime), CAST(0x0000944A00000000 AS DateTime), NULL, NULL, 83, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (104, CAST(0x0000944300000000 AS DateTime), CAST(0x0000944C00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (105, CAST(0x0000944300000000 AS DateTime), CAST(0x0000944B00000000 AS DateTime), NULL, NULL, 16, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (106, CAST(0x0000944400000000 AS DateTime), CAST(0x0000944A00000000 AS DateTime), NULL, N'TI need all the information I can get on our competitors.', 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (107, CAST(0x0000944600000000 AS DateTime), CAST(0x0000944E00000000 AS DateTime), NULL, N'Can we renegotiate this one?', 34, N'WAITING')
GO
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (108, CAST(0x0000944A00000000 AS DateTime), CAST(0x0000945200000000 AS DateTime), NULL, N'Check on availability.', 121, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (109, CAST(0x0000946200000000 AS DateTime), CAST(0x0000946B00000000 AS DateTime), NULL, NULL, 14, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (110, CAST(0x0000946900000000 AS DateTime), CAST(0x0000946F00000000 AS DateTime), CAST(0x0000946C00000000 AS DateTime), NULL, 78, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (111, CAST(0x0000946C00000000 AS DateTime), CAST(0x0000947600000000 AS DateTime), NULL, NULL, 27, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (112, CAST(0x0000946F00000000 AS DateTime), CAST(0x0000947900000000 AS DateTime), NULL, NULL, 95, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (113, CAST(0x0000947000000000 AS DateTime), CAST(0x0000947800000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (114, CAST(0x0000947600000000 AS DateTime), CAST(0x0000947C00000000 AS DateTime), CAST(0x0000947B00000000 AS DateTime), NULL, 120, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (115, CAST(0x0000947A00000000 AS DateTime), CAST(0x0000948300000000 AS DateTime), NULL, NULL, 107, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (116, CAST(0x0000947D00000000 AS DateTime), CAST(0x0000948700000000 AS DateTime), NULL, N'Customer requested that FedEx Ground is used for this shipping', 113, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (117, CAST(0x0000948100000000 AS DateTime), CAST(0x0000948900000000 AS DateTime), NULL, NULL, 52, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (118, CAST(0x0000948300000000 AS DateTime), CAST(0x0000948D00000000 AS DateTime), NULL, NULL, 19, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (119, CAST(0x0000948800000000 AS DateTime), CAST(0x0000948F00000000 AS DateTime), NULL, N'Customer requested that ad materials (such as posters, pamphlets) be included in the shippment', 112, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (120, CAST(0x0000948900000000 AS DateTime), CAST(0x0000949000000000 AS DateTime), NULL, NULL, 119, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (121, CAST(0x0000948B00000000 AS DateTime), CAST(0x0000949200000000 AS DateTime), NULL, NULL, 31, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (122, CAST(0x0000949100000000 AS DateTime), CAST(0x0000949900000000 AS DateTime), CAST(0x0000949200000000 AS DateTime), NULL, 66, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (123, CAST(0x0000949200000000 AS DateTime), CAST(0x0000949A00000000 AS DateTime), NULL, NULL, 46, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (125, CAST(0x0000949400000000 AS DateTime), CAST(0x0000949E00000000 AS DateTime), NULL, N'Customer has worked with some of our vendors in the past and is aware of their MSRP', 23, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (126, CAST(0x0000949500000000 AS DateTime), CAST(0x0000949D00000000 AS DateTime), NULL, NULL, 61, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (127, CAST(0x0000949900000000 AS DateTime), CAST(0x000094A200000000 AS DateTime), NULL, NULL, 46, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (128, CAST(0x0000949E00000000 AS DateTime), CAST(0x000094A800000000 AS DateTime), NULL, NULL, 14, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (129, CAST(0x000094A600000000 AS DateTime), CAST(0x000094AE00000000 AS DateTime), NULL, NULL, 25, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (130, CAST(0x000094A700000000 AS DateTime), CAST(0x000094B000000000 AS DateTime), CAST(0x000094A800000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (131, CAST(0x000094AB00000000 AS DateTime), CAST(0x000094B400000000 AS DateTime), NULL, N'Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 8, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (132, CAST(0x000094AF00000000 AS DateTime), CAST(0x000094B600000000 AS DateTime), NULL, NULL, 77, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (133, CAST(0x000094B000000000 AS DateTime), CAST(0x000094BA00000000 AS DateTime), NULL, NULL, 47, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (134, CAST(0x000094B900000000 AS DateTime), CAST(0x000094BF00000000 AS DateTime), CAST(0x000094BD00000000 AS DateTime), NULL, 72, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (135, CAST(0x000094BA00000000 AS DateTime), CAST(0x000094C000000000 AS DateTime), NULL, NULL, 97, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (136, CAST(0x000094BD00000000 AS DateTime), CAST(0x000094C700000000 AS DateTime), CAST(0x000094C100000000 AS DateTime), NULL, 54, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (137, CAST(0x000094BE00000000 AS DateTime), CAST(0x000094C600000000 AS DateTime), NULL, NULL, 118, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (138, CAST(0x000094C000000000 AS DateTime), CAST(0x000094C700000000 AS DateTime), NULL, NULL, 28, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (139, CAST(0x000094C400000000 AS DateTime), CAST(0x000094CB00000000 AS DateTime), NULL, NULL, 13, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (140, CAST(0x000094C700000000 AS DateTime), CAST(0x000094D000000000 AS DateTime), NULL, NULL, 65, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (141, CAST(0x000094C800000000 AS DateTime), CAST(0x000094CF00000000 AS DateTime), NULL, NULL, 27, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (142, CAST(0x000094C800000000 AS DateTime), CAST(0x000094CF00000000 AS DateTime), NULL, NULL, 38, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (143, CAST(0x000094CF00000000 AS DateTime), CAST(0x000094D700000000 AS DateTime), NULL, N'Customer is interested in buying more Ferrari models', 106, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (144, CAST(0x000094D500000000 AS DateTime), CAST(0x000094DC00000000 AS DateTime), NULL, NULL, 121, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (145, CAST(0x000094D800000000 AS DateTime), CAST(0x000094E200000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (146, CAST(0x000094DD00000000 AS DateTime), CAST(0x000094E500000000 AS DateTime), NULL, NULL, 105, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (147, CAST(0x000094DE00000000 AS DateTime), CAST(0x000094E600000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (148, CAST(0x000094DE00000000 AS DateTime), CAST(0x000094E400000000 AS DateTime), NULL, NULL, 74, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (149, CAST(0x000094E000000000 AS DateTime), CAST(0x000094E700000000 AS DateTime), NULL, N'Order was mistakenly placed. The warehouse noticed the lack of documentation.', 10, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (150, CAST(0x000094E100000000 AS DateTime), CAST(0x000094EA00000000 AS DateTime), NULL, N'Can we deliver the new Ford Mustang models by end-of-quarter?', 25, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (151, CAST(0x000094E400000000 AS DateTime), CAST(0x000094EC00000000 AS DateTime), NULL, NULL, 103, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (152, CAST(0x000094EB00000000 AS DateTime), CAST(0x000094F100000000 AS DateTime), CAST(0x000094F100000000 AS DateTime), NULL, 72, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (153, CAST(0x000094F300000000 AS DateTime), CAST(0x000094FC00000000 AS DateTime), NULL, NULL, 95, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (154, CAST(0x000094F900000000 AS DateTime), CAST(0x0000950100000000 AS DateTime), NULL, N'Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.', 33, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (155, CAST(0x000094FB00000000 AS DateTime), CAST(0x0000950500000000 AS DateTime), NULL, N'Customer requested that DHL is used for this shipping', 70, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (156, CAST(0x000094FC00000000 AS DateTime), CAST(0x0000950400000000 AS DateTime), NULL, NULL, 38, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (157, CAST(0x0000950000000000 AS DateTime), CAST(0x0000950800000000 AS DateTime), NULL, NULL, 13, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (158, CAST(0x0000950600000000 AS DateTime), CAST(0x0000951000000000 AS DateTime), NULL, NULL, 103, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (159, CAST(0x0000950700000000 AS DateTime), CAST(0x0000951100000000 AS DateTime), NULL, NULL, 94, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (160, CAST(0x0000950700000000 AS DateTime), CAST(0x0000950E00000000 AS DateTime), NULL, NULL, 19, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (161, CAST(0x0000950800000000 AS DateTime), CAST(0x0000950E00000000 AS DateTime), NULL, N'Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.', 83, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (162, CAST(0x0000950900000000 AS DateTime), CAST(0x0000951100000000 AS DateTime), NULL, NULL, 44, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (163, CAST(0x0000951000000000 AS DateTime), CAST(0x0000951700000000 AS DateTime), NULL, N'This customer found a better offer from one of our competitors. Will call back to renegotiate.', 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (164, CAST(0x0000951400000000 AS DateTime), CAST(0x0000951A00000000 AS DateTime), NULL, NULL, 26, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (165, CAST(0x0000951600000000 AS DateTime), CAST(0x0000951C00000000 AS DateTime), NULL, N'Customer will send a truck to our local warehouse on 7/1/2004', 85, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (167, CAST(0x0000951C00000000 AS DateTime), CAST(0x0000952400000000 AS DateTime), NULL, NULL, 93, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (168, CAST(0x0000951D00000000 AS DateTime), CAST(0x0000952700000000 AS DateTime), NULL, NULL, 16, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (169, CAST(0x0000952200000000 AS DateTime), CAST(0x0000952800000000 AS DateTime), NULL, NULL, 97, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (170, CAST(0x0000952600000000 AS DateTime), CAST(0x0000952C00000000 AS DateTime), NULL, NULL, 91, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (172, CAST(0x0000952A00000000 AS DateTime), CAST(0x0000953300000000 AS DateTime), CAST(0x0000952D00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (173, CAST(0x0000952A00000000 AS DateTime), CAST(0x0000953000000000 AS DateTime), NULL, NULL, 17, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (174, CAST(0x0000952B00000000 AS DateTime), CAST(0x0000953200000000 AS DateTime), CAST(0x0000952C00000000 AS DateTime), NULL, 66, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (175, CAST(0x0000952B00000000 AS DateTime), CAST(0x0000953300000000 AS DateTime), NULL, NULL, 89, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (176, CAST(0x0000952D00000000 AS DateTime), CAST(0x0000953700000000 AS DateTime), NULL, NULL, 4, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (177, CAST(0x0000953700000000 AS DateTime), CAST(0x0000954000000000 AS DateTime), NULL, NULL, 35, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (178, CAST(0x0000953900000000 AS DateTime), CAST(0x0000954100000000 AS DateTime), NULL, NULL, 15, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (179, CAST(0x0000953B00000000 AS DateTime), CAST(0x0000954500000000 AS DateTime), NULL, NULL, 2, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (180, CAST(0x0000953E00000000 AS DateTime), CAST(0x0000954800000000 AS DateTime), NULL, N'Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (181, CAST(0x0000954600000000 AS DateTime), CAST(0x0000955000000000 AS DateTime), NULL, NULL, 50, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (182, CAST(0x0000954800000000 AS DateTime), CAST(0x0000955100000000 AS DateTime), NULL, NULL, 17, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (183, CAST(0x0000954900000000 AS DateTime), CAST(0x0000954F00000000 AS DateTime), CAST(0x0000954B00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (184, CAST(0x0000954900000000 AS DateTime), CAST(0x0000955300000000 AS DateTime), CAST(0x0000954C00000000 AS DateTime), NULL, 54, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (185, CAST(0x0000954A00000000 AS DateTime), CAST(0x0000955200000000 AS DateTime), NULL, N'Custom shipping instructions sent to warehouse', 62, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (186, CAST(0x0000955000000000 AS DateTime), CAST(0x0000955800000000 AS DateTime), NULL, NULL, 59, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (187, CAST(0x0000955100000000 AS DateTime), CAST(0x0000955A00000000 AS DateTime), CAST(0x0000955500000000 AS DateTime), NULL, 24, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (188, CAST(0x0000955300000000 AS DateTime), CAST(0x0000955A00000000 AS DateTime), NULL, NULL, 61, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (189, CAST(0x0000955500000000 AS DateTime), CAST(0x0000955F00000000 AS DateTime), NULL, NULL, 19, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (190, CAST(0x0000955700000000 AS DateTime), CAST(0x0000956100000000 AS DateTime), NULL, N'We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 20, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (191, CAST(0x0000955B00000000 AS DateTime), CAST(0x0000956300000000 AS DateTime), NULL, NULL, 32, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (192, CAST(0x0000955C00000000 AS DateTime), CAST(0x0000956500000000 AS DateTime), CAST(0x0000956200000000 AS DateTime), NULL, 102, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (193, CAST(0x0000955C00000000 AS DateTime), CAST(0x0000956600000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 10, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (194, CAST(0x0000955D00000000 AS DateTime), CAST(0x0000956600000000 AS DateTime), NULL, NULL, 50, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (195, CAST(0x0000955E00000000 AS DateTime), CAST(0x0000956500000000 AS DateTime), NULL, NULL, 35, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (196, CAST(0x0000955E00000000 AS DateTime), CAST(0x0000956500000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 85, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (197, CAST(0x0000956300000000 AS DateTime), CAST(0x0000956A00000000 AS DateTime), NULL, NULL, 98, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (198, CAST(0x0000956400000000 AS DateTime), CAST(0x0000956A00000000 AS DateTime), NULL, N'We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 31, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (199, CAST(0x0000956F00000000 AS DateTime), CAST(0x0000957700000000 AS DateTime), NULL, NULL, 1, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (200, CAST(0x0000957200000000 AS DateTime), CAST(0x0000957C00000000 AS DateTime), NULL, NULL, 29, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (201, CAST(0x0000940800000000 AS DateTime), CAST(0x0000941100000000 AS DateTime), NULL, NULL, 8, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (202, CAST(0x0000940900000000 AS DateTime), CAST(0x0000941300000000 AS DateTime), NULL, NULL, 62, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (203, CAST(0x0000940A00000000 AS DateTime), CAST(0x0000941400000000 AS DateTime), NULL, NULL, 33, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (204, CAST(0x0000957800000000 AS DateTime), CAST(0x0000958000000000 AS DateTime), NULL, N'Customer inquired about remote controlled models and gold models.', 117, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (205, CAST(0x0000957D00000000 AS DateTime), CAST(0x0000958600000000 AS DateTime), NULL, NULL, 52, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (206, CAST(0x0000957F00000000 AS DateTime), CAST(0x0000958800000000 AS DateTime), NULL, N'Check on availability.', 59, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (207, CAST(0x0000958000000000 AS DateTime), CAST(0x0000958700000000 AS DateTime), CAST(0x0000958300000000 AS DateTime), NULL, 30, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (208, CAST(0x0000958000000000 AS DateTime), CAST(0x0000958900000000 AS DateTime), NULL, NULL, 76, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (209, CAST(0x0000958100000000 AS DateTime), CAST(0x0000958A00000000 AS DateTime), NULL, N'Customer requested that FedEx Ground is used for this shipping', 67, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (210, CAST(0x0000958100000000 AS DateTime), CAST(0x0000958A00000000 AS DateTime), NULL, NULL, 5, N'RESOLVED')
GO
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (211, CAST(0x0000958200000000 AS DateTime), CAST(0x0000958A00000000 AS DateTime), NULL, NULL, 53, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (212, CAST(0x0000958200000000 AS DateTime), CAST(0x0000958900000000 AS DateTime), NULL, N'Difficult to negotiate with customer. We need more marketing materials', 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (213, CAST(0x0000958700000000 AS DateTime), CAST(0x0000958D00000000 AS DateTime), CAST(0x0000958900000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (214, CAST(0x0000958800000000 AS DateTime), CAST(0x0000958E00000000 AS DateTime), NULL, N'Customer requested that FedEx Ground is used for this shipping', 34, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (215, CAST(0x0000958800000000 AS DateTime), CAST(0x0000959200000000 AS DateTime), NULL, NULL, 43, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (216, CAST(0x0000958F00000000 AS DateTime), CAST(0x0000959900000000 AS DateTime), NULL, NULL, 4, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (217, CAST(0x0000959200000000 AS DateTime), CAST(0x0000959A00000000 AS DateTime), NULL, N'Customer requested that ad materials (such as posters, pamphlets) be included in the shippment', 47, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (218, CAST(0x0000959300000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), CAST(0x0000959900000000 AS DateTime), NULL, 18, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (219, CAST(0x0000959300000000 AS DateTime), CAST(0x0000959A00000000 AS DateTime), NULL, NULL, 17, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (220, CAST(0x0000959400000000 AS DateTime), CAST(0x0000959C00000000 AS DateTime), NULL, N'Customer requested that DHL is used for this shipping', 106, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (221, CAST(0x0000959400000000 AS DateTime), CAST(0x0000959E00000000 AS DateTime), CAST(0x0000959800000000 AS DateTime), NULL, 12, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (222, CAST(0x0000959500000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), NULL, NULL, 109, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (223, CAST(0x0000959500000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), NULL, N'Customer has worked with some of our vendors in the past and is aware of their MSRP', 86, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (224, CAST(0x0000959600000000 AS DateTime), CAST(0x0000959D00000000 AS DateTime), NULL, NULL, 8, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (225, CAST(0x0000959600000000 AS DateTime), CAST(0x0000959C00000000 AS DateTime), NULL, NULL, 28, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (226, CAST(0x0000959600000000 AS DateTime), CAST(0x0000959E00000000 AS DateTime), NULL, NULL, 5, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (227, CAST(0x0000959A00000000 AS DateTime), CAST(0x000095A100000000 AS DateTime), CAST(0x0000959B00000000 AS DateTime), NULL, 12, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (228, CAST(0x0000959B00000000 AS DateTime), CAST(0x000095A400000000 AS DateTime), NULL, N'Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don''t match what was discussed.', 13, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (229, CAST(0x0000959D00000000 AS DateTime), CAST(0x000095A600000000 AS DateTime), NULL, N'Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch', 57, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (230, CAST(0x000095A000000000 AS DateTime), CAST(0x000095A900000000 AS DateTime), NULL, NULL, 10, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (231, CAST(0x000095A100000000 AS DateTime), CAST(0x000095AA00000000 AS DateTime), NULL, NULL, 92, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (232, CAST(0x000095A200000000 AS DateTime), CAST(0x000095A800000000 AS DateTime), NULL, N'Customer requested special shippment. The instructions were passed along to the warehouse', 118, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (233, CAST(0x000095A200000000 AS DateTime), CAST(0x000095AA00000000 AS DateTime), CAST(0x000095A300000000 AS DateTime), NULL, 30, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (234, CAST(0x000095A300000000 AS DateTime), CAST(0x000095AC00000000 AS DateTime), NULL, NULL, 9, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (235, CAST(0x000095A400000000 AS DateTime), CAST(0x000095AD00000000 AS DateTime), CAST(0x000095A400000000 AS DateTime), NULL, 12, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (236, CAST(0x000095A400000000 AS DateTime), CAST(0x000095AE00000000 AS DateTime), CAST(0x000095A800000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (237, CAST(0x000095A500000000 AS DateTime), CAST(0x000095AB00000000 AS DateTime), CAST(0x000095A900000000 AS DateTime), NULL, 24, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (238, CAST(0x000095A600000000 AS DateTime), CAST(0x000095AF00000000 AS DateTime), NULL, NULL, 99, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (239, CAST(0x000095A700000000 AS DateTime), CAST(0x000095B100000000 AS DateTime), CAST(0x000095AC00000000 AS DateTime), NULL, 90, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (240, CAST(0x000095A800000000 AS DateTime), CAST(0x000095AF00000000 AS DateTime), NULL, NULL, 94, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (241, CAST(0x000095A900000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, N'Customer is interested in buying more Ferrari models', 40, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (242, CAST(0x000095A900000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, NULL, 91, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (244, CAST(0x000095A900000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, NULL, 81, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (245, CAST(0x000095AA00000000 AS DateTime), CAST(0x000095B100000000 AS DateTime), NULL, NULL, 80, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (246, CAST(0x000095AA00000000 AS DateTime), CAST(0x000095B000000000 AS DateTime), NULL, NULL, 1, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (247, CAST(0x000095AE00000000 AS DateTime), CAST(0x000095B400000000 AS DateTime), NULL, NULL, 2, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (249, CAST(0x0000959200000000 AS DateTime), CAST(0x0000959900000000 AS DateTime), NULL, NULL, 107, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (250, CAST(0x000095B000000000 AS DateTime), CAST(0x000095B600000000 AS DateTime), NULL, NULL, 16, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (251, CAST(0x000095B100000000 AS DateTime), CAST(0x000095B700000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (252, CAST(0x000095B200000000 AS DateTime), CAST(0x000095BA00000000 AS DateTime), NULL, NULL, 71, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (253, CAST(0x000095B200000000 AS DateTime), CAST(0x000095BB00000000 AS DateTime), NULL, NULL, 32, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (254, CAST(0x000095B300000000 AS DateTime), CAST(0x000095BA00000000 AS DateTime), NULL, NULL, 101, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (255, CAST(0x000095B300000000 AS DateTime), CAST(0x000095B900000000 AS DateTime), NULL, NULL, 70, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (256, CAST(0x000095B600000000 AS DateTime), CAST(0x000095BD00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (257, CAST(0x000095B800000000 AS DateTime), CAST(0x000095BE00000000 AS DateTime), NULL, NULL, 51, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (258, CAST(0x000095B900000000 AS DateTime), CAST(0x000095BF00000000 AS DateTime), CAST(0x000095BD00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (259, CAST(0x000095B900000000 AS DateTime), CAST(0x000095BF00000000 AS DateTime), NULL, N'Customer requested that DHL is used for this shipping', 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (260, CAST(0x000095BE00000000 AS DateTime), CAST(0x000095C600000000 AS DateTime), NULL, NULL, 81, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (261, CAST(0x000095BF00000000 AS DateTime), CAST(0x000095C500000000 AS DateTime), NULL, NULL, 122, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (263, CAST(0x000095D300000000 AS DateTime), CAST(0x000095DE00000000 AS DateTime), CAST(0x000095D800000000 AS DateTime), NULL, 18, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (264, CAST(0x000095D400000000 AS DateTime), CAST(0x000095DA00000000 AS DateTime), NULL, NULL, 74, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (265, CAST(0x000095D400000000 AS DateTime), CAST(0x000095DF00000000 AS DateTime), NULL, NULL, 80, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (266, CAST(0x000095D500000000 AS DateTime), CAST(0x000095E000000000 AS DateTime), NULL, NULL, 68, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (267, CAST(0x000095D800000000 AS DateTime), CAST(0x000095E100000000 AS DateTime), CAST(0x000095DA00000000 AS DateTime), NULL, 90, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (268, CAST(0x000095DA00000000 AS DateTime), CAST(0x000095E300000000 AS DateTime), CAST(0x000095DE00000000 AS DateTime), NULL, 36, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (269, CAST(0x000095E100000000 AS DateTime), CAST(0x000095E900000000 AS DateTime), CAST(0x000095E600000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (270, CAST(0x000095E200000000 AS DateTime), CAST(0x000095EA00000000 AS DateTime), NULL, NULL, 89, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (272, CAST(0x000095E500000000 AS DateTime), CAST(0x000095F000000000 AS DateTime), CAST(0x000095E700000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (273, CAST(0x000095E800000000 AS DateTime), CAST(0x000095F200000000 AS DateTime), NULL, NULL, 94, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (274, CAST(0x000095ED00000000 AS DateTime), CAST(0x000095F500000000 AS DateTime), NULL, NULL, 65, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (276, CAST(0x000095F000000000 AS DateTime), CAST(0x000095F700000000 AS DateTime), NULL, NULL, 4, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (277, CAST(0x000095F500000000 AS DateTime), CAST(0x000095FF00000000 AS DateTime), NULL, NULL, 41, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (278, CAST(0x000095F600000000 AS DateTime), CAST(0x0000960200000000 AS DateTime), NULL, N'Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches', 29, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (279, CAST(0x000095F700000000 AS DateTime), CAST(0x000095FF00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (280, CAST(0x000095F700000000 AS DateTime), CAST(0x000095FF00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (281, CAST(0x000095FD00000000 AS DateTime), CAST(0x0000960500000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (282, CAST(0x000095FE00000000 AS DateTime), CAST(0x0000960600000000 AS DateTime), NULL, NULL, 69, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (283, CAST(0x000095FE00000000 AS DateTime), CAST(0x0000960400000000 AS DateTime), CAST(0x000095FF00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (284, CAST(0x0000960300000000 AS DateTime), CAST(0x0000960B00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (285, CAST(0x0000960400000000 AS DateTime), CAST(0x0000960F00000000 AS DateTime), NULL, NULL, 69, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (286, CAST(0x0000960900000000 AS DateTime), CAST(0x0000961200000000 AS DateTime), CAST(0x0000960A00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (287, CAST(0x0000960A00000000 AS DateTime), CAST(0x0000961200000000 AS DateTime), NULL, N'Disputed then Resolved on 3/15/2005. Customer doesn''t like the craftsmaship of the models.', 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (288, CAST(0x0000960B00000000 AS DateTime), CAST(0x0000961200000000 AS DateTime), NULL, N'We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.', 15, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (289, CAST(0x0000960C00000000 AS DateTime), CAST(0x0000961400000000 AS DateTime), NULL, NULL, 109, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (290, CAST(0x0000960C00000000 AS DateTime), CAST(0x0000961200000000 AS DateTime), CAST(0x0000961100000000 AS DateTime), NULL, 102, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (291, CAST(0x0000960D00000000 AS DateTime), CAST(0x0000961400000000 AS DateTime), CAST(0x0000961000000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (293, CAST(0x0000961300000000 AS DateTime), CAST(0x0000961B00000000 AS DateTime), NULL, NULL, 104, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (294, CAST(0x0000961400000000 AS DateTime), CAST(0x0000961F00000000 AS DateTime), NULL, N'They want to reevaluate their terms agreement with Finance.', 70, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (295, CAST(0x0000961800000000 AS DateTime), CAST(0x0000962200000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (296, CAST(0x0000961A00000000 AS DateTime), CAST(0x0000962100000000 AS DateTime), NULL, N'We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.', 51, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (297, CAST(0x0000962000000000 AS DateTime), CAST(0x0000962A00000000 AS DateTime), CAST(0x0000962500000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (298, CAST(0x0000962500000000 AS DateTime), CAST(0x0000963100000000 AS DateTime), CAST(0x0000962900000000 AS DateTime), NULL, 48, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (299, CAST(0x0000962700000000 AS DateTime), CAST(0x0000963100000000 AS DateTime), NULL, NULL, 81, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (300, CAST(0x0000962900000000 AS DateTime), CAST(0x0000963400000000 AS DateTime), NULL, NULL, 122, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (301, CAST(0x0000962900000000 AS DateTime), CAST(0x0000963300000000 AS DateTime), NULL, N'Customer requested that DHL is used for this shipping', 103, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (302, CAST(0x0000962B00000000 AS DateTime), CAST(0x0000963600000000 AS DateTime), CAST(0x0000962A00000000 AS DateTime), NULL, 72, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (303, CAST(0x0000962F00000000 AS DateTime), CAST(0x0000963600000000 AS DateTime), NULL, NULL, 95, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (304, CAST(0x0000963000000000 AS DateTime), CAST(0x0000963A00000000 AS DateTime), NULL, NULL, 33, N'DISPUTED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (305, CAST(0x0000963000000000 AS DateTime), CAST(0x0000963600000000 AS DateTime), NULL, NULL, 70, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (306, CAST(0x0000963600000000 AS DateTime), CAST(0x0000964000000000 AS DateTime), NULL, NULL, 38, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (307, CAST(0x0000963700000000 AS DateTime), CAST(0x0000964100000000 AS DateTime), NULL, N'Customer claims container with shipment was damaged during shipping and some items were missing. I am talking to FedEx about this.', 13, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (308, CAST(0x0000963E00000000 AS DateTime), CAST(0x0000964A00000000 AS DateTime), NULL, N'Customer credit limit exceeded. Will ship when a payment is received.', 103, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (309, CAST(0x0000963E00000000 AS DateTime), CAST(0x0000964500000000 AS DateTime), NULL, NULL, 94, N'WAITING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (310, CAST(0x0000963F00000000 AS DateTime), CAST(0x0000964B00000000 AS DateTime), NULL, NULL, 19, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (311, CAST(0x0000964500000000 AS DateTime), CAST(0x0000965000000000 AS DateTime), NULL, NULL, 83, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (312, CAST(0x0000964700000000 AS DateTime), CAST(0x0000964E00000000 AS DateTime), NULL, NULL, 44, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (313, CAST(0x0000964900000000 AS DateTime), CAST(0x0000965300000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (314, CAST(0x0000964B00000000 AS DateTime), CAST(0x0000965400000000 AS DateTime), NULL, N'Customer requested that DHL is used for this shipping', 26, N'PROCESSING')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (315, CAST(0x0000964C00000000 AS DateTime), CAST(0x0000965300000000 AS DateTime), NULL, N'Customer credit limit exceeded. Will ship when a payment is received.', 85, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (317, CAST(0x0000965000000000 AS DateTime), CAST(0x0000965600000000 AS DateTime), NULL, NULL, 93, N'DISPUTED')
GO
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (318, CAST(0x0000965300000000 AS DateTime), CAST(0x0000965900000000 AS DateTime), NULL, N'Customer doesn''t like the colors and precision of the models.', 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (319, CAST(0x0000965600000000 AS DateTime), CAST(0x0000965E00000000 AS DateTime), NULL, NULL, 97, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (320, CAST(0x0000965700000000 AS DateTime), CAST(0x0000966200000000 AS DateTime), NULL, NULL, 91, N'CANCELLED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (322, CAST(0x0000966300000000 AS DateTime), CAST(0x0000966B00000000 AS DateTime), CAST(0x0000962B00000000 AS DateTime), NULL, 6, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (323, CAST(0x0000966400000000 AS DateTime), CAST(0x0000967000000000 AS DateTime), NULL, NULL, 17, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (324, CAST(0x0000966400000000 AS DateTime), CAST(0x0000966A00000000 AS DateTime), CAST(0x0000962C00000000 AS DateTime), NULL, 66, N'SHIPPED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (325, CAST(0x0000966500000000 AS DateTime), CAST(0x0000966D00000000 AS DateTime), NULL, NULL, 11, N'RESOLVED')
INSERT [dbo].[bestellingen] ([ID], [bestelDatum], [leverDatum], [verzendDatum], [opmerkingen], [klantID], [status]) VALUES (326, CAST(0x0000966500000000 AS DateTime), CAST(0x0000966C00000000 AS DateTime), NULL, NULL, 4, N'WAITING')
SET IDENTITY_INSERT [dbo].[bestellingen] OFF
SET IDENTITY_INSERT [dbo].[klanten] ON 

INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (1, N'Atelier graphique', N'54, rue Royale', N'44000', N'Nantes', NULL, 7, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (2, N'Signal Gift Stores', N'8489 Strong St.', N'83030', N'Las Vegas', N'NV', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (4, N'La Rochelle Gifts', N'67, rue des Cinquante Otages', N'44000', N'Nantes', NULL, 7, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (5, N'Baane Mini Imports', N'Erling Skakkes gate 78', N'4110', N'Stavern', NULL, 16, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (6, N'Mini Gifts Distributors Ltd.', N'5677 Strong St.', N'97562', N'San Rafael', N'CA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (7, N'Havel & Zbyszek Co', N'ul. Filtrowa 68', N'01-012', N'Warszawa', NULL, 18, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (8, N'Blauer See Auto, Co.', N'Lyonerstr. 34', N'60528', N'Frankfurt', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (9, N'Mini Wheels Co.', N'5557 North Pendale Street', N'94217', N'San Francisco', N'SA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (10, N'Land of Toys Inc.', N'897 Long Airport Avenue', N'10022', N'NYC', N'NY', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (11, N'Euro+ Shopping Channel', N'C/ Moralzarzal, 86', N'28034', N'Madrid', NULL, 23, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (12, N'Volvo Model Replicas, Co', N'Berguvsvägen  8', N'S-958 22', N'Luleå', NULL, 24, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (13, N'Danish Wholesale Imports', N'Vinbæltet 34', N'1734', N'Kobenhavn', NULL, 5, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (14, N'Saveley & Henriot, Co.', N'2, rue du Commerce', N'69004', N'Lyon', NULL, 7, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (15, N'Dragon Souveniers, Ltd.', N'Bronz Sok.', N'079903', N'Singapore', NULL, 21, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (16, N'Muscle Machine Inc', N'4092 Furth Circle', N'10022', N'NYC', N'NY', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (17, N'Diecast Classics Inc.', N'7586 Pompton St.', N'70267', N'Allentown', N'PA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (18, N'Technics Stores Inc.', N'9408 Furth Circle', N'94217', N'Burlingame', N'CA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (19, N'Handji Gifts& Co', N'106 Linden Road Sandown', N'069045', N'Singapore', NULL, 21, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (20, N'Herkku Gifts', N'Brehmen St. 121', N'N 5804', N'Bergen', NULL, 16, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (21, N'American Souvenirs Inc', N'149 Spinnaker Dr.', N'97823', N'New Haven', N'CT', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (22, N'Porto Imports Co.', N'Estrada da saúde n. 58', N'1756', N'Lisboa', NULL, 19, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (23, N'Daedalus Designs Imports', N'184, chaussée de Tournai', N'59000', N'Lille', NULL, 7, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (24, N'La Corne D''abondance, Co.', N'265, boulevard Charonne', N'75012', N'Paris', NULL, 7, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (25, N'Cambridge Collectables Co.', N'4658 Baden Av.', N'51247', N'Cambridge', N'MA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (26, N'Gift Depot Inc.', N'25593 South Bay Ln.', N'97562', N'Bridgewater', N'CT', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (27, N'Osaka Souveniers Co.', N'1-6-20 Dojima', N'530-0003', N'Kita-ku', N'Osaka', 13, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (28, N'Vitachrome Inc.', N'2678 Kingston Rd.', N'10022', N'NYC', N'NY', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (29, N'Toys of Finland, Co.', N'Keskuskatu 45', N'21240', N'Helsinki', NULL, 6, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (30, N'AV Stores, Co.', N'Fauntleroy Circus', N'EC2 5NT', N'Manchester', NULL, 26, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (31, N'Clover Collections, Co.', N'25 Maiden Lane', N'2', N'Dublin', NULL, 10, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (32, N'Auto-Moto Classics Inc.', N'16780 Pompton St.', N'58339', N'Brickhaven', N'MA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (33, N'UK Collectables, Ltd.', N'12, Berkeley Gardens Blvd', N'WX1 6LT', N'Liverpool', NULL, 26, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (34, N'Canadian Gift Exchange Network', N'1900 Oak St.', N'V3F 2K1', N'Vancouver', N'BC', 4, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (35, N'Online Mini Collectables', N'7635 Spinnaker Dr.', N'58339', N'Brickhaven', N'MA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (36, N'Toys4GrownUps.com', N'78934 Hillside Dr.', N'90003', N'Pasadena', N'CA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (37, N'Asian Shopping Network, Co', N'Suntec Tower Three', N'038988', N'Singapore', NULL, 21, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (38, N'Mini Caravy', N'24, place Kléber', N'67000', N'Strasbourg', NULL, 7, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (39, N'King Kong Collectables, Co.', N'Bank of China Tower', NULL, N'Central Hong Kong', NULL, 9, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (40, N'Enaco Distributors', N'Rambla de Cataluña, 23', N'08022', N'Barcelona', NULL, 23, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (41, N'Boards & Toys Co.', N'4097 Douglas Av.', N'92561', N'Glendale', N'GA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (42, N'Natürlich Autos', N'Taucherstraße 10', N'01307', N'Cunewalde', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (43, N'Heintze Collectables', N'Smagsloget 45', N'8200', N'Århus', NULL, 5, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (44, N'Québec Home Shopping Network', N'43 rue St. Laurent', N'H1J 1C3', N'Montréal', N'Québec', 4, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (45, N'ANG Resellers', N'Gran Vía, 1', N'28001', N'Madrid', NULL, 23, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (46, N'Collectable Mini Designs Co.', N'361 Furth Circle', N'91217', N'San Diego', N'CA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (47, N'giftsbymail.co.uk', N'Garden House', N'PO31 7PJ', N'Cowes', N'Isle of Wight', 26, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (48, N'Alpha Cognac', N'1 rue Alsace-Lorraine', N'31000', N'Toulouse', NULL, 7, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (49, N'Messner Shopping Network', N'Magazinweg 7', N'60528', N'Frankfurt', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (50, N'Amica Models & Co.', N'Via Monte Bianco 34', N'10100', N'Torino', NULL, 12, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (51, N'Lyon Souveniers', N'27 rue du Colonel Pierre Avia', N'75508', N'Paris', NULL, 7, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (52, N'Auto Associés & Cie.', N'67, avenue de l''Europe', N'78000', N'Versailles', NULL, 7, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (53, N'Toms Spezialitäten, Ltd', N'Mehrheimerstr. 369', N'50739', N'Köln', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (54, N'Royal Canadian Collectables, Ltd.', N'23 Tsawassen Blvd.', N'T2F 8M4', N'Tsawassen', N'BC', 4, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (55, N'Franken Gifts, Co', N'Berliner Platz 43', N'80805', N'München', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (57, N'Rovelli Gifts', N'Via Ludovico il Moro 22', N'24100', N'Bergamo', NULL, 12, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (59, N'Marta''s Replicas Co.', N'39323 Spinnaker Dr.', N'51247', N'Cambridge', N'MA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (60, N'BG&E Collectables', N'Rte des Arsenaux 41 ', N'1700', N'Fribourg', NULL, 25, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (61, N'Vida Sport, Ltd', N'Grenzacherweg 237', N'1203', N'Genève', NULL, 25, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (62, N'Norway Gifts By Mail, Co.', N'Drammensveien 126A', N'N 0106', N'Oslo', NULL, 16, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (63, N'Schuyler Imports', N'Kingsfordweg 151', N'1043 GR', N'Amsterdam', NULL, 14, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (64, N'Der Hund Imports', N'Obere Str. 57', N'12209', N'Berlin', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (65, N'Oulu Toy Supplies, Inc.', N'Torikatu 38', N'90110', N'Oulu', NULL, 6, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (66, N'Petit Auto', N'Rue Joseph-Bens 532', N'B-1180', N'Bruxelles', NULL, 3, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (67, N'Mini Classics', N'3758 North Pendale Street', N'24067', N'White Plains', N'NY', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (68, N'Mini Creations Ltd.', N'4575 Hillside Dr.', N'50553', N'New Bedford', N'MA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (69, N'Corporate Gift Ideas Co.', N'7734 Strong St.', N'94217', N'San Francisco', N'CA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (70, N'Down Under Souveniers, Inc', N'162-164 Grafton Road', NULL, N'Auckland  ', NULL, 15, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (71, N'Stylish Desk Decors, Co.', N'35 King George', N'WX3 6FW', N'London', NULL, 26, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (72, N'Tekni Collectables Inc.', N'7476 Moss Rd.', N'94019', N'Newark', N'NJ', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (74, N'Suominen Souveniers', N'Software Engineering Center', N'FIN-02271', N'Espoo', NULL, 6, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (75, N'Cramer Spezialitäten, Ltd', N'Maubelstr. 90', N'14776', N'Brandenburg', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (76, N'Classic Gift Ideas, Inc', N'782 First Street', N'71270', N'Philadelphia', N'PA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (77, N'CAF Imports', N'Merchants House', N'28023', N'Madrid', NULL, 23, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (78, N'Men ''R'' US Retailers, Ltd.', N'6047 Douglas Av.', N'91003', N'Los Angeles', N'CA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (79, N'Asian Treasures, Inc.', N'8 Johnstown Road', NULL, N'Cork', N'Co. Cork', 10, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (80, N'Marseille Mini Autos', N'12, rue des Bouchers', N'13008', N'Marseille', NULL, 7, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (81, N'Reims Collectables', N'59 rue de l''Abbaye', N'51100', N'Reims', NULL, 7, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (82, N'SAR Distributors, Co', N'1250 Pretorius Street', N'0028', N'Hatfield', N'Pretoria', 22, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (83, N'GiftsForHim.com', N'199 Great North Road', NULL, N'Auckland', NULL, 15, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (84, N'Kommission Auto', N'Luisenstr. 48', N'44087', N'Münster', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (85, N'Gifts4AllAges.com', N'8616 Spinnaker Dr.', N'51003', N'Boston', N'MA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (86, N'Online Diecast Creations Co.', N'2304 Long Airport Avenue', N'62005', N'Nashua', N'NH', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (87, N'Lisboa Souveniers, Inc', N'Jardim das rosas n. 32', N'1675', N'Lisboa', NULL, 19, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (88, N'Precious Collectables', N'Hauptstr. 29', N'3012', N'Bern', NULL, 25, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (89, N'Collectables For Less Inc.', N'7825 Douglas Av.', N'58339', N'Brickhaven', N'MA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (90, N'Royale Belge', N'Boulevard Tirou, 255', N'B-6000', N'Charleroi', NULL, 3, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (91, N'Salzburg Collectables', N'Geislweg 14', N'5020', N'Salzburg', NULL, 2, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (92, N'Cruz & Sons Co.', N'15 McCallum Street', N'1227 MM', N'Makati City', NULL, 17, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (93, N'L''ordine Souveniers', N'Strada Provinciale 124', N'42100', N'Reggio Emilia', NULL, 12, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (94, N'Tokyo Collectables, Ltd', N'2-2-8 Roppongi', N'106-0032', N'Minato-ku', N'Tokyo', 13, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (95, N'Auto Canal+ Petit', N'25, rue Lauriston', N'75016', N'Paris', NULL, 7, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (96, N'Stuttgart Collectable Exchange', N'Adenauerallee 900', N'70563', N'Stuttgart', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (97, N'Extreme Desk Decorations, Ltd', N'101 Lambton Quay', NULL, N'Wellington', NULL, 15, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (98, N'Bavarian Collectables Imports, Co.', N'Hansastr. 15', N'80686', N'Munich', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (99, N'Classic Legends Inc.', N'5905 Pompton St.', N'10022', N'NYC', N'NY', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (100, N'Feuer Online Stores, Inc', N'Heerstr. 22', N'04179', N'Leipzig', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (101, N'Gift Ideas Corp.', N'2440 Pompton St.', N'97561', N'Glendale', N'CT', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (102, N'Scandinavian Gift Ideas', N'Äkergatan 24', N'S-844 67', N'Bräcke', NULL, 24, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (103, N'The Sharp Gifts Warehouse', N'3086 Ingle Ln.', N'94217', N'San Jose', N'CA', 27, 10)
GO
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (104, N'Mini Auto Werke', N'Kirchgasse 6', N'8010', N'Graz', NULL, 2, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (105, N'Super Scale Inc.', N'567 North Pendale Street', N'97823', N'New Haven', N'CT', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (106, N'Microscale Inc.', N'5290 North Pendale Street', N'10022', N'NYC', N'NY', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (107, N'Corrida Auto Replicas, Ltd', N'C/ Araquil, 67', N'28023', N'Madrid', NULL, 23, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (108, N'Warburg Exchange', N'Walserweg 21', N'52066', N'Aachen', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (109, N'FunGiftIdeas.com', N'1785 First Street', N'50553', N'New Bedford', N'MA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (110, N'Anton Designs, Ltd.', N'c/ Gobelas, 19-1 Urb. La Florida', N'28023', N'Madrid', NULL, 23, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (112, N'Frau da Collezione', N'20093 Cologno Monzese', NULL, N'Milan', NULL, 12, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (113, N'West Coast Collectables Co.', N'3675 Furth Circle', N'94019', N'Burbank', N'CA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (114, N'Mit Vergnügen & Co.', N'Forsterstr. 57', N'68306', N'Mannheim', NULL, 8, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (115, N'Kremlin Collectables, Co.', N'2 Pobedy Square', N'196143', N'Saint Petersburg', NULL, 20, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (116, N'Raanan Stores, Inc', N'3 Hagalim Blv.', N'47625', N'Herzlia', NULL, 11, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (117, N'Iberia Gift Imports, Corp.', N'C/ Romero, 33', N'41101', N'Sevilla', NULL, 23, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (118, N'Motor Mint Distributors Inc.', N'11328 Douglas Av.', N'71270', N'Philadelphia', N'PA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (119, N'Signal Collectibles Ltd.', N'2793 Furth Circle', N'94217', N'Brisbane', N'CA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (120, N'Double Decker Gift Stores, Ltd', N'120 Hanover Sq.', N'WA1 1DP', N'London', NULL, 26, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (121, N'Diecast Collectables', N'6251 Ingle Ln.', N'51003', N'Boston', N'MA', 27, 10)
INSERT [dbo].[klanten] ([ID], [naam], [straat], [postcode], [gemeente], [provincie], [landID], [userlevel]) VALUES (122, N'Kelly''s Gift Shop', N'Arenales 1938 3''A''', NULL, N'Auckland  ', NULL, 15, 10)
SET IDENTITY_INSERT [dbo].[klanten] OFF
SET IDENTITY_INSERT [dbo].[landen] ON 

INSERT [dbo].[landen] ([ID], [naam]) VALUES (2, N'Austria')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (3, N'Belgium')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (4, N'Canada')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (5, N'Denmark')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (6, N'Finland')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (7, N'France')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (8, N'Germany')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (9, N'Hong Kong')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (10, N'Ireland')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (11, N'Israel')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (12, N'Italy')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (13, N'Japan')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (14, N'Netherlands')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (15, N'New Zealand')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (16, N'Norway  ')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (17, N'Philippines')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (18, N'Poland')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (19, N'Portugal')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (20, N'Russia')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (21, N'Singapore')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (22, N'South Africa')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (23, N'Spain')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (24, N'Sweden')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (25, N'Switzerland')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (26, N'UK')
INSERT [dbo].[landen] ([ID], [naam]) VALUES (27, N'USA')
SET IDENTITY_INSERT [dbo].[landen] OFF
SET IDENTITY_INSERT [dbo].[productcategories] ON 

INSERT [dbo].[productcategories] ([ID], [naam], [omschrijving]) VALUES (1, N'Classic Cars', N'Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.')
INSERT [dbo].[productcategories] ([ID], [naam], [omschrijving]) VALUES (2, N'Motorcycles', N'Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.')
INSERT [dbo].[productcategories] ([ID], [naam], [omschrijving]) VALUES (3, N'Planes', N'Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.')
INSERT [dbo].[productcategories] ([ID], [naam], [omschrijving]) VALUES (4, N'Ships', N'The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.')
INSERT [dbo].[productcategories] ([ID], [naam], [omschrijving]) VALUES (5, N'Trains', N'Model trains are a rewarding hobby for enthusiasts of all ages. Whether you''re looking for collectible wooden trains, electric streetcars or locomotives, you''ll find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.')
INSERT [dbo].[productcategories] ([ID], [naam], [omschrijving]) VALUES (6, N'Trucks and Buses', N'The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.')
INSERT [dbo].[productcategories] ([ID], [naam], [omschrijving]) VALUES (7, N'Vintage Cars', N'Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.')
SET IDENTITY_INSERT [dbo].[productcategories] OFF
SET IDENTITY_INSERT [dbo].[producten] ON 

INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (1, N'1969 Harley Davidson Ultimate Chopper', N'1:10', N'This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.', 7933, 917, CAST(48.81 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (2, N'1952 Alpine Renault 1300', N'1:10', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 7305, 778, CAST(98.58 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (3, N'1996 Moto Guzzi 1100i', N'1:10', N'Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 6625, 891, CAST(68.99 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (4, N'2003 Harley-Davidson Eagle Drag Bike', N'1:10', N'Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine', 5582, 867, CAST(91.02 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (5, N'1972 Alfa Romeo GTA', N'1:10', N'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3252, 842, CAST(85.68 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (6, N'1962 LanciaA Delta 16V', N'1:10', N'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 6791, 726, CAST(103.42 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (7, N'1968 Ford Mustang', N'1:12', N'Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.', 68, 834, CAST(95.34 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (8, N'2001 Ferrari Enzo', N'1:12', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 3619, 815, CAST(95.59 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (9, N'1958 Setra Bus', N'1:12', N'Model features 30 windows, skylights & glare resistant glass, working steering system, original logos', 1579, 798, CAST(77.90 AS Numeric(10, 2)), 6)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (10, N'2002 Suzuki XREO', N'1:12', N'Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.', 9997, 883, CAST(66.27 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (11, N'1969 Corvair Monza', N'1:18', N'1:18 scale die-cast about 10" long doors open, hood opens, trunk opens and wheels roll', 6906, 799, CAST(89.14 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (12, N'1968 Dodge Charger', N'1:12', N'1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black', 9123, 771, CAST(75.16 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (13, N'1969 Ford Falcon', N'1:12', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 1049, 759, CAST(83.05 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (14, N'1970 Plymouth Hemi Cuda', N'1:12', N'Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.', 5663, 802, CAST(31.92 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (15, N'1957 Chevy Pickup', N'1:12', N'1:12 scale die-cast about 20" long Hood opens, Rubber wheels', 6125, 870, CAST(55.70 AS Numeric(10, 2)), 6)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (16, N'1969 Dodge Charger', N'1:12', N'Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.', 7323, 866, CAST(58.73 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (17, N'1940 Ford Pickup Truck', N'1:18', N'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 2613, 806, CAST(58.33 AS Numeric(10, 2)), 6)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (18, N'1993 Mazda RX-7', N'1:18', N'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.', 3975, 886, CAST(83.51 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (19, N'1937 Lincoln Berline', N'1:18', N'Features opening engine cover, doors, trunk, and fuel filler cap. Color black', 8693, 997, CAST(60.62 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (20, N'1936 Mercedes-Benz 500K Special Roadster', N'1:18', N'This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.', 8635, 876, CAST(24.26 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (21, N'1965 Aston Martin DB5', N'1:18', N'Die-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.', 9042, 828, CAST(65.96 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (22, N'1980s Black Hawk Helicopter', N'1:18', N'1:18 scale replica of actual Army''s UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.', 5330, 882, CAST(77.27 AS Numeric(10, 2)), 3)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (23, N'1917 Grand Touring Sedan', N'1:18', N'This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.', 2724, 747, CAST(86.70 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (24, N'1948 Porsche 356-A Roadster', N'1:18', N'This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8826, 837, CAST(53.90 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (25, N'1995 Honda Civic', N'1:18', N'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.', 9772, 813, CAST(93.89 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (26, N'1998 Chrysler Plymouth Prowler', N'1:18', N'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 4724, 814, CAST(101.51 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (27, N'1911 Ford Town Car', N'1:18', N'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system.', 540, 649, CAST(33.30 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (28, N'1964 Mercedes Tour Bus', N'1:18', N'Exact replica. 100+ parts. working steering system, original logos', 8258, 892, CAST(74.86 AS Numeric(10, 2)), 6)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (29, N'1932 Model A Ford J-Coupe', N'1:18', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine', 9354, 780, CAST(58.48 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (30, N'1926 Ford Fire Engine', N'1:18', N'Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.', 2018, 753, CAST(24.92 AS Numeric(10, 2)), 6)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (31, N'P-51-D Mustang', N'1:72', N'Has retractable wheels and comes with a stand', 992, 800, CAST(49.00 AS Numeric(10, 2)), 3)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (32, N'1936 Harley Davidson El Knucklehead', N'1:18', N'Intricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.', 4357, 763, CAST(24.23 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (33, N'1928 Mercedes-Benz SSK', N'1:18', N'This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.', 548, 686, CAST(72.56 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (34, N'1999 Indy 500 Monte Carlo SS', N'1:18', N'Features include opening and closing doors. Color: Red', 8164, 806, CAST(56.76 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (35, N'1913 Ford Model T Speedster', N'1:18', N'This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.', 4189, 880, CAST(60.78 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (36, N'1934 Ford V8 Coupe', N'1:18', N'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 5649, 807, CAST(34.35 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (37, N'1999 Yamaha Speed Boat', N'1:18', N'Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 4259, 736, CAST(51.61 AS Numeric(10, 2)), 4)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (38, N'18th Century Vintage Horse Carriage', N'1:18', N'Hand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts. This collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.', 5992, 741, CAST(60.74 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (39, N'1903 Ford Model A', N'1:18', N'Features opening trunk,  working steering system', 3913, 607, CAST(68.30 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (40, N'1992 Ferrari 360 Spider red', N'1:18', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 8347, 1603, CAST(77.90 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (41, N'1985 Toyota Supra', N'&:18', N'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box', 7733, 0, CAST(57.01 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (42, N'Collectable Wooden Train', N'&:18', N'Hand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.', 6450, 673, CAST(67.56 AS Numeric(10, 2)), 5)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (43, N'1969 Dodge Super Bee', N'1:18', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 1917, 889, CAST(49.05 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (44, N'1917 Maxwell Touring Car', N'1:18', N'Features Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System', 7913, 830, CAST(57.54 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (45, N'1976 Ford Gran Torino', N'1:18', N'Highly detailed 1976 Ford Gran Torino "Starsky and Hutch" diecast model. Very well constructed and painted in red and white patterns.', 9127, 798, CAST(73.49 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (46, N'1948 Porsche Type 356 Roadster', N'1:18', N'This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap,  and 4 opening doors.', 8990, 902, CAST(62.16 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (47, N'1957 Vespa GS150', N'1:18', N'Features rotating wheels , working kick stand. Comes with stand.', 7689, 840, CAST(32.95 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (48, N'1941 Chevrolet Special Deluxe Cabriolet', N'1:18', N'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.', 2378, 787, CAST(64.58 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (49, N'1970 Triumph Spitfire', N'1:18', N'Features include opening and closing doors. Color: White.', 5545, 867, CAST(91.92 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (50, N'1932 Alfa Romeo 8C2300 Spider Sport', N'1:18', N'This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.', 6553, 671, CAST(43.26 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (51, N'1904 Buick Runabout', N'1:18', N'Features opening trunk,  working steering system', 8290, 726, CAST(52.66 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (52, N'1940s Ford truck', N'1:18', N'This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940''s Pick-Up truck is painted in classic dark green color, and features rotating wheels.', 3128, 775, CAST(84.76 AS Numeric(10, 2)), 6)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (53, N'1939 Cadillac Limousine', N'1:18', N'Features completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles', 6645, 770, CAST(23.14 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (54, N'1957 Corvette Convertible', N'1:18', N'1957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.', 1249, 933, CAST(69.93 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (55, N'1957 Ford Thunderbird', N'1:18', N'This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.', 3209, 591, CAST(34.21 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (56, N'1970 Chevy Chevelle SS 454', N'1:24', N'This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.', 1005, 676, CAST(49.24 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (57, N'1970 Dodge Coronet', N'1:24', N'1:24 scale die-cast about 18" long doors open, hood opens and rubber wheels', 4074, 832, CAST(32.37 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (58, N'1997 BMW R 1100 S', N'1:24', N'Detailed scale replica with working suspension and constructed from over 70 parts', 7003, 795, CAST(60.86 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (59, N'1966 Shelby Cobra 427 S/C', N'1:24', N'This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it''s own display case.', 8197, 828, CAST(29.18 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (60, N'1928 British Royal Navy Airplane', N'1:24', N'Official logos and insignias', 3627, 822, CAST(66.74 AS Numeric(10, 2)), 3)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (61, N'1939 Chevrolet Deluxe Coupe', N'1:24', N'This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.', 7332, 771, CAST(22.57 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (62, N'1960 BSA Gold Star DBD34', N'1:24', N'Detailed scale replica with working suspension and constructed from over 70 parts', 15, 890, CAST(37.32 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (63, N'18th century schooner', N'1:24', N'All wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.', 1898, 713, CAST(82.34 AS Numeric(10, 2)), 4)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (64, N'1938 Cadillac V-16 Presidential Limousine', N'1:24', N'This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.', 2847, 768, CAST(20.61 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (65, N'1962 Volkswagen Microbus', N'1:24', N'This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.', 2327, 740, CAST(61.34 AS Numeric(10, 2)), 6)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (66, N'1982 Ducati 900 Monster', N'1:24', N'Features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', 6840, 856, CAST(47.10 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (67, N'1949 Jaguar XK 120', N'1:24', N'Precision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 2350, 791, CAST(47.25 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (68, N'1958 Chevy Corvette Limited Edition', N'1:24', N'The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.', 2542, 810, CAST(15.91 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (69, N'1900s Vintage Bi-Plane', N'1:24', N'Hand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.', 5942, 820, CAST(34.25 AS Numeric(10, 2)), 3)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (70, N'1952 Citroen-15CV', N'1:24', N'Precision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.', 1452, 705, CAST(72.82 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (71, N'1982 Lamborghini Diablo', N'1:24', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 7723, 777, CAST(16.24 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (72, N'1912 Ford Model T Delivery Wagon', N'1:24', N'This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.', 9173, 722, CAST(46.91 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (73, N'1969 Chevrolet Camaro Z28', N'1:24', N'1969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.', 4695, 719, CAST(50.51 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (74, N'1971 Alpine Renault 1600s', N'1:24', N'This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 7995, 870, CAST(38.58 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (75, N'1937 Horch 930V Limousine', N'1:24', N'Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system', 2902, 768, CAST(26.30 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (76, N'2002 Chevy Corvette', N'1:24', N'The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.', 9446, 757, CAST(62.11 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (77, N'1940 Ford Delivery Sedan', N'1:24', N'Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.', 6621, 640, CAST(48.64 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (78, N'1956 Porsche 356A Coupe', N'1:18', N'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.', 6600, 925, CAST(98.30 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (79, N'Corsair F4U ( Bird Cage)', N'1:24', N'Has retractable wheels and comes with a stand. Official logos and insignias.', 6812, 897, CAST(29.34 AS Numeric(10, 2)), 3)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (80, N'1936 Mercedes Benz 500k Roadster', N'1:24', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.', 2081, 635, CAST(21.75 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (81, N'1992 Porsche Cayenne Turbo Silver', N'1:24', N'This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.', 6582, 747, CAST(69.78 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (82, N'1936 Chrysler Airflow', N'1:24', N'Features opening trunk,  working steering system. Color dark green.', 4710, 878, CAST(57.46 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (83, N'1900s Vintage Tri-Plane', N'1:24', N'Hand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.', 2756, 801, CAST(36.23 AS Numeric(10, 2)), 3)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (84, N'1961 Chevrolet Impala', N'1:18', N'This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.', 7869, 888, CAST(32.33 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (85, N'1980’s GM Manhattan Express', N'1:32', N'This 1980’s era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.', 5099, 706, CAST(53.93 AS Numeric(10, 2)), 6)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (86, N'1997 BMW F650 ST', N'1:32', N'Features official die-struck logos and baked enamel finish. Comes with stand.', 178, 863, CAST(66.92 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (87, N'1982 Ducati 996 R', N'1:32', N'Features rotating wheels , working kick stand. Comes with stand.', 9241, 801, CAST(24.14 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (88, N'1954 Greyhound Scenicruiser', N'1:32', N'Model features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos', 2874, 809, CAST(25.98 AS Numeric(10, 2)), 6)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (89, N'1950''s Chicago Surface Lines Streetcar', N'1:32', N'This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', 8601, 722, CAST(26.72 AS Numeric(10, 2)), 5)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (90, N'1996 Peterbilt 379 Stake Bed with Outrigger', N'1:32', N'This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab', 814, 827, CAST(33.61 AS Numeric(10, 2)), 6)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (91, N'1928 Ford Phaeton Deluxe', N'1:32', N'This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system', 136, 825, CAST(33.02 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (92, N'1974 Ducati 350 Mk3 Desmo', N'1:32', N'This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand', 3341, 796, CAST(56.13 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (93, N'1930 Buick Marquette Phaeton', N'1:50', N'Features opening trunk,  working steering system', 7062, 929, CAST(27.06 AS Numeric(10, 2)), 7)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (94, N'Diamond T620 Semi-Skirted Tanker', N'1:50', N'This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.', 1016, 836, CAST(68.29 AS Numeric(10, 2)), 6)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (95, N'1962 City of Detroit Streetcar', N'1:50', N'This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).', 1645, 853, CAST(37.49 AS Numeric(10, 2)), 5)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (96, N'2002 Yamaha YZR M1', N'1:50', N'Features rotating wheels , working kick stand. Comes with stand.', 600, 888, CAST(34.17 AS Numeric(10, 2)), 2)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (97, N'The Schooner Bluenose', N'1:700', N'All wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras. The schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.', 1897, 595, CAST(34.00 AS Numeric(10, 2)), 4)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (98, N'American Airlines: B767-300', N'1:700', N'Exact replia with official logos and insignias and retractable wheels', 5841, 830, CAST(51.15 AS Numeric(10, 2)), 3)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (99, N'The Mayflower', N'1:700', N'Measures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches wide. All wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.', 737, 698, CAST(43.30 AS Numeric(10, 2)), 4)
GO
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (100, N'HMS Bounty', N'1:700', N'Measures 30 inches Long x 27 1/2 inches High x 4 3/4 inches wide. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 3501, 757, CAST(39.83 AS Numeric(10, 2)), 4)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (101, N'America West Airlines B757-200', N'1:700', N'Official logos and insignias. Working steering system. Rotating jet engines', 9653, 808, CAST(68.80 AS Numeric(10, 2)), 3)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (102, N'The USS Constitution Ship', N'1:700', N'All wood with canvas sails. Measures 31 1/2" Length x 22 3/8" High x 8 1/4" Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.', 7083, 791, CAST(33.97 AS Numeric(10, 2)), 4)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (103, N'1982 Camaro Z28', N'1:18', N'Features include opening and closing doors. Color: White. Measures approximately 9 1/2" Long.', 6934, 727, CAST(46.53 AS Numeric(10, 2)), 1)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (104, N'ATA: B757-300', N'1:700', N'Exact replia with official logos and insignias and retractable wheels', 7106, 871, CAST(59.33 AS Numeric(10, 2)), 3)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (105, N'F/A 18 Hornet 1/72', N'1:72', N'10" Wingspan with retractable landing gears.Comes with pilot', 551, 890, CAST(54.40 AS Numeric(10, 2)), 3)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (106, N'The Titanic', N'1:700', N'Completed model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.', 1956, 765, CAST(51.09 AS Numeric(10, 2)), 4)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (107, N'The Queen Mary', N'1:700', N'Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.', 5088, 700, CAST(53.63 AS Numeric(10, 2)), 4)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (108, N'American Airlines: MD-11S', N'1:700', N'Polished finish. Exact replia with official logos and insignias and retractable wheels', 8820, 927, CAST(36.27 AS Numeric(10, 2)), 3)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (109, N'Boeing X-32A JSF', N'1:72', N'10" Wingspan with retractable landing gears.Comes with pilot', 4857, 756, CAST(32.77 AS Numeric(10, 2)), 3)
INSERT [dbo].[producten] ([ID], [naam], [schaal], [omschrijving], [opVoorraad], [besteld], [prijs], [categorieID]) VALUES (110, N'Pont Yacht', N'1:72', N'Measures 38 inches Long x 33 3/4 inches High. Includes a stand. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged', 414, 742, CAST(33.30 AS Numeric(10, 2)), 4)
SET IDENTITY_INSERT [dbo].[producten] OFF
ALTER TABLE [dbo].[klanten] ADD  CONSTRAINT [DF_klanten_userlevel]  DEFAULT ((10)) FOR [userlevel]
GO
ALTER TABLE [dbo].[producten] ADD  CONSTRAINT [DF_producten_opVoorraad]  DEFAULT ((0)) FOR [opVoorraad]
GO
ALTER TABLE [dbo].[producten] ADD  CONSTRAINT [DF_producten_besteld]  DEFAULT ((0)) FOR [besteld]
GO
ALTER TABLE [dbo].[besteldetails]  WITH CHECK ADD  CONSTRAINT [FK_besteldetails_bestellingen] FOREIGN KEY([bestellingID])
REFERENCES [dbo].[bestellingen] ([ID])
GO
ALTER TABLE [dbo].[besteldetails] CHECK CONSTRAINT [FK_besteldetails_bestellingen]
GO
ALTER TABLE [dbo].[besteldetails]  WITH CHECK ADD  CONSTRAINT [FK_besteldetails_producten] FOREIGN KEY([productID])
REFERENCES [dbo].[producten] ([ID])
GO
ALTER TABLE [dbo].[besteldetails] CHECK CONSTRAINT [FK_besteldetails_producten]
GO
ALTER TABLE [dbo].[bestellingen]  WITH CHECK ADD  CONSTRAINT [FK_bestellingen_klanten] FOREIGN KEY([klantID])
REFERENCES [dbo].[klanten] ([ID])
GO
ALTER TABLE [dbo].[bestellingen] CHECK CONSTRAINT [FK_bestellingen_klanten]
GO
ALTER TABLE [dbo].[klanten]  WITH CHECK ADD  CONSTRAINT [FK_klanten_landen] FOREIGN KEY([landID])
REFERENCES [dbo].[landen] ([ID])
GO
ALTER TABLE [dbo].[klanten] CHECK CONSTRAINT [FK_klanten_landen]
GO
ALTER TABLE [dbo].[producten]  WITH CHECK ADD  CONSTRAINT [FK_producten_productcategories] FOREIGN KEY([categorieID])
REFERENCES [dbo].[productcategories] ([ID])
GO
ALTER TABLE [dbo].[producten] CHECK CONSTRAINT [FK_producten_productcategories]
GO
USE [master]
GO
ALTER DATABASE [webshop] SET  READ_WRITE 
GO
