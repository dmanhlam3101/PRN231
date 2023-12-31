USE [master]
GO
/****** Object:  Database [ClothesStoreDB]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE DATABASE [ClothesStoreDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ClothesStoreDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ClothesStoreDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ClothesStoreDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ClothesStoreDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ClothesStoreDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ClothesStoreDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ClothesStoreDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ClothesStoreDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ClothesStoreDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ClothesStoreDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ClothesStoreDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET RECOVERY FULL 
GO
ALTER DATABASE [ClothesStoreDB] SET  MULTI_USER 
GO
ALTER DATABASE [ClothesStoreDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ClothesStoreDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ClothesStoreDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ClothesStoreDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ClothesStoreDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ClothesStoreDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ClothesStoreDB] SET QUERY_STORE = OFF
GO
USE [ClothesStoreDB]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[CustomerID] [nchar](5) NULL,
	[EmployeeID] [int] NULL,
	[Role] [int] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
	[IsActive] [bit] NULL,
	[CategoryGeneral] [nvarchar](55) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[CreateDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NULL,
	[DepartmentType] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](10) NOT NULL,
	[DepartmentID] [int] NULL,
	[Title] [nvarchar](30) NULL,
	[TitleOfCourtesy] [nvarchar](25) NULL,
	[BirthDate] [datetime] NULL,
	[HireDate] [datetime] NULL,
	[Address] [nvarchar](60) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order Details]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order Details](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[Freight] [money] NULL,
	[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](40) NOT NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NOT NULL,
	[IsActive] [bit] NULL,
	[Picture] [varchar](1000) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshTokens]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshTokens](
	[AccountId] [int] NULL,
	[TokenId] [varchar](25) NULL,
	[Token] [varchar](100) NULL,
	[Created] [datetime] NULL,
	[Expires] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (1, N'cust1@gmail.com', N'+TmcekM4ANU=', N'ERNSH', NULL, 2, 0)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (2, N'cust2@gmail.com', N'+TmcekM4ANU=', N'FAMIA', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (3, N'emp1@fpt.edu.vn', N'123', NULL, 5, 1, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (4, N'emp2@fpt.edu.vn', N'+TmcekM4ANU=', NULL, 2, 1, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (5, N'thopn3@gmail.com', N'123', N'EGYJF', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (6, N'thaitvdhe153071@fpt.edu.vn', N'+TmcekM4ANU=', N'MLJUF', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (7, N'tranvietdanhthaiht@gmail.com', N'123456789', N'EXYLG', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (9, N'thai@gmail.com', N'lnJgWA1pgsc=', N'LBDGQ', NULL, 2, 1)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (10, N'huy@gmail.com', N'12345', N'4KDSF', NULL, 2, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (11, N'huy@gmail.com', N'123', N'YKC0T', NULL, 2, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (12, N'huy@gmail.com', N'123', N'MPS83', NULL, 2, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (13, N'huy@gmail.com', N'123', N'1RJAI', NULL, 2, NULL)
INSERT [dbo].[Accounts] ([AccountID], [Email], [Password], [CustomerID], [EmployeeID], [Role], [IsActive]) VALUES (14, N'huydz@gmail.com', N'123', N'E0VH1', NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [CategoryGeneral]) VALUES (1, N'Shirts', N'Men''s Shirts', 1, N'Men')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [CategoryGeneral]) VALUES (2, N'Pants', N'Men''s Pants', 1, N'Men')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [CategoryGeneral]) VALUES (3, N'Accessory', N'Men''s Accessory', 1, N'Men')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [CategoryGeneral]) VALUES (4, N'Shirts', N'Woman''s Shirts', 1, N'Woman')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [CategoryGeneral]) VALUES (5, N'Pants', N'Woman''s Pants', 1, N'Woman')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [CategoryGeneral]) VALUES (6, N'Accessory', N'Woman''s Accessory', 1, N'Woman')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [CategoryGeneral]) VALUES (7, N'Shirts', N'Baby''s Shirts', 1, N'Baby')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [CategoryGeneral]) VALUES (8, N'Pants', N'Baby''s Pants', 1, N'Baby')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [CategoryGeneral]) VALUES (10, N'Accessory', N'Baby''s Accessory', 1, N'Baby')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName], [Description], [IsActive], [CategoryGeneral]) VALUES (1010, N'Dress', N'Women''s Dress', 1, N'Woman')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'1RJAI', N'FPTU', N'NO1', N'NO', N'NO', NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'4KDSF', N'FPTU', N'huy', N'NO', N'NO', NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'E0VH1', N'FPTU', N'NA1', N'NA', N'Vinhome Smart City1', NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'EGYJF', N'FPTU', N'ThoPN3', N'Mr', N'Vinhome Smart City', CAST(N'2022-11-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'ERNSH', N'Ernst Handel', N'Roland Mendel', N'Sales Manager', N'Kirchgasse 6', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 0)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'EXYLG', N'FPTUUUU A', N'Nguyen Van B', N'Ha Tinh A', N'Ha Tinh A', NULL, 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'FAMIA', N'Familia Arquibaldo', N'Aria Cruz', N'Marketing Assistant', N'Rua Orós, 92', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'FISSA', N'FISSA Fabrica Inter. Salchichas S.A.', N'Diego Roel', N'Accounting Manager', N'C/ Moralzarzal, 86', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'FN48P', N'haha', N'string', N'string', N'string', CAST(N'2023-03-07T15:18:49.643' AS DateTime), 0)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'FOLIG', N'Folies gourmandes', N'Martine Rancé', N'Assistant Sales Agent', N'184, chaussée de Tournai', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'FOLKO', N'Folk och fä HB', N'Maria Larsson', N'Owner', N'Åkergatan 24', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'FRANK', N'Frankenversand', N'Peter Franken', N'Marketing Manager', N'Berliner Platz 43', CAST(N'2000-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'FRANR', N'France restauration', N'Carine Schmitt', N'Marketing Manager', N'54, rue Royale', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'FRANS', N'Franchi S.p.A.', N'Paolo Accorti', N'Sales Representative', N'Via Monte Bianco 34', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'FURIB', N'Furia Bacalhau e Frutos do Mar', N'Lino Rodriguez', N'Sales Manager', N'Jardim das rosas n. 32', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'GALED', N'Galería del gastrónomo', N'Eduardo Saavedra', N'Marketing Manager', N'Rambla de Cataluña, 23', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'GODOS', N'Godos Cocina Típica', N'José Pedro Freyre', N'Sales Manager', N'C/ Romero, 33', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'GOURL', N'Gourmet Lanchonetes', N'André Fonseca', N'Sales Associate', N'Av. Brasil, 442', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'GREAL', N'Great Lakes Food Market', N'Howard Snyder', N'Marketing Manager', N'2732 Baker Blvd.', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'GROSR', N'GROSELLA-Restaurante', N'Manuel Pereira', N'Owner', N'5ª Ave. Los Palos Grandes', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'HANAR', N'Hanari Carnes', N'Mario Pontes', N'Accounting Manager', N'Rua do Paço, 67', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'HILAA', N'HILARION-Abastos', N'Carlos Hernández', N'Sales Representative', N'Carrera 22 con Ave. Carlos Soublette #8-35', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'HLKNL', N'thai', N'thai', N'thai', N'thai', CAST(N'2022-11-01T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'HUNGC', N'Hungry Coyote Import Store', N'Yoshi Latimer', N'Sales Representative', N'City Center Plaza 516 Main St.', CAST(N'2022-11-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'LBDGQ', N'Hoa Lac', N'Hoa Lac', N'Hoa Lac', N'Hoa Lac', CAST(N'2022-11-03T19:00:24.003' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'LPAEK', N'FPTU', N'ThoPN3', N'Mr', N'Vinhome Smart City', CAST(N'2022-11-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'LSQDR', N'thai1', N'thai1', N'thai1', N'thai1', CAST(N'2022-11-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'MLJUF', N'FPT University a', N'Trần Viết Danh Thái', N'Hòa Lạc Hà Nội', N'Hòa Lạc Hà Nội', CAST(N'2022-11-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'MPS83', N'FPTU', N'NO', N'NO', N'NO', NULL, NULL)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'SNYRW', N'thai2', N'thai2', N'thai2', N'thai2', CAST(N'2022-11-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'VEUCC', N'FPTU', N'ThoPN3', N'Mr', N'Vinhome Smart City', CAST(N'2022-11-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Customers] ([CustomerID], [CompanyName], [ContactName], [ContactTitle], [Address], [CreateDate], [IsActive]) VALUES (N'YKC0T', N'FPTU', N'NO', N'NO', N'NO', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType], [IsActive]) VALUES (1, N'Bussiness Department 1', N'Bussiness', 1)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType], [IsActive]) VALUES (2, N'Bussiness Department 2', N'Bussiness', 1)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType], [IsActive]) VALUES (3, N'Addministration Deparment', N'Back Office', 1)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType], [IsActive]) VALUES (4, N'R&D Department', N'Back Office', 1)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [DepartmentType], [IsActive]) VALUES (5, N'Operating Department', N'Back Office', 1)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [IsActive]) VALUES (1, N'Davolio', N'Nancy', 1, N'Sales Representative', N'Ms.', CAST(N'1948-12-08T00:00:00.000' AS DateTime), CAST(N'1992-05-01T00:00:00.000' AS DateTime), N'507 - 20th Ave. E.
Apt. 2A', 1)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [IsActive]) VALUES (2, N'Fuller', N'Andrew', 5, N'Vice President, Sales', N'Dr.', CAST(N'1952-02-19T00:00:00.000' AS DateTime), CAST(N'1992-08-14T00:00:00.000' AS DateTime), N'908 W. Capital Way', 1)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [IsActive]) VALUES (3, N'Leverling', N'Janet', 1, N'Sales Representative', N'Ms.', CAST(N'1963-08-30T00:00:00.000' AS DateTime), CAST(N'1992-04-01T00:00:00.000' AS DateTime), N'722 Moss Bay Blvd.', 1)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [IsActive]) VALUES (4, N'Peacock', N'Margaret', 2, N'Sales Representative', N'Mrs.', CAST(N'1937-09-19T00:00:00.000' AS DateTime), CAST(N'1993-05-03T00:00:00.000' AS DateTime), N'4110 Old Redmond Rd.', 1)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [IsActive]) VALUES (5, N'Buchanan', N'Steven', 1, N'Sales Manager', N'Mr.', CAST(N'1955-03-04T00:00:00.000' AS DateTime), CAST(N'1993-10-17T00:00:00.000' AS DateTime), N'14 Garrett Hill', 1)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [IsActive]) VALUES (6, N'Suyama', N'Michael', 2, N'Sales Representative', N'Mr.', CAST(N'1963-07-02T00:00:00.000' AS DateTime), CAST(N'1993-10-17T00:00:00.000' AS DateTime), N'Coventry House
Miner Rd.', 1)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [IsActive]) VALUES (7, N'King', N'Robert', 1, N'Sales Representative', N'Mr.', CAST(N'1960-05-29T00:00:00.000' AS DateTime), CAST(N'1994-01-02T00:00:00.000' AS DateTime), N'Edgeham Hollow
Winchester Way', 1)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [IsActive]) VALUES (8, N'Callahan', N'Laura', 1, N'Inside Sales Coordinator', N'Ms.', CAST(N'1958-01-09T00:00:00.000' AS DateTime), CAST(N'1994-03-05T00:00:00.000' AS DateTime), N'4726 - 11th Ave. N.E.', 1)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [IsActive]) VALUES (9, N'Dodsworth', N'Anne', 2, N'Sales Representative', N'Ms.', CAST(N'1966-01-27T00:00:00.000' AS DateTime), CAST(N'1994-11-15T00:00:00.000' AS DateTime), N'7 Houndstooth Rd.', 1)
INSERT [dbo].[Employees] ([EmployeeID], [LastName], [FirstName], [DepartmentID], [Title], [TitleOfCourtesy], [BirthDate], [HireDate], [Address], [IsActive]) VALUES (10, N'vvvv', N'strivvvng', 1, N'string', N'string', CAST(N'2023-03-07T16:20:42.030' AS DateTime), CAST(N'2023-03-07T16:20:42.030' AS DateTime), N'string', 0)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10303, 40, 14.7000, 40, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10303, 65, 16.8000, 30, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10303, 68, 10.0000, 15, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10327, 2, 15.2000, 25, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10327, 11, 16.8000, 50, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10327, 30, 20.7000, 35, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10327, 58, 10.6000, 30, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10337, 23, 7.2000, 40, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10337, 26, 24.9000, 24, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10337, 36, 15.2000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10337, 37, 20.8000, 28, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10337, 72, 27.8000, 25, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10342, 2, 15.2000, 24, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10342, 31, 10.0000, 56, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10342, 36, 15.2000, 40, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10342, 55, 19.2000, 40, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10347, 25, 11.2000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10347, 39, 14.4000, 50, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10347, 40, 14.7000, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10347, 75, 6.2000, 6, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10368, 21, 8.0000, 5, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10368, 28, 36.4000, 13, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10368, 57, 15.6000, 25, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10368, 64, 26.6000, 35, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10378, 71, 17.2000, 6, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10382, 5, 17.0000, 32, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10382, 18, 50.0000, 9, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10382, 29, 99.0000, 14, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10382, 33, 2.0000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10382, 74, 8.0000, 50, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10386, 24, 3.6000, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10386, 34, 11.2000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10390, 31, 10.0000, 60, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10390, 35, 14.4000, 40, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10390, 46, 9.6000, 45, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10390, 72, 27.8000, 24, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10394, 13, 4.8000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10394, 62, 39.4000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10395, 46, 9.6000, 28, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10395, 53, 26.2000, 70, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10395, 69, 28.8000, 8, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10396, 23, 7.2000, 40, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10396, 71, 17.2000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10396, 72, 27.8000, 21, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10402, 23, 7.2000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10402, 63, 35.1000, 65, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10403, 16, 13.9000, 21, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10403, 48, 10.2000, 70, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10408, 37, 20.8000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10408, 54, 5.9000, 6, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10408, 62, 39.4000, 35, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10414, 19, 7.3000, 18, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10414, 33, 2.0000, 50, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10415, 17, 31.2000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10415, 33, 2.0000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10422, 26, 24.9000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10423, 31, 10.0000, 14, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10423, 59, 44.0000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10426, 56, 30.4000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10426, 64, 26.6000, 7, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10430, 17, 31.2000, 45, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10430, 21, 8.0000, 50, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10430, 56, 30.4000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10430, 59, 44.0000, 70, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10434, 11, 16.8000, 6, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10434, 76, 14.4000, 18, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10442, 11, 16.8000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10442, 54, 5.9000, 80, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10442, 66, 13.6000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10460, 68, 10.0000, 21, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10460, 75, 6.2000, 4, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10464, 4, 17.6000, 16, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10464, 43, 36.8000, 3, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10464, 56, 30.4000, 30, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10464, 60, 27.2000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10476, 55, 19.2000, 2, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10476, 70, 12.0000, 12, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10480, 47, 7.6000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10480, 59, 44.0000, 12, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10486, 11, 16.8000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10486, 51, 42.4000, 25, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10486, 74, 8.0000, 16, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10488, 59, 44.0000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10488, 73, 12.0000, 20, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10490, 59, 44.0000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10490, 68, 10.0000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10490, 75, 6.2000, 36, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10491, 44, 15.5000, 15, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10491, 77, 10.4000, 7, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10498, 24, 4.5000, 14, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10498, 40, 18.4000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10498, 42, 14.0000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10512, 24, 4.5000, 10, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10512, 46, 12.0000, 9, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10512, 47, 9.5000, 6, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10512, 60, 34.0000, 12, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10514, 20, 81.0000, 39, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10514, 28, 45.6000, 35, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10514, 56, 38.0000, 70, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10514, 65, 21.0500, 39, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10514, 75, 7.7500, 50, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10528, 11, 21.0000, 3, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10528, 33, 2.5000, 8, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10528, 72, 34.8000, 9, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10533, 4, 22.0000, 50, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10533, 72, 34.8000, 24, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10533, 73, 15.0000, 24, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10541, 24, 4.5000, 35, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10541, 38, 263.5000, 4, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10541, 65, 21.0500, 36, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10541, 71, 21.5000, 9, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10550, 17, 39.0000, 8, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10550, 19, 9.2000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10550, 21, 10.0000, 6, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10550, 61, 28.5000, 10, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10551, 16, 17.4500, 40, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10551, 35, 18.0000, 20, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10551, 44, 19.4500, 40, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10552, 69, 36.0000, 18, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10552, 75, 7.7500, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10560, 30, 25.8900, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10560, 62, 49.3000, 15, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10561, 44, 19.4500, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10561, 51, 53.0000, 50, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10568, 10, 31.0000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10571, 14, 23.2500, 11, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10571, 42, 14.0000, 28, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10581, 75, 7.7500, 50, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10589, 35, 18.0000, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10595, 35, 18.0000, 30, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10595, 61, 28.5000, 120, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10595, 69, 36.0000, 65, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10600, 54, 7.4500, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10600, 73, 15.0000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10601, 13, 6.0000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10601, 59, 55.0000, 35, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10604, 48, 12.7500, 6, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10604, 76, 18.0000, 10, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10613, 13, 6.0000, 8, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10613, 75, 7.7500, 40, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10616, 38, 263.5000, 15, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10616, 56, 38.0000, 14, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10616, 70, 15.0000, 15, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10616, 71, 21.5000, 15, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10617, 59, 55.0000, 30, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10623, 14, 23.2500, 21, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10623, 19, 9.2000, 15, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10623, 21, 10.0000, 25, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10623, 24, 4.5000, 3, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10623, 35, 18.0000, 30, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10629, 29, 123.7900, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10629, 64, 33.2500, 9, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10633, 12, 38.0000, 36, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10633, 13, 6.0000, 13, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10633, 26, 31.2300, 35, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10633, 62, 49.3000, 80, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10634, 7, 30.0000, 35, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10634, 18, 62.5000, 50, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10634, 51, 53.0000, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10634, 75, 7.7500, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10641, 2, 19.0000, 50, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10641, 40, 18.4000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10645, 18, 62.5000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10645, 36, 19.0000, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10650, 30, 25.8900, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10650, 53, 32.8000, 25, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10650, 54, 7.4500, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10652, 30, 25.8900, 2, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10652, 42, 14.0000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10653, 16, 17.4500, 30, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10653, 60, 34.0000, 20, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10656, 14, 23.2500, 3, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10656, 44, 19.4500, 28, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10656, 47, 9.5000, 6, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10660, 20, 81.0000, 21, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10664, 10, 31.0000, 24, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10664, 56, 38.0000, 12, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10664, 65, 21.0500, 15, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10667, 69, 36.0000, 45, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10667, 71, 21.5000, 14, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10670, 23, 9.0000, 32, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10670, 46, 12.0000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10670, 67, 14.0000, 25, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10670, 73, 15.0000, 50, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10670, 75, 7.7500, 25, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10671, 16, 17.4500, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10671, 62, 49.3000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10671, 65, 21.0500, 12, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10675, 14, 23.2500, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10675, 53, 32.8000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10675, 58, 13.2500, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10681, 19, 9.2000, 30, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10681, 21, 10.0000, 12, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10681, 64, 33.2500, 28, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10685, 10, 31.0000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10685, 41, 9.6500, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10685, 47, 9.5000, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10690, 56, 38.0000, 20, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10690, 77, 13.0000, 30, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10698, 11, 21.0000, 15, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10698, 17, 39.0000, 8, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10698, 29, 123.7900, 12, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10698, 65, 21.0500, 65, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10698, 70, 15.0000, 8, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10703, 2, 19.0000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10703, 59, 55.0000, 35, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10703, 73, 15.0000, 35, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10705, 31, 12.5000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10705, 32, 32.0000, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10709, 8, 40.0000, 40, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10709, 51, 53.0000, 28, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10709, 60, 34.0000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10710, 19, 9.2000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10710, 47, 9.5000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10717, 21, 10.0000, 32, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10717, 54, 7.4500, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10717, 69, 36.0000, 25, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10725, 41, 9.6500, 12, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10725, 52, 7.0000, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10725, 55, 24.0000, 6, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10734, 6, 25.0000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10734, 30, 25.8900, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10734, 76, 18.0000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10753, 45, 9.5000, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10753, 74, 10.0000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10762, 39, 18.0000, 16, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10762, 47, 9.5000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10762, 51, 53.0000, 28, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10762, 56, 38.0000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10763, 21, 10.0000, 40, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10763, 22, 21.0000, 6, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10763, 24, 4.5000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10764, 3, 10.0000, 20, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10764, 39, 18.0000, 130, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10770, 11, 21.0000, 15, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10771, 71, 21.5000, 16, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10773, 17, 39.0000, 33, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10773, 31, 12.5000, 70, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10773, 75, 7.7500, 7, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10774, 31, 12.5000, 2, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10774, 66, 17.0000, 50, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10776, 31, 12.5000, 16, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10776, 42, 14.0000, 12, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10776, 45, 9.5000, 27, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10776, 51, 53.0000, 120, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10777, 42, 14.0000, 20, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10783, 31, 12.5000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10783, 38, 263.5000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10785, 10, 31.0000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10785, 75, 7.7500, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10789, 18, 62.5000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10789, 35, 18.0000, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10789, 63, 43.9000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10789, 68, 12.5000, 18, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10790, 7, 30.0000, 3, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10790, 56, 38.0000, 20, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10791, 29, 123.7900, 14, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10791, 41, 9.6500, 20, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10795, 16, 17.4500, 65, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10795, 17, 39.0000, 35, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10796, 26, 31.2300, 21, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10796, 44, 19.4500, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10796, 64, 33.2500, 35, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10796, 69, 36.0000, 24, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10807, 40, 18.4000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10816, 38, 263.5000, 30, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10816, 62, 49.3000, 20, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10824, 41, 9.6500, 12, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10824, 70, 15.0000, 9, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10836, 22, 21.0000, 52, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10836, 35, 18.0000, 6, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10836, 57, 19.5000, 24, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10836, 60, 34.0000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10836, 64, 33.2500, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10854, 10, 31.0000, 100, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10854, 13, 6.0000, 65, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10859, 24, 4.5000, 40, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10859, 54, 7.4500, 35, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10859, 64, 33.2500, 30, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10860, 51, 53.0000, 3, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10860, 76, 18.0000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10863, 1, 18.0000, 20, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10863, 58, 13.2500, 12, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10872, 55, 24.0000, 10, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10872, 62, 49.3000, 20, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10872, 64, 33.2500, 15, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10872, 65, 21.0500, 21, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10874, 10, 31.0000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10880, 23, 9.0000, 30, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10880, 61, 28.5000, 30, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10880, 70, 15.0000, 50, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10886, 10, 31.0000, 70, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10886, 31, 12.5000, 35, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10886, 77, 13.0000, 40, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10887, 25, 14.0000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10888, 2, 19.0000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10888, 68, 12.5000, 18, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10895, 24, 4.5000, 110, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10895, 39, 18.0000, 45, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10895, 40, 18.4000, 91, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10895, 60, 34.0000, 100, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10901, 41, 9.6500, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10901, 71, 21.5000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10902, 55, 24.0000, 30, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10902, 62, 49.3000, 6, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10903, 13, 6.0000, 40, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10903, 65, 21.0500, 21, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10903, 68, 12.5000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10911, 1, 18.0000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10911, 17, 39.0000, 12, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10911, 67, 14.0000, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10922, 17, 39.0000, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10922, 24, 4.5000, 35, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10925, 36, 19.0000, 25, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10925, 52, 7.0000, 12, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10928, 47, 9.5000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10928, 76, 18.0000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10929, 21, 10.0000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10929, 75, 7.7500, 49, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10929, 77, 13.0000, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10936, 36, 19.0000, 30, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10948, 50, 16.2500, 9, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10948, 51, 53.0000, 40, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10948, 55, 24.0000, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10955, 75, 7.7500, 12, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10957, 30, 25.8900, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10957, 35, 18.0000, 40, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10957, 64, 33.2500, 8, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10959, 75, 7.7500, 20, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10960, 24, 4.5000, 10, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10960, 41, 9.6500, 24, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10963, 60, 34.0000, 2, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10968, 12, 38.0000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10968, 24, 4.5000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10968, 64, 33.2500, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10971, 29, 123.7900, 14, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10976, 28, 45.6000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10977, 39, 18.0000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10977, 47, 9.5000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10977, 51, 53.0000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10977, 63, 43.9000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10979, 7, 30.0000, 18, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10979, 12, 38.0000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10979, 24, 4.5000, 80, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10979, 27, 43.9000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10979, 31, 12.5000, 24, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10979, 63, 43.9000, 35, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10980, 75, 7.7500, 40, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10981, 38, 263.5000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10990, 21, 10.0000, 65, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10990, 34, 14.0000, 60, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10990, 55, 24.0000, 65, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10990, 61, 28.5000, 66, 0.15)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10993, 29, 123.7900, 50, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (10993, 41, 9.6500, 35, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11001, 7, 30.0000, 60, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11001, 22, 21.0000, 25, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11001, 46, 12.0000, 25, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11001, 55, 24.0000, 6, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11006, 1, 18.0000, 8, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11006, 29, 123.7900, 2, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11008, 28, 45.6000, 70, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11008, 34, 14.0000, 90, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11008, 71, 21.5000, 21, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11009, 24, 4.5000, 12, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11009, 36, 19.0000, 18, 0.25)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11009, 60, 34.0000, 9, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11012, 19, 9.2000, 50, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11012, 60, 34.0000, 36, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11012, 71, 21.5000, 60, 0.05)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11017, 3, 10.0000, 25, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11017, 59, 55.0000, 110, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11017, 70, 15.0000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11022, 19, 9.2000, 35, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11022, 69, 36.0000, 30, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11026, 18, 62.5000, 8, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11026, 51, 53.0000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11037, 70, 15.0000, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11040, 21, 10.0000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11049, 2, 19.0000, 10, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11049, 12, 38.0000, 4, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11050, 76, 18.0000, 50, 0.1)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11052, 43, 46.0000, 30, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11052, 61, 28.5000, 10, 0.2)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11055, 24, 4.5000, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11055, 25, 14.0000, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11055, 51, 53.0000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11055, 57, 19.5000, 20, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11060, 60, 34.0000, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11060, 77, 13.0000, 10, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11061, 60, 34.0000, 15, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11072, 2, 19.0000, 8, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11072, 41, 9.6500, 40, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11072, 50, 16.2500, 22, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11072, 64, 33.2500, 130, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11073, 17, 39.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11073, 40, 18.4000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11074, 17, 39.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11074, 40, 18.4000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11075, 3, 10.0000, 1, 0)
GO
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11075, 17, 39.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11076, 3, 10.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11076, 17, 39.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 17, 39.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 40, 18.4000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11077, 60, 34.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11078, 3, 10.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11078, 17, 39.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11078, 40, 18.4000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11079, 40, 18.4000, 4, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11080, 40, 18.4000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (11081, 3, 10.0000, 3, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (12073, 17, 39.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (12073, 60, 34.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (12074, 3, 10.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (12074, 17, 39.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (12074, 40, 18.4000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (12075, 17, 39.0000, 9, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (13073, 3, 10.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (13073, 17, 39.0000, 3, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (14073, 17, 39.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (14074, 1, 18.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (14075, 2, 19.0000, 5, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (14076, 3, 10.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (14077, 3, 10.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (14078, 1, 18.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (14079, 4, 22.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (14080, 1, 18.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (14081, 2, 19.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (14082, 2, 19.0000, 3, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (15074, 2, 19.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (15074, 3, 10.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (16074, 1, 18.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (16074, 2, 19.0000, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (16074, 3, 10.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (16075, 7, 30.0000, 2, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (16075, 41, 9.6500, 1, 0)
INSERT [dbo].[Order Details] ([OrderID], [ProductID], [UnitPrice], [Quantity], [Discount]) VALUES (16075, 1089, 12.0000, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10303, N'GODOS', 7, CAST(N'1996-09-11T00:00:00.000' AS DateTime), CAST(N'1996-10-09T00:00:00.000' AS DateTime), CAST(N'1996-09-18T00:00:00.000' AS DateTime), 107.8300, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10327, N'FOLKO', 2, CAST(N'1996-10-11T00:00:00.000' AS DateTime), CAST(N'1996-11-08T00:00:00.000' AS DateTime), CAST(N'1996-10-14T00:00:00.000' AS DateTime), 63.3600, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10337, N'FRANK', 4, CAST(N'1996-10-24T00:00:00.000' AS DateTime), CAST(N'1996-11-21T00:00:00.000' AS DateTime), CAST(N'1996-10-29T00:00:00.000' AS DateTime), 108.2600, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10342, N'FRANK', 4, CAST(N'1996-10-30T00:00:00.000' AS DateTime), CAST(N'1996-11-13T00:00:00.000' AS DateTime), CAST(N'1996-11-04T00:00:00.000' AS DateTime), 54.8300, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10347, N'FAMIA', 4, CAST(N'1996-11-06T00:00:00.000' AS DateTime), CAST(N'1996-12-04T00:00:00.000' AS DateTime), CAST(N'1996-11-08T00:00:00.000' AS DateTime), 3.1000, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10368, N'ERNSH', 2, CAST(N'1996-11-29T00:00:00.000' AS DateTime), CAST(N'1996-12-27T00:00:00.000' AS DateTime), CAST(N'1996-12-02T00:00:00.000' AS DateTime), 101.9500, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10378, N'FOLKO', 5, CAST(N'1996-12-10T00:00:00.000' AS DateTime), CAST(N'1997-01-07T00:00:00.000' AS DateTime), CAST(N'1996-12-19T00:00:00.000' AS DateTime), 5.4400, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10382, N'ERNSH', 4, CAST(N'1996-12-13T00:00:00.000' AS DateTime), CAST(N'1997-01-10T00:00:00.000' AS DateTime), CAST(N'1996-12-16T00:00:00.000' AS DateTime), 94.7700, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10386, N'FAMIA', 9, CAST(N'1996-12-18T00:00:00.000' AS DateTime), CAST(N'1997-01-01T00:00:00.000' AS DateTime), CAST(N'1996-12-25T00:00:00.000' AS DateTime), 13.9900, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10390, N'ERNSH', 6, CAST(N'1996-12-23T00:00:00.000' AS DateTime), CAST(N'1997-01-20T00:00:00.000' AS DateTime), CAST(N'1996-12-26T00:00:00.000' AS DateTime), 126.3800, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10394, N'HUNGC', 1, CAST(N'1996-12-25T00:00:00.000' AS DateTime), CAST(N'1997-01-22T00:00:00.000' AS DateTime), CAST(N'1997-01-03T00:00:00.000' AS DateTime), 30.3400, N'Hungry Coyote Import Store', N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10395, N'HILAA', 6, CAST(N'1996-12-26T00:00:00.000' AS DateTime), CAST(N'1997-01-23T00:00:00.000' AS DateTime), CAST(N'1997-01-03T00:00:00.000' AS DateTime), 184.4100, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10396, N'FRANK', 1, CAST(N'1996-12-27T00:00:00.000' AS DateTime), CAST(N'1997-01-10T00:00:00.000' AS DateTime), CAST(N'1997-01-06T00:00:00.000' AS DateTime), 135.3500, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10402, N'ERNSH', 8, CAST(N'1997-01-02T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime), CAST(N'1997-01-10T00:00:00.000' AS DateTime), 67.8800, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10403, N'ERNSH', 4, CAST(N'1997-01-03T00:00:00.000' AS DateTime), CAST(N'1997-01-31T00:00:00.000' AS DateTime), CAST(N'1997-01-09T00:00:00.000' AS DateTime), 73.7900, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10408, N'FOLIG', 8, CAST(N'1997-01-08T00:00:00.000' AS DateTime), CAST(N'1997-02-05T00:00:00.000' AS DateTime), CAST(N'1997-01-14T00:00:00.000' AS DateTime), 11.2600, N'Folies gourmandes', N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10414, N'FAMIA', 2, CAST(N'1997-01-14T00:00:00.000' AS DateTime), CAST(N'1997-02-11T00:00:00.000' AS DateTime), CAST(N'1997-01-17T00:00:00.000' AS DateTime), 21.4800, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10415, N'HUNGC', 3, CAST(N'1997-01-15T00:00:00.000' AS DateTime), CAST(N'1997-02-12T00:00:00.000' AS DateTime), CAST(N'1997-01-24T00:00:00.000' AS DateTime), 0.2000, N'Hungry Coyote Import Store', N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10422, N'FRANS', 2, CAST(N'1997-01-22T00:00:00.000' AS DateTime), CAST(N'1997-02-19T00:00:00.000' AS DateTime), CAST(N'1997-01-31T00:00:00.000' AS DateTime), 3.0200, N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10423, N'GOURL', 6, CAST(N'1997-01-23T00:00:00.000' AS DateTime), CAST(N'1997-02-06T00:00:00.000' AS DateTime), CAST(N'1997-02-24T00:00:00.000' AS DateTime), 24.5000, N'Gourmet Lanchonetes', N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10426, N'GALED', 4, CAST(N'1997-01-27T00:00:00.000' AS DateTime), CAST(N'1997-02-24T00:00:00.000' AS DateTime), CAST(N'1997-02-06T00:00:00.000' AS DateTime), 18.6900, N'Galería del gastronómo', N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10430, N'ERNSH', 4, CAST(N'1997-01-30T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime), CAST(N'1997-02-03T00:00:00.000' AS DateTime), 458.7800, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10434, N'FOLKO', 3, CAST(N'1997-02-03T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime), CAST(N'1997-02-13T00:00:00.000' AS DateTime), 17.9200, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10442, N'ERNSH', 3, CAST(N'1997-02-11T00:00:00.000' AS DateTime), CAST(N'1997-03-11T00:00:00.000' AS DateTime), CAST(N'1997-02-18T00:00:00.000' AS DateTime), 47.9400, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10460, N'FOLKO', 8, CAST(N'1997-02-28T00:00:00.000' AS DateTime), CAST(N'1997-03-28T00:00:00.000' AS DateTime), CAST(N'1997-03-03T00:00:00.000' AS DateTime), 16.2700, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10464, N'FURIB', 4, CAST(N'1997-03-04T00:00:00.000' AS DateTime), CAST(N'1997-04-01T00:00:00.000' AS DateTime), CAST(N'1997-03-14T00:00:00.000' AS DateTime), 89.0000, N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10476, N'HILAA', 8, CAST(N'1997-03-17T00:00:00.000' AS DateTime), CAST(N'1997-04-14T00:00:00.000' AS DateTime), CAST(N'1997-03-24T00:00:00.000' AS DateTime), 4.4100, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10480, N'FOLIG', 6, CAST(N'1997-03-20T00:00:00.000' AS DateTime), CAST(N'1997-04-17T00:00:00.000' AS DateTime), CAST(N'1997-03-24T00:00:00.000' AS DateTime), 1.3500, N'Folies gourmandes', N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10486, N'HILAA', 1, CAST(N'1997-03-26T00:00:00.000' AS DateTime), CAST(N'1997-04-23T00:00:00.000' AS DateTime), CAST(N'1997-04-02T00:00:00.000' AS DateTime), 30.5300, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10488, N'FRANK', 8, CAST(N'1997-03-27T00:00:00.000' AS DateTime), CAST(N'1997-04-24T00:00:00.000' AS DateTime), CAST(N'1997-04-02T00:00:00.000' AS DateTime), 4.9300, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10490, N'HILAA', 7, CAST(N'1997-03-31T00:00:00.000' AS DateTime), CAST(N'1997-04-28T00:00:00.000' AS DateTime), CAST(N'1997-04-03T00:00:00.000' AS DateTime), 210.1900, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10491, N'FURIB', 8, CAST(N'1997-03-31T00:00:00.000' AS DateTime), CAST(N'1997-04-28T00:00:00.000' AS DateTime), CAST(N'1997-04-08T00:00:00.000' AS DateTime), 16.9600, N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10498, N'HILAA', 8, CAST(N'1997-04-07T00:00:00.000' AS DateTime), CAST(N'1997-05-05T00:00:00.000' AS DateTime), CAST(N'1997-04-11T00:00:00.000' AS DateTime), 29.7500, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10512, N'FAMIA', 7, CAST(N'1997-04-21T00:00:00.000' AS DateTime), CAST(N'1997-05-19T00:00:00.000' AS DateTime), CAST(N'1997-04-24T00:00:00.000' AS DateTime), 3.5300, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10514, N'ERNSH', 3, CAST(N'1997-04-22T00:00:00.000' AS DateTime), CAST(N'1997-05-20T00:00:00.000' AS DateTime), CAST(N'1997-05-16T00:00:00.000' AS DateTime), 789.9500, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10528, N'GREAL', 6, CAST(N'1997-05-06T00:00:00.000' AS DateTime), CAST(N'1997-05-20T00:00:00.000' AS DateTime), CAST(N'1997-05-09T00:00:00.000' AS DateTime), 3.3500, N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10533, N'FOLKO', 8, CAST(N'1997-05-12T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime), CAST(N'1997-05-22T00:00:00.000' AS DateTime), 188.0400, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10541, N'HANAR', 2, CAST(N'1997-05-19T00:00:00.000' AS DateTime), CAST(N'1997-06-16T00:00:00.000' AS DateTime), CAST(N'1997-05-29T00:00:00.000' AS DateTime), 68.6500, N'Hanari Carnes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10550, N'GODOS', 7, CAST(N'1997-05-28T00:00:00.000' AS DateTime), CAST(N'1997-06-25T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime), 4.3200, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10551, N'FURIB', 4, CAST(N'1997-05-28T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime), CAST(N'1997-06-06T00:00:00.000' AS DateTime), 72.9500, N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10552, N'HILAA', 2, CAST(N'1997-05-29T00:00:00.000' AS DateTime), CAST(N'1997-06-26T00:00:00.000' AS DateTime), CAST(N'1997-06-05T00:00:00.000' AS DateTime), 83.2200, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10560, N'FRANK', 8, CAST(N'1997-06-06T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime), 36.6500, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10561, N'FOLKO', 2, CAST(N'1997-06-06T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-06-09T00:00:00.000' AS DateTime), 242.2100, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10568, N'GALED', 3, CAST(N'1997-06-13T00:00:00.000' AS DateTime), CAST(N'1997-07-11T00:00:00.000' AS DateTime), CAST(N'1997-07-09T00:00:00.000' AS DateTime), 6.5400, N'Galería del gastronómo', N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10571, N'ERNSH', 8, CAST(N'1997-06-17T00:00:00.000' AS DateTime), CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-07-04T00:00:00.000' AS DateTime), 26.0600, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10581, N'FAMIA', 3, CAST(N'1997-06-26T00:00:00.000' AS DateTime), CAST(N'1997-07-24T00:00:00.000' AS DateTime), CAST(N'1997-07-02T00:00:00.000' AS DateTime), 3.0100, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10589, N'GREAL', 8, CAST(N'1997-07-04T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime), 4.4200, N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10595, N'ERNSH', 2, CAST(N'1997-07-10T00:00:00.000' AS DateTime), CAST(N'1997-08-07T00:00:00.000' AS DateTime), CAST(N'1997-07-14T00:00:00.000' AS DateTime), 96.7800, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10600, N'HUNGC', 4, CAST(N'1997-07-16T00:00:00.000' AS DateTime), CAST(N'1997-08-13T00:00:00.000' AS DateTime), CAST(N'1997-07-21T00:00:00.000' AS DateTime), 45.1300, N'Hungry Coyote Import Store', N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10601, N'HILAA', 7, CAST(N'1997-07-16T00:00:00.000' AS DateTime), CAST(N'1997-08-27T00:00:00.000' AS DateTime), CAST(N'1997-07-22T00:00:00.000' AS DateTime), 58.3000, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10604, N'FURIB', 1, CAST(N'1997-07-18T00:00:00.000' AS DateTime), CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-07-29T00:00:00.000' AS DateTime), 7.4600, N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10613, N'HILAA', 4, CAST(N'1997-07-29T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-08-01T00:00:00.000' AS DateTime), 8.1100, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10616, N'GREAL', 1, CAST(N'1997-07-31T00:00:00.000' AS DateTime), CAST(N'1997-08-28T00:00:00.000' AS DateTime), CAST(N'1997-08-05T00:00:00.000' AS DateTime), 116.5300, N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10617, N'GREAL', 4, CAST(N'1997-07-31T00:00:00.000' AS DateTime), CAST(N'1997-08-28T00:00:00.000' AS DateTime), CAST(N'1997-08-04T00:00:00.000' AS DateTime), 18.5300, N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10623, N'FRANK', 8, CAST(N'1997-08-07T00:00:00.000' AS DateTime), CAST(N'1997-09-04T00:00:00.000' AS DateTime), CAST(N'1997-08-12T00:00:00.000' AS DateTime), 97.1800, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10629, N'GODOS', 4, CAST(N'1997-08-12T00:00:00.000' AS DateTime), CAST(N'1997-09-09T00:00:00.000' AS DateTime), CAST(N'1997-08-20T00:00:00.000' AS DateTime), 85.4600, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10633, N'ERNSH', 7, CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-08-18T00:00:00.000' AS DateTime), 477.9000, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10634, N'FOLIG', 4, CAST(N'1997-08-15T00:00:00.000' AS DateTime), CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-08-21T00:00:00.000' AS DateTime), 487.3800, N'Folies gourmandes', N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10641, N'HILAA', 4, CAST(N'1997-08-22T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime), CAST(N'1997-08-26T00:00:00.000' AS DateTime), 179.6100, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10645, N'HANAR', 4, CAST(N'1997-08-26T00:00:00.000' AS DateTime), CAST(N'1997-09-23T00:00:00.000' AS DateTime), CAST(N'1997-09-02T00:00:00.000' AS DateTime), 12.4100, N'Hanari Carnes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10650, N'FAMIA', 5, CAST(N'1997-08-29T00:00:00.000' AS DateTime), CAST(N'1997-09-26T00:00:00.000' AS DateTime), CAST(N'1997-09-03T00:00:00.000' AS DateTime), 176.8100, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10652, N'GOURL', 4, CAST(N'1997-09-01T00:00:00.000' AS DateTime), CAST(N'1997-09-29T00:00:00.000' AS DateTime), CAST(N'1997-09-08T00:00:00.000' AS DateTime), 7.1400, N'Gourmet Lanchonetes', N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10653, N'FRANK', 1, CAST(N'1997-09-02T00:00:00.000' AS DateTime), CAST(N'1997-09-30T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime), 93.2500, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10656, N'GREAL', 6, CAST(N'1997-09-04T00:00:00.000' AS DateTime), CAST(N'1997-10-02T00:00:00.000' AS DateTime), CAST(N'1997-09-10T00:00:00.000' AS DateTime), 57.1500, N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10660, N'HUNGC', 8, CAST(N'1997-09-08T00:00:00.000' AS DateTime), CAST(N'1997-10-06T00:00:00.000' AS DateTime), CAST(N'1997-10-15T00:00:00.000' AS DateTime), 111.2900, N'Hungry Coyote Import Store', N'City Center Plaza 516 Main St.', N'Elgin', N'OR', N'97827', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10664, N'FURIB', 1, CAST(N'1997-09-10T00:00:00.000' AS DateTime), CAST(N'1997-10-08T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime), 1.2700, N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10667, N'ERNSH', 7, CAST(N'1997-09-12T00:00:00.000' AS DateTime), CAST(N'1997-10-10T00:00:00.000' AS DateTime), CAST(N'1997-09-19T00:00:00.000' AS DateTime), 78.0900, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10670, N'FRANK', 4, CAST(N'1997-09-16T00:00:00.000' AS DateTime), CAST(N'1997-10-14T00:00:00.000' AS DateTime), CAST(N'1997-09-18T00:00:00.000' AS DateTime), 203.4800, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10671, N'FRANR', 1, CAST(N'1997-09-17T00:00:00.000' AS DateTime), CAST(N'1997-10-15T00:00:00.000' AS DateTime), CAST(N'1997-09-24T00:00:00.000' AS DateTime), 30.3400, N'France restauration', N'54, rue Royale', N'Nantes', NULL, N'44000', N'France')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10675, N'FRANK', 5, CAST(N'1997-09-19T00:00:00.000' AS DateTime), CAST(N'1997-10-17T00:00:00.000' AS DateTime), CAST(N'1997-09-23T00:00:00.000' AS DateTime), 31.8500, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10681, N'GREAL', 3, CAST(N'1997-09-25T00:00:00.000' AS DateTime), CAST(N'1997-10-23T00:00:00.000' AS DateTime), CAST(N'1997-09-30T00:00:00.000' AS DateTime), 76.1300, N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10685, N'GOURL', 4, CAST(N'1997-09-29T00:00:00.000' AS DateTime), CAST(N'1997-10-13T00:00:00.000' AS DateTime), CAST(N'1997-10-03T00:00:00.000' AS DateTime), 33.7500, N'Gourmet Lanchonetes', N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10690, N'HANAR', 1, CAST(N'1997-10-02T00:00:00.000' AS DateTime), CAST(N'1997-10-30T00:00:00.000' AS DateTime), CAST(N'1997-10-03T00:00:00.000' AS DateTime), 15.8000, N'Hanari Carnes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10698, N'ERNSH', 4, CAST(N'1997-10-09T00:00:00.000' AS DateTime), CAST(N'1997-11-06T00:00:00.000' AS DateTime), CAST(N'1997-10-17T00:00:00.000' AS DateTime), 272.4700, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10703, N'FOLKO', 6, CAST(N'1997-10-14T00:00:00.000' AS DateTime), CAST(N'1997-11-11T00:00:00.000' AS DateTime), CAST(N'1997-10-20T00:00:00.000' AS DateTime), 152.3000, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10705, N'HILAA', 9, CAST(N'1997-10-15T00:00:00.000' AS DateTime), CAST(N'1997-11-12T00:00:00.000' AS DateTime), CAST(N'1997-11-18T00:00:00.000' AS DateTime), 3.5200, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10709, N'GOURL', 1, CAST(N'1997-10-17T00:00:00.000' AS DateTime), CAST(N'1997-11-14T00:00:00.000' AS DateTime), CAST(N'1997-11-20T00:00:00.000' AS DateTime), 210.8000, N'Gourmet Lanchonetes', N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10710, N'FRANS', 1, CAST(N'1997-10-20T00:00:00.000' AS DateTime), CAST(N'1997-11-17T00:00:00.000' AS DateTime), CAST(N'1997-10-23T00:00:00.000' AS DateTime), 4.9800, N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10717, N'FRANK', 1, CAST(N'1997-10-24T00:00:00.000' AS DateTime), CAST(N'1997-11-21T00:00:00.000' AS DateTime), CAST(N'1997-10-29T00:00:00.000' AS DateTime), 59.2500, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10725, N'FAMIA', 4, CAST(N'1997-10-31T00:00:00.000' AS DateTime), CAST(N'1997-11-28T00:00:00.000' AS DateTime), CAST(N'1997-11-05T00:00:00.000' AS DateTime), 10.8300, N'Familia Arquibaldo', N'Rua Orós, 92', N'Sao Paulo', N'SP', N'05442-030', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10734, N'GOURL', 2, CAST(N'1997-11-07T00:00:00.000' AS DateTime), CAST(N'1997-12-05T00:00:00.000' AS DateTime), CAST(N'1997-11-12T00:00:00.000' AS DateTime), 1.6300, N'Gourmet Lanchonetes', N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10753, N'FRANS', 3, CAST(N'1997-11-25T00:00:00.000' AS DateTime), CAST(N'1997-12-23T00:00:00.000' AS DateTime), CAST(N'1997-11-27T00:00:00.000' AS DateTime), 7.7000, N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10762, N'FOLKO', 3, CAST(N'1997-12-02T00:00:00.000' AS DateTime), CAST(N'1997-12-30T00:00:00.000' AS DateTime), CAST(N'1997-12-09T00:00:00.000' AS DateTime), 328.7400, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10763, N'FOLIG', 3, CAST(N'1997-12-03T00:00:00.000' AS DateTime), CAST(N'1997-12-31T00:00:00.000' AS DateTime), CAST(N'1997-12-08T00:00:00.000' AS DateTime), 37.3500, N'Folies gourmandes', N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10764, N'ERNSH', 6, CAST(N'1997-12-03T00:00:00.000' AS DateTime), CAST(N'1997-12-31T00:00:00.000' AS DateTime), CAST(N'1997-12-08T00:00:00.000' AS DateTime), 145.4500, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10770, N'HANAR', 8, CAST(N'1997-12-09T00:00:00.000' AS DateTime), CAST(N'1998-01-06T00:00:00.000' AS DateTime), CAST(N'1997-12-17T00:00:00.000' AS DateTime), 5.3200, N'Hanari Carnes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10771, N'ERNSH', 9, CAST(N'1997-12-10T00:00:00.000' AS DateTime), CAST(N'1998-01-07T00:00:00.000' AS DateTime), CAST(N'1998-01-02T00:00:00.000' AS DateTime), 11.1900, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10773, N'ERNSH', 1, CAST(N'1997-12-11T00:00:00.000' AS DateTime), CAST(N'1998-01-08T00:00:00.000' AS DateTime), CAST(N'1997-12-16T00:00:00.000' AS DateTime), 96.4300, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10774, N'FOLKO', 4, CAST(N'1997-12-11T00:00:00.000' AS DateTime), CAST(N'1997-12-25T00:00:00.000' AS DateTime), CAST(N'1997-12-12T00:00:00.000' AS DateTime), 48.2000, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10776, N'ERNSH', 1, CAST(N'1997-12-15T00:00:00.000' AS DateTime), CAST(N'1998-01-12T00:00:00.000' AS DateTime), CAST(N'1997-12-18T00:00:00.000' AS DateTime), 351.5300, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10777, N'GOURL', 7, CAST(N'1997-12-15T00:00:00.000' AS DateTime), CAST(N'1997-12-29T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime), 3.0100, N'Gourmet Lanchonetes', N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10783, N'HANAR', 4, CAST(N'1997-12-18T00:00:00.000' AS DateTime), CAST(N'1998-01-15T00:00:00.000' AS DateTime), CAST(N'1997-12-19T00:00:00.000' AS DateTime), 124.9800, N'Hanari Carnes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10785, N'GROSR', 1, CAST(N'1997-12-18T00:00:00.000' AS DateTime), CAST(N'1998-01-15T00:00:00.000' AS DateTime), CAST(N'1997-12-24T00:00:00.000' AS DateTime), 1.5100, N'GROSELLA-Restaurante', N'5ª Ave. Los Palos Grandes', N'Caracas', N'DF', N'1081', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10789, N'FOLIG', 1, CAST(N'1997-12-22T00:00:00.000' AS DateTime), CAST(N'1998-01-19T00:00:00.000' AS DateTime), CAST(N'1997-12-31T00:00:00.000' AS DateTime), 100.6000, N'Folies gourmandes', N'184, chaussée de Tournai', N'Lille', NULL, N'59000', N'France')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10790, N'GOURL', 6, CAST(N'1997-12-22T00:00:00.000' AS DateTime), CAST(N'1998-01-19T00:00:00.000' AS DateTime), CAST(N'1997-12-26T00:00:00.000' AS DateTime), 28.2300, N'Gourmet Lanchonetes', N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10791, N'FRANK', 6, CAST(N'1997-12-23T00:00:00.000' AS DateTime), CAST(N'1998-01-20T00:00:00.000' AS DateTime), CAST(N'1998-01-01T00:00:00.000' AS DateTime), 16.8500, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10795, N'ERNSH', 8, CAST(N'1997-12-24T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime), CAST(N'1998-01-20T00:00:00.000' AS DateTime), 126.6600, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10796, N'HILAA', 3, CAST(N'1997-12-25T00:00:00.000' AS DateTime), CAST(N'1998-01-22T00:00:00.000' AS DateTime), CAST(N'1998-01-14T00:00:00.000' AS DateTime), 26.5200, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10807, N'FRANS', 4, CAST(N'1997-12-31T00:00:00.000' AS DateTime), CAST(N'1998-01-28T00:00:00.000' AS DateTime), CAST(N'1998-01-30T00:00:00.000' AS DateTime), 1.3600, N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy')
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10816, N'GREAL', 4, CAST(N'1998-01-06T00:00:00.000' AS DateTime), CAST(N'1998-02-03T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime), 719.7800, N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10824, N'FOLKO', 8, CAST(N'1998-01-09T00:00:00.000' AS DateTime), CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-01-30T00:00:00.000' AS DateTime), 1.2300, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10836, N'ERNSH', 7, CAST(N'1998-01-16T00:00:00.000' AS DateTime), CAST(N'1998-02-13T00:00:00.000' AS DateTime), CAST(N'1998-01-21T00:00:00.000' AS DateTime), 411.8800, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10854, N'ERNSH', 3, CAST(N'1998-01-27T00:00:00.000' AS DateTime), CAST(N'1998-02-24T00:00:00.000' AS DateTime), CAST(N'1998-02-05T00:00:00.000' AS DateTime), 100.2200, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10859, N'FRANK', 1, CAST(N'1998-01-29T00:00:00.000' AS DateTime), CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-02-02T00:00:00.000' AS DateTime), 76.1000, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10860, N'FRANR', 3, CAST(N'1998-01-29T00:00:00.000' AS DateTime), CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-02-04T00:00:00.000' AS DateTime), 19.2600, N'France restauration', N'54, rue Royale', N'Nantes', NULL, N'44000', N'France')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10863, N'HILAA', 4, CAST(N'1998-02-02T00:00:00.000' AS DateTime), CAST(N'1998-03-02T00:00:00.000' AS DateTime), CAST(N'1998-02-17T00:00:00.000' AS DateTime), 30.2600, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10872, N'GODOS', 5, CAST(N'1998-02-05T00:00:00.000' AS DateTime), CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-02-09T00:00:00.000' AS DateTime), 175.3200, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10874, N'GODOS', 5, CAST(N'1998-02-06T00:00:00.000' AS DateTime), CAST(N'1998-03-06T00:00:00.000' AS DateTime), CAST(N'1998-02-11T00:00:00.000' AS DateTime), 19.5800, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10880, N'FOLKO', 7, CAST(N'1998-02-10T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-02-18T00:00:00.000' AS DateTime), 88.0100, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10886, N'HANAR', 1, CAST(N'1998-02-13T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-03-02T00:00:00.000' AS DateTime), 4.9900, N'Hanari Carnes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10887, N'GALED', 8, CAST(N'1998-02-13T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-02-16T00:00:00.000' AS DateTime), 1.2500, N'Galería del gastronómo', N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10888, N'GODOS', 1, CAST(N'1998-02-16T00:00:00.000' AS DateTime), CAST(N'1998-03-16T00:00:00.000' AS DateTime), CAST(N'1998-02-23T00:00:00.000' AS DateTime), 51.8700, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10895, N'ERNSH', 3, CAST(N'1998-02-18T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime), CAST(N'1998-02-23T00:00:00.000' AS DateTime), 162.7500, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10901, N'HILAA', 4, CAST(N'1998-02-23T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime), CAST(N'1998-02-26T00:00:00.000' AS DateTime), 62.0900, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10902, N'FOLKO', 1, CAST(N'1998-02-23T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime), CAST(N'1998-03-03T00:00:00.000' AS DateTime), 44.1500, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10903, N'HANAR', 3, CAST(N'1998-02-24T00:00:00.000' AS DateTime), CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-03-04T00:00:00.000' AS DateTime), 36.7100, N'Hanari Carnes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10911, N'GODOS', 3, CAST(N'1998-02-26T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-03-05T00:00:00.000' AS DateTime), 38.1900, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10922, N'HANAR', 5, CAST(N'1998-03-03T00:00:00.000' AS DateTime), CAST(N'1998-03-31T00:00:00.000' AS DateTime), CAST(N'1998-03-05T00:00:00.000' AS DateTime), 62.7400, N'Hanari Carnes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10925, N'HANAR', 3, CAST(N'1998-03-04T00:00:00.000' AS DateTime), CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-03-13T00:00:00.000' AS DateTime), 2.2700, N'Hanari Carnes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10928, N'GALED', 1, CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime), 1.3600, N'Galería del gastronómo', N'Rambla de Cataluña, 23', N'Barcelona', NULL, N'8022', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10929, N'FRANK', 6, CAST(N'1998-03-05T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-03-12T00:00:00.000' AS DateTime), 33.9300, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10936, N'GREAL', 3, CAST(N'1998-03-09T00:00:00.000' AS DateTime), CAST(N'1998-04-06T00:00:00.000' AS DateTime), CAST(N'1998-03-18T00:00:00.000' AS DateTime), 33.6800, N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10948, N'GODOS', 3, CAST(N'1998-03-13T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), CAST(N'1998-03-19T00:00:00.000' AS DateTime), 23.3900, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10955, N'FOLKO', 8, CAST(N'1998-03-17T00:00:00.000' AS DateTime), CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-03-20T00:00:00.000' AS DateTime), 3.2600, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10957, N'HILAA', 8, CAST(N'1998-03-18T00:00:00.000' AS DateTime), CAST(N'1998-04-15T00:00:00.000' AS DateTime), CAST(N'1998-03-27T00:00:00.000' AS DateTime), 105.3600, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10959, N'GOURL', 6, CAST(N'1998-03-18T00:00:00.000' AS DateTime), CAST(N'1998-04-29T00:00:00.000' AS DateTime), CAST(N'1998-03-23T00:00:00.000' AS DateTime), 4.9800, N'Gourmet Lanchonetes', N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10960, N'HILAA', 3, CAST(N'1998-03-19T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), CAST(N'1998-04-08T00:00:00.000' AS DateTime), 2.0800, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10963, N'FURIB', 9, CAST(N'1998-03-19T00:00:00.000' AS DateTime), CAST(N'1998-04-16T00:00:00.000' AS DateTime), CAST(N'1998-03-26T00:00:00.000' AS DateTime), 2.7000, N'Furia Bacalhau e Frutos do Mar', N'Jardim das rosas n. 32', N'Lisboa', NULL, N'1675', N'Portugal')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10968, N'ERNSH', 1, CAST(N'1998-03-23T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime), CAST(N'1998-04-01T00:00:00.000' AS DateTime), 74.6000, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10971, N'FRANR', 2, CAST(N'1998-03-24T00:00:00.000' AS DateTime), CAST(N'1998-04-21T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), 121.8200, N'France restauration', N'54, rue Royale', N'Nantes', NULL, N'44000', N'France')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10976, N'HILAA', 1, CAST(N'1998-03-25T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-04-03T00:00:00.000' AS DateTime), 37.9700, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10977, N'FOLKO', 8, CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), 208.5000, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10979, N'ERNSH', 8, CAST(N'1998-03-26T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-03-31T00:00:00.000' AS DateTime), 353.0700, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10980, N'FOLKO', 4, CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'1998-05-08T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime), 1.2600, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10981, N'HANAR', 1, CAST(N'1998-03-27T00:00:00.000' AS DateTime), CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-04-02T00:00:00.000' AS DateTime), 193.3700, N'Hanari Carnes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10990, N'ERNSH', 2, CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-05-13T00:00:00.000' AS DateTime), CAST(N'1998-04-07T00:00:00.000' AS DateTime), 117.6100, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (10993, N'FOLKO', 7, CAST(N'1998-04-01T00:00:00.000' AS DateTime), CAST(N'1998-04-29T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), 8.8100, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11001, N'FOLKO', 2, CAST(N'1998-04-06T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime), CAST(N'1998-04-14T00:00:00.000' AS DateTime), 197.3000, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11006, N'GREAL', 3, CAST(N'1998-04-07T00:00:00.000' AS DateTime), CAST(N'1998-05-05T00:00:00.000' AS DateTime), CAST(N'1998-04-15T00:00:00.000' AS DateTime), 25.1900, N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11008, N'ERNSH', 7, CAST(N'1998-04-08T00:00:00.000' AS DateTime), NULL, NULL, 79.4600, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11009, N'GODOS', 2, CAST(N'1998-04-08T00:00:00.000' AS DateTime), CAST(N'1998-05-06T00:00:00.000' AS DateTime), CAST(N'1998-04-10T00:00:00.000' AS DateTime), 59.1100, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11012, N'FRANK', 1, CAST(N'1998-04-09T00:00:00.000' AS DateTime), CAST(N'1998-04-23T00:00:00.000' AS DateTime), CAST(N'1998-04-17T00:00:00.000' AS DateTime), 242.9500, N'Frankenversand', N'Berliner Platz 43', N'München', NULL, N'80805', N'Germany')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11017, N'ERNSH', 9, CAST(N'1998-04-13T00:00:00.000' AS DateTime), CAST(N'1998-05-11T00:00:00.000' AS DateTime), CAST(N'1998-04-20T00:00:00.000' AS DateTime), 754.2600, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11022, N'HANAR', 9, CAST(N'1998-04-14T00:00:00.000' AS DateTime), CAST(N'1998-05-12T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime), 6.2700, N'Hanari Carnes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11026, N'FRANS', 4, CAST(N'1998-04-15T00:00:00.000' AS DateTime), CAST(N'1998-05-13T00:00:00.000' AS DateTime), CAST(N'1998-04-28T00:00:00.000' AS DateTime), 47.0900, N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11037, N'GODOS', 7, CAST(N'1998-04-21T00:00:00.000' AS DateTime), CAST(N'1998-05-19T00:00:00.000' AS DateTime), CAST(N'1998-04-27T00:00:00.000' AS DateTime), 3.2000, N'Godos Cocina Típica', N'C/ Romero, 33', N'Sevilla', NULL, N'41101', N'Spain')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11040, N'GREAL', 4, CAST(N'1998-04-22T00:00:00.000' AS DateTime), NULL, NULL, 18.8400, N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11049, N'GOURL', 3, CAST(N'1998-04-24T00:00:00.000' AS DateTime), CAST(N'1998-05-22T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime), 8.3400, N'Gourmet Lanchonetes', N'Av. Brasil, 442', N'Campinas', N'SP', N'04876-786', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11050, N'FOLKO', 8, CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-05-25T00:00:00.000' AS DateTime), CAST(N'1998-05-05T00:00:00.000' AS DateTime), 59.4100, N'Folk och fä HB', N'Åkergatan 24', N'Bräcke', NULL, N'S-844 67', N'Sweden')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11052, N'HANAR', 3, CAST(N'1998-04-27T00:00:00.000' AS DateTime), CAST(N'1998-05-25T00:00:00.000' AS DateTime), CAST(N'1998-05-01T00:00:00.000' AS DateTime), 67.2600, N'Hanari Carnes', N'Rua do Paço, 67', N'Rio de Janeiro', N'RJ', N'05454-876', N'Brazil')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11055, N'HILAA', 7, CAST(N'1998-04-28T00:00:00.000' AS DateTime), CAST(N'1998-05-26T00:00:00.000' AS DateTime), CAST(N'1998-05-05T00:00:00.000' AS DateTime), 120.9200, N'HILARION-Abastos', N'Carrera 22 con Ave. Carlos Soublette #8-35', N'San Cristóbal', N'Táchira', N'5022', N'Venezuela')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11060, N'FRANS', 2, CAST(N'1998-04-30T00:00:00.000' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), CAST(N'1998-05-04T00:00:00.000' AS DateTime), 10.9800, N'Franchi S.p.A.', N'Via Monte Bianco 34', N'Torino', NULL, N'10100', N'Italy')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11061, N'GREAL', 4, CAST(N'1998-04-30T00:00:00.000' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL, 14.0100, N'Great Lakes Food Market', N'2732 Baker Blvd.', N'Eugene', N'OR', N'97403', N'USA')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11072, N'ERNSH', 4, CAST(N'1998-05-05T00:00:00.000' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL, 258.6400, N'Ernst Handel', N'Kirchgasse 6', N'Graz', NULL, N'8010', N'Austria')
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11073, NULL, NULL, CAST(N'2022-10-03T11:00:19.093' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11074, NULL, NULL, CAST(N'2022-10-03T11:02:21.257' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11075, N'EGYJF', NULL, CAST(N'2022-10-03T11:05:03.867' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11076, N'EGYJF', NULL, CAST(N'2022-10-03T11:08:15.153' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11077, N'EGYJF', NULL, CAST(N'2022-10-03T11:18:11.013' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11078, N'EGYJF', NULL, CAST(N'2022-10-03T11:21:12.977' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11079, N'EGYJF', NULL, CAST(N'2022-10-03T11:22:05.607' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11080, N'EGYJF', NULL, CAST(N'2022-10-03T11:27:44.497' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11081, N'EGYJF', NULL, CAST(N'2022-10-03T11:37:12.463' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (11082, N'EGYJF', NULL, CAST(N'2022-10-03T12:03:27.340' AS DateTime), CAST(N'1998-05-28T00:00:00.000' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (12073, N'EGYJF', NULL, CAST(N'2022-10-04T10:23:39.033' AS DateTime), NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (12074, N'EGYJF', NULL, CAST(N'2022-10-04T23:05:19.983' AS DateTime), NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (12075, N'EGYJF', NULL, CAST(N'2022-10-04T23:29:56.050' AS DateTime), NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (13073, N'EGYJF', NULL, CAST(N'2022-10-05T11:51:59.327' AS DateTime), NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (14073, N'EGYJF', NULL, CAST(N'2022-10-18T11:51:10.980' AS DateTime), NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (14074, N'EGYJF', NULL, CAST(N'2022-10-20T22:44:05.160' AS DateTime), NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (14075, N'EGYJF', NULL, CAST(N'2022-10-20T22:50:04.537' AS DateTime), NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (14076, NULL, NULL, CAST(N'2022-10-20T23:19:35.867' AS DateTime), CAST(N'2022-10-27T23:19:35.870' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (14077, NULL, NULL, CAST(N'2022-10-20T23:23:02.133' AS DateTime), CAST(N'2022-10-27T23:23:02.137' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (14078, NULL, NULL, CAST(N'2022-10-20T23:26:53.923' AS DateTime), CAST(N'2022-10-27T23:26:53.923' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (14079, N'EGYJF', NULL, CAST(N'2022-10-20T23:32:46.957' AS DateTime), NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (14080, NULL, NULL, CAST(N'2022-10-20T23:33:13.380' AS DateTime), CAST(N'2022-10-27T23:33:13.380' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (14081, NULL, NULL, CAST(N'2022-01-20T23:38:14.787' AS DateTime), CAST(N'2022-10-27T23:38:14.790' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (14082, NULL, NULL, CAST(N'2022-01-20T23:39:59.887' AS DateTime), CAST(N'2022-10-27T23:39:59.890' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (15074, N'EGYJF', NULL, CAST(N'2022-10-24T10:59:30.337' AS DateTime), NULL, NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (16074, N'MLJUF', NULL, CAST(N'2022-11-01T09:21:45.647' AS DateTime), CAST(N'2022-11-08T09:21:45.647' AS DateTime), NULL, 0.0000, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [EmployeeID], [OrderDate], [RequiredDate], [ShippedDate], [Freight], [ShipName], [ShipAddress], [ShipCity], [ShipRegion], [ShipPostalCode], [ShipCountry]) VALUES (16075, N'YKC0T', NULL, CAST(N'2023-03-26T16:45:33.840' AS DateTime), CAST(N'2023-04-02T16:45:33.840' AS DateTime), NULL, 0.0000, N'FPTU', N'NO', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1, N'Formal Blue Shirt', 1, N'10 boxes x 20 bags', 18.0000, 39, NULL, 9, 0, 1, N'images/WIN_20230424_21_18_37_Pro.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (2, N'Gabi Full Sleeve Sweatshirt', 1, N'24 - 12 oz bottles', 19.0000, 17, 40, 25, 0, 1, N'images/ms2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (3, N'Dark Blue Track Pants', 2, N'12 - 550 ml bottles', 10.0000, 13, 70, 25, 0, 1, N'images/mp1.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (4, N'Men''s Black Jeans', 2, N'48 - 6 oz jars', 22.0000, 53, 0, 0, 0, 1, N'images/mp2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (5, N'Black Basic Shorts', 2, N'36 boxes', 21.3500, 0, 0, 0, 0, 1, N'images/mp3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (6, N'Denim Jeans', 2, N'12 - 8 oz jars', 25.0000, 120, 0, 25, 0, 1, N'images/mp4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (7, N'Baby Onesie', 7, N'12 - 1 lb pkgs.', 30.0000, 15, 0, 10, 0, 1, N'images/bs1.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (8, N'Khaki Pants', 2, N'12 - 12 oz jars', 40.0000, 6, 0, 0, 0, 1, N'images/mp5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (9, N'Sunglasses', 6, N'18 - 500 g pkgs.', 97.0000, 29, 0, 0, 0, 1, N'images/wa1.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (10, N'Baby Boy Pants', 8, N'12 - 200 ml jars', 31.0000, 31, 0, 0, 0, 1, N'images/bp1.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (11, N'A-line Top', 4, N'1 kg pkg.', 21.0000, 22, 30, 30, 0, 1, N'images/ws1.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (12, N'Bardot Sexy Top for Women', 4, N'10 - 500 g pkgs.', 38.0000, 86, 0, 0, 0, 1, N'images/ws2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (13, N'Baby Boy Short Pants', 8, N'2 kg box', 6.0000, 24, 0, 5, 0, 1, N'images/bp2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (14, N'Baby Onesie 2', 7, N'40 - 100 g pkgs.', 23.2500, 35, 0, 0, 0, 1, N'images/bs2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (15, N'Pleated Pant', 2, N'24 - 250 ml bottles', 15.5000, 39, 0, 5, 0, 1, N'images/mp6.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (16, N'Reversible Belt', 3, N'32 - 500 g boxes', 17.4500, 29, 0, 10, 0, 1, N'images/ma1.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (17, N'Travel Duffel Bag', 6, N'20 - 1 kg tins', 39.0000, 0, 0, 0, 0, 1, N'images/wa2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (18, N'Baby Girl Pants', 8, N'16 kg pkg.', 62.5000, 42, 0, 0, 0, 1, N'images/bp3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (19, N'Analog Watch', 3, N'10 boxes x 12 pieces', 9.2000, 25, 0, 5, 0, 1, N'images/ma2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (20, N'Ankle Length Socks', 3, N'30 gift boxes', 81.0000, 40, 0, 0, 0, 1, N'images/ma3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (21, N'Laptop Messenger Bag', 3, N'24 pkgs. x 4 pieces', 10.0000, 3, 40, 5, 0, 1, N'images/ma4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (22, N'Skinny Jeans', 5, N'24 - 500 g pkgs.', 21.0000, 104, 0, 25, 0, 1, N'images/wp1.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (23, N'Pink Track Pants', 5, N'12 - 250 g pkgs.', 9.0000, 61, 0, 25, 0, 1, N'images/wp2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (24, N'Round Neck Black T-Shirt', 1, N'12 - 355 ml cans', 4.5000, 20, 0, 0, 0, 1, N'images/ms3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (25, N'Puma Backpack', 3, N'20 - 450 g glasses', 14.0000, 76, 0, 30, 0, 1, N'images/ma5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (26, N'Laptop Backpack', 3, N'100 - 250 g bags', 31.2300, 15, 0, 0, 0, 1, N'images/ma6.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (27, N'Running Shoes', 3, N'100 - 100 g pieces', 43.9000, 49, 0, 30, 0, 1, N'images/ma7.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (28, N'Blanket', 7, N'25 - 825 g cans', 45.6000, 26, 0, 0, 0, 1, N'images/bs3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (29, N'Hand-held Bag', 6, N'50 bags x 30 sausgs.', 123.7900, 0, 0, 0, 0, 1, N'images/wa3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (30, N'Baby Girl Short Pants', 8, N'10 - 200 g glasses', 25.8900, 10, 0, 15, 0, 1, N'images/bp4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (31, N'Blouson Top', 4, N'12 - 100 g pkgs', 12.5000, 0, 70, 20, 0, 1, N'images/ws3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (32, N'Boxy Top for Girls', 4, N'24 - 200 g pkgs.', 32.0000, 9, 40, 25, 0, 1, N'images/ws4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (33, N'Cami Top', 4, N'500 g', 2.5000, 112, 0, 20, 0, 1, N'images/ws5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (34, N'Party Men''s Blazer', 1, N'24 - 12 oz bottles', 14.0000, 111, 0, 15, 0, 1, N'images/ms4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (35, N'A-line Black Skirt', 5, N'24 - 12 oz bottles', 18.0000, 20, 0, 15, 0, 1, N'images/wp3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (36, N'Toddler Pant', 8, N'24 - 250 g  jars', 19.0000, 112, 0, 20, 0, 1, N'images/bp5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (37, N'Baby Cotton Pant', 8, N'12 - 500 g pkgs.', 26.0000, 11, 50, 25, 0, 1, N'images/bp6.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (38, N'Office Shirt', 1, N'12 - 75 cl bottles', 263.5000, 17, 0, 15, 0, 1, N'images/ms5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (39, N'Suit Shirt', 1, N'750 cc per bottle', 18.0000, 69, 0, 5, 0, 1, N'images/ms6.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (40, N'Baby Skirts', 8, N'24 - 4 oz tins', 18.4000, 123, 0, 30, 0, 1, N'images/bp7.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (41, N'Baby Jeans', 8, N'12 - 12 oz cans', 9.6500, 85, 0, 10, 0, 1, N'images/bp8.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (42, N'Reebok Women''s Tights', 5, N'32 - 1 kg pkgs.', 14.0000, 26, 0, 0, 0, 1, N'images/wp4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (43, N'Oxford Shirt', 1, N'16 - 500 g tins', 46.0000, 17, 10, 25, 0, 1, N'images/ms7.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (44, N'Dress Pant', 2, N'20 - 2 kg bags', 19.4500, 27, 0, 15, 0, 1, N'images/mp7.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (45, N'Green Baby Jeans', 8, N'1k pkg.', 9.5000, 5, 70, 15, 0, 1, N'images/bp9.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (46, N'Black Baby Jeans', 8, N'4 - 450 g glasses', 12.0000, 95, 0, 0, 0, 1, N'images/bp10.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (47, N'Cufflinks', 3, N'10 - 4 oz boxes', 9.5000, 36, 0, 0, 0, 1, N'images/ma11.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (48, N'Men''s Gloves', 3, N'10 pkgs.', 12.7500, 15, 70, 25, 0, 1, N'images/ma8.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (49, N'Tie Clips', 3, N'24 - 50 g pkgs.', 20.0000, 10, 60, 15, 0, 1, N'images/ma9.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (50, N'Men''s Pocket Squares', 3, N'12 - 100 g bars', 16.2500, 65, 0, 30, 0, 1, N'images/ma10.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (51, N'Romper', 7, N'50 - 300 g pkgs.', 53.0000, 20, 0, 10, 0, 1, N'images/bs4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (52, N'Pajamas/Lounge Pant', 5, N'16 - 2 kg boxes', 7.0000, 38, 0, 25, 0, 1, N'images/wp5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (53, N'Hand-held Bag 2', 6, N'48 pieces', 32.8000, 0, 0, 0, 0, 1, N'images/wa4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (54, N'Apron', 6, N'16 pies', 7.4500, 21, 0, 10, 0, 1, N'images/wa5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (55, N'Shoetopia Lace Up', 6, N'24 boxes x 2 pies', 24.0000, 115, 0, 20, 0, 1, N'images/wa6.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (56, N'Palazzo Pant', 5, N'24 - 250 g pkgs.', 38.0000, 21, 10, 30, 0, 1, N'images/wp6.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (57, N'Patiala Pant', 5, N'24 - 250 g pkgs.', 19.5000, 36, 0, 20, 0, 1, N'images/wp7.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (58, N'Baby Trousers', 8, N'24 pieces', 13.2500, 62, 0, 20, 0, 1, N'images/bp11.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (59, N'Cape-style Top', 4, N'5 kg pkg.', 55.0000, 79, 0, 0, 0, 1, N'images/ws6.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (60, N'Tunic', 4, N'15 - 300 g rounds', 34.0000, 19, 0, 0, 0, 1, N'images/ws7.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (61, N'Cargo Pant', 2, N'24 - 500 ml bottles', 28.5000, 113, 0, 25, 0, 1, N'images/mp8.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (62, N'Tie Clips', 3, N'48 pies', 49.3000, 17, 0, 0, 0, 1, N'images/ma12.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (63, N'Grey Shorts', 2, N'15 - 625 g jars', 43.9000, 24, 0, 5, 0, 1, N'images/mp9.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (64, N'Wimmers gute Semmelknödel', 5, N'20 bags x 4 pieces', 33.2500, 22, 80, 30, 0, 1, N'images/wp9.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (65, N'Lounge Pant', 5, N'32 - 8 oz bottles', 21.0500, 76, 0, 0, 0, 1, N'images/wp8.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (66, N'Cotton Chinos', 2, N'24 - 8 oz jars', 17.0000, 4, 100, 20, 0, 1, N'images/mp10.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (67, N'Dress Shirts', 1, N'24 - 12 oz bottles', 14.0000, 52, 0, 10, 0, 1, N'images/ms8.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (68, N'Bow Ties', 3, N'10 boxes x 8 pieces', 12.5000, 6, 10, 15, 0, 1, N'images/ma13.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (69, N'Sleeveless Shirt', 4, N'10 kg pkg.', 36.0000, 26, 0, 15, 0, 1, N'images/ws8.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (70, N'Short-Sleeve Shirts', 1, N'24 - 355 ml bottles', 15.0000, 15, 10, 30, 0, 1, N'images/ms9.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (71, N'Peter Pan Collar Top', 4, N'10 - 500 g pkgs.', 21.5000, 26, 0, 0, 0, 1, N'images/ws9.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (72, N'Croptop', 4, N'24 - 200 g pkgs.', 34.8000, 14, 0, 0, 0, 1, N'images/ws10.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (73, N'Woven Baby Pants', 8, N'24 - 150 g jars', 15.0000, 101, 0, 5, 0, 1, N'images/bp12.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (74, N'Wearable', 7, N'5 kg pkg.', 10.0000, 4, 20, 5, 0, 1, N'images/bs5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (75, N'Polo Shirts', 1, N'24 - 0.5 l bottles', 7.7500, 125, 20, 25, 0, 1, N'images/ms10.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (76, N'Cuban Collar Shirts', 1, N'500 ml', 18.0000, 57, 20, 20, 0, 1, N'images/ms11.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (77, N'Linen Trouser', 2, N'12 boxes', 13.0000, 32, 0, 15, 0, 1, N'images/mp11.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1080, N'Moonwalk Bellies', 10, N'12 boxes', 12.0000, 32, 20, 12, 0, 1, N'images/ms10.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1081, N'Baby Lotion', 10, N'12 boxes', 12.0000, 10, 20, 12, 0, 1, N'images/ms10.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1082, N'Baby Bottle', 10, N'12 boxes', 12.0000, 10, 20, 12, 0, 1, N'images/ba3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1083, N'Bassinet', 10, N'12 boxes', 12.0000, 10, 20, 12, 0, 1, N'images/ba4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1084, N'Bib', 10, N'12 boxes', 12.0000, 10, 20, 12, 0, 1, N'images/ba5.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1085, N'Doll', 10, N'12 boxes', 12.0000, 10, 20, 12, 0, 1, N'images/ba6.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1086, N'Culotte Dress', 1010, N'12 boxes', 12.0000, 10, 20, 12, 0, 1, N'images/wd1.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1087, N'Babydoll Dress', 1010, N'12 boxes', 12.0000, 10, 20, 12, 0, 1, N'images/wd2.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1088, N'Shirtdress', 1010, N'12 boxes', 12.0000, 10, 20, 12, 0, 1, N'images/wd3.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1089, N'Polo Dress', 1010, N'12 boxes', 12.0000, 10, 20, 12, 0, 1, N'images/wd4.jpg')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1090, N'aaaaaa', 1, N'aaaaa', 20.0000, 3, 0, 4, 0, 1, N'images/326453149_3502843556625621_4272890197266063995_n.png')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [QuantityPerUnit], [UnitPrice], [UnitsInStock], [UnitsOnOrder], [ReorderLevel], [Discontinued], [IsActive], [Picture]) VALUES (1091, N'aaaaaa', 1, N'aaaaa', 20.0000, 3, 0, 4, 0, 0, N'images/326453149_3502843556625621_4272890197266063995_n.png')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
/****** Object:  Index [UQ_Email]    Script Date: 7/23/2023 2:27:44 AM ******/
ALTER TABLE [dbo].[Accounts] ADD  CONSTRAINT [UQ_Email] UNIQUE NONCLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CategoryName]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [CategoryName] ON [dbo].[Categories]
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CompanyName]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [CompanyName] ON [dbo].[Customers]
(
	[CompanyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [LastName]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [LastName] ON [dbo].[Employees]
(
	[LastName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [OrderID]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [OrderID] ON [dbo].[Order Details]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [OrdersOrder_Details]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [OrdersOrder_Details] ON [dbo].[Order Details]
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ProductID]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [ProductID] ON [dbo].[Order Details]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ProductsOrder_Details]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [ProductsOrder_Details] ON [dbo].[Order Details]
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CustomerID]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [CustomerID] ON [dbo].[Orders]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [CustomersOrders]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [CustomersOrders] ON [dbo].[Orders]
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [EmployeeID]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [EmployeeID] ON [dbo].[Orders]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [EmployeesOrders]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [EmployeesOrders] ON [dbo].[Orders]
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [OrderDate]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [OrderDate] ON [dbo].[Orders]
(
	[OrderDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [ShippedDate]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [ShippedDate] ON [dbo].[Orders]
(
	[ShippedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ShipPostalCode]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [ShipPostalCode] ON [dbo].[Orders]
(
	[ShipPostalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CategoriesProducts]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [CategoriesProducts] ON [dbo].[Products]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [CategoryID]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [CategoryID] ON [dbo].[Products]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [ProductName]    Script Date: 7/23/2023 2:27:44 AM ******/
CREATE NONCLUSTERED INDEX [ProductName] ON [dbo].[Products]
(
	[ProductName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_Quantity]  DEFAULT ((1)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Order Details] ADD  CONSTRAINT [DF_Order_Details_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_Freight]  DEFAULT ((0)) FOR [Freight]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitPrice]  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitsInStock]  DEFAULT ((0)) FOR [UnitsInStock]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_UnitsOnOrder]  DEFAULT ((0)) FOR [UnitsOnOrder]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_ReorderLevel]  DEFAULT ((0)) FOR [ReorderLevel]
GO
ALTER TABLE [dbo].[Products] ADD  CONSTRAINT [DF_Products_Discontinued]  DEFAULT ((0)) FOR [Discontinued]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Customers]
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Orders]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [FK_Order_Details_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH NOCHECK ADD  CONSTRAINT [FK_Orders_Employees] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Employees]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[RefreshTokens]  WITH CHECK ADD  CONSTRAINT [fk_acc_token] FOREIGN KEY([AccountId])
REFERENCES [dbo].[Accounts] ([AccountID])
GO
ALTER TABLE [dbo].[RefreshTokens] CHECK CONSTRAINT [fk_acc_token]
GO
ALTER TABLE [dbo].[Employees]  WITH NOCHECK ADD  CONSTRAINT [CK_Birthdate] CHECK  (([BirthDate]<getdate()))
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [CK_Birthdate]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_Discount] CHECK  (([Discount]>=(0) AND [Discount]<=(1)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_Discount]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_Quantity] CHECK  (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_Quantity]
GO
ALTER TABLE [dbo].[Order Details]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitPrice] CHECK  (([UnitPrice]>=(0)))
GO
ALTER TABLE [dbo].[Order Details] CHECK CONSTRAINT [CK_UnitPrice]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_Products_UnitPrice] CHECK  (([UnitPrice]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_Products_UnitPrice]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_ReorderLevel] CHECK  (([ReorderLevel]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_ReorderLevel]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsInStock] CHECK  (([UnitsInStock]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_UnitsInStock]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [CK_UnitsOnOrder] CHECK  (([UnitsOnOrder]>=(0)))
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [CK_UnitsOnOrder]
GO
/****** Object:  StoredProcedure [dbo].[CustOrderHist]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CustOrderHist] @CustomerID nchar(5)
AS
SELECT ProductName, Total=SUM(Quantity)
FROM Products P, [Order Details] OD, Orders O, Customers C
WHERE C.CustomerID = @CustomerID
AND C.CustomerID = O.CustomerID AND O.OrderID = OD.OrderID AND OD.ProductID = P.ProductID
GROUP BY ProductName
GO
/****** Object:  StoredProcedure [dbo].[CustOrdersDetail]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CustOrdersDetail] @OrderID int
AS
SELECT ProductName,
    UnitPrice=ROUND(Od.UnitPrice, 2),
    Quantity,
    Discount=CONVERT(int, Discount * 100), 
    ExtendedPrice=ROUND(CONVERT(money, Quantity * (1 - Discount) * Od.UnitPrice), 2)
FROM Products P, [Order Details] Od
WHERE Od.ProductID = P.ProductID and Od.OrderID = @OrderID
GO
/****** Object:  StoredProcedure [dbo].[CustOrdersOrders]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CustOrdersOrders] @CustomerID nchar(5)
AS
SELECT OrderID, 
	OrderDate,
	RequiredDate,
	ShippedDate
FROM Orders
WHERE CustomerID = @CustomerID
ORDER BY OrderID
GO
/****** Object:  StoredProcedure [dbo].[Employee Sales by Country]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Employee Sales by Country] 
@Beginning_Date DateTime, @Ending_Date DateTime AS
SELECT Employees.Country, Employees.LastName, Employees.FirstName, Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal AS SaleAmount
FROM Employees INNER JOIN 
	(Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID) 
	ON Employees.EmployeeID = Orders.EmployeeID
WHERE Orders.ShippedDate Between @Beginning_Date And @Ending_Date
GO
/****** Object:  StoredProcedure [dbo].[Sales by Year]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Sales by Year] 
	@Beginning_Date DateTime, @Ending_Date DateTime AS
SELECT Orders.ShippedDate, Orders.OrderID, "Order Subtotals".Subtotal, DATENAME(yy,ShippedDate) AS Year
FROM Orders INNER JOIN "Order Subtotals" ON Orders.OrderID = "Order Subtotals".OrderID
WHERE Orders.ShippedDate Between @Beginning_Date And @Ending_Date
GO
/****** Object:  StoredProcedure [dbo].[SalesByCategory]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SalesByCategory]
    @CategoryName nvarchar(15), @OrdYear nvarchar(4) = '1998'
AS
IF @OrdYear != '1996' AND @OrdYear != '1997' AND @OrdYear != '1998' 
BEGIN
	SELECT @OrdYear = '1998'
END

SELECT ProductName,
	TotalPurchase=ROUND(SUM(CONVERT(decimal(14,2), OD.Quantity * (1-OD.Discount) * OD.UnitPrice)), 0)
FROM [Order Details] OD, Orders O, Products P, Categories C
WHERE OD.OrderID = O.OrderID 
	AND OD.ProductID = P.ProductID 
	AND P.CategoryID = C.CategoryID
	AND C.CategoryName = @CategoryName
	AND SUBSTRING(CONVERT(nvarchar(22), O.OrderDate, 111), 1, 4) = @OrdYear
GROUP BY ProductName
ORDER BY ProductName
GO
/****** Object:  StoredProcedure [dbo].[Ten Most Expensive Products]    Script Date: 7/23/2023 2:27:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Ten Most Expensive Products] AS
SET ROWCOUNT 10
SELECT Products.ProductName AS TenMostExpensiveProducts, Products.UnitPrice
FROM Products
ORDER BY Products.UnitPrice DESC
GO
USE [master]
GO
ALTER DATABASE [ClothesStoreDB] SET  READ_WRITE 
GO
