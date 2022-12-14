USE [master]
GO
/****** Object:  Database [ShoppingManagement]    Script Date: 8/15/2022 9:36:47 PM ******/
CREATE DATABASE [ShoppingManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShoppingManagement.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShoppingManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ShoppingManagement_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShoppingManagement] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ShoppingManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShoppingManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoppingManagement] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingManagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShoppingManagement] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ShoppingManagement]
GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 8/15/2022 9:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[categoryID] [nvarchar](30) NOT NULL,
	[categoryName] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrder]    Script Date: 8/15/2022 9:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrder](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NULL,
	[total] [float] NULL,
	[userID] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblOrderDetail]    Script Date: 8/15/2022 9:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetail](
	[detailID] [int] IDENTITY(1,1) NOT NULL,
	[price] [float] NULL,
	[quantity] [float] NULL,
	[orderID] [int] NULL,
	[productID] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[detailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 8/15/2022 9:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[productID] [nvarchar](30) NOT NULL,
	[productName] [nvarchar](30) NULL,
	[image] [nvarchar](max) NULL,
	[price] [float] NULL,
	[quantity] [float] NULL,
	[categoryID] [nvarchar](30) NULL,
	[importDate] [date] NULL,
	[usingDate] [date] NULL,
	[status] [nvarchar](30) NULL,
 CONSTRAINT [PK__tblProdu__2D10D14A2779B969] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRoles]    Script Date: 8/15/2022 9:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRoles](
	[roleID] [nvarchar](30) NOT NULL,
	[roleName] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 8/15/2022 9:36:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](30) NOT NULL,
	[password] [nvarchar](30) NULL,
	[roleID] [nvarchar](30) NULL,
	[address] [nvarchar](30) NULL,
	[birthday] [date] NULL,
	[phone] [float] NULL,
	[email] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'CT1', N'Good')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'CT2', N'Not Good')
INSERT [dbo].[tblCategory] ([categoryID], [categoryName]) VALUES (N'CT3', N'Great')
SET IDENTITY_INSERT [dbo].[tblOrder] ON 

INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (1, CAST(N'2022-04-12' AS Date), 400, N'SE120')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (2, CAST(N'2022-03-11' AS Date), 300, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (3, CAST(N'2022-03-11' AS Date), 200, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (4, CAST(N'2022-03-11' AS Date), 700, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (5, CAST(N'2022-03-11' AS Date), 5000, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (6, CAST(N'2022-03-12' AS Date), 600, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (7, CAST(N'2022-03-12' AS Date), 1200, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (8, CAST(N'2022-03-12' AS Date), 600, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (9, CAST(N'2022-03-12' AS Date), 300, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (10, CAST(N'2022-03-12' AS Date), 200, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (11, CAST(N'2022-03-12' AS Date), 50, N'bangdase150648@fpt.edu.vn')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (12, CAST(N'2022-03-16' AS Date), 10, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (13, CAST(N'2022-03-16' AS Date), 10, N'bangdase150648@fpt.edu.vn')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (14, CAST(N'2022-03-17' AS Date), 220, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (15, CAST(N'2022-03-17' AS Date), 10, N'bangdase150648@fpt.edu.vn')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (16, CAST(N'2022-03-17' AS Date), 400, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (17, CAST(N'2022-03-17' AS Date), 400, N'SE456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (18, CAST(N'2022-05-10' AS Date), 50, N'SE120')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (19, CAST(N'2022-05-10' AS Date), 50, N'SE120')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (20, CAST(N'2022-06-27' AS Date), 30000, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (21, CAST(N'2022-06-27' AS Date), 30150, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (22, CAST(N'2022-06-28' AS Date), 520, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (23, CAST(N'2022-06-28' AS Date), 520, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (24, CAST(N'2022-06-28' AS Date), 520, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (25, CAST(N'2022-06-28' AS Date), 530, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (26, CAST(N'2022-06-28' AS Date), 520, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (27, CAST(N'2022-06-28' AS Date), 520, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (28, CAST(N'2022-06-28' AS Date), 500, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (29, CAST(N'2022-06-28' AS Date), 500, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (30, CAST(N'2022-06-28' AS Date), 500, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (31, CAST(N'2022-06-28' AS Date), 530, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (32, CAST(N'2022-06-28' AS Date), 550, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (33, CAST(N'2022-06-28' AS Date), 570, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (34, CAST(N'2022-06-28' AS Date), 530, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (35, CAST(N'2022-06-29' AS Date), 20, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (36, CAST(N'2022-06-29' AS Date), 20, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (37, CAST(N'2022-06-29' AS Date), 520, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (38, CAST(N'2022-06-29' AS Date), 20, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (39, CAST(N'2022-06-29' AS Date), 500, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (40, CAST(N'2022-06-29' AS Date), 20, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (41, CAST(N'2022-06-29' AS Date), 520, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (42, CAST(N'2022-06-29' AS Date), 100, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (43, CAST(N'2022-06-30' AS Date), 20, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (44, CAST(N'2022-06-30' AS Date), 20, N'se456')
INSERT [dbo].[tblOrder] ([orderID], [orderDate], [total], [userID]) VALUES (45, CAST(N'2022-07-06' AS Date), 520, N'se456')
SET IDENTITY_INSERT [dbo].[tblOrder] OFF
SET IDENTITY_INSERT [dbo].[tblOrderDetail] ON 

INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (1, 100, 2, 2, N'SP3')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (2, 100, 1, 3, N'SP3')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (3, 100, 2, 4, N'SP3')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (4, 100, 5, 4, N'SP8')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (5, 100, 50, 5, N'SP6')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (6, 100, 5, 6, N'SP3')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (7, 100, 1, 6, N'SP5')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (8, 100, 12, 7, N'SP3')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (9, 100, 5, 8, N'SP3')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (10, 100, 1, 8, N'SP5')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (11, 50, 2, 9, N'SP3')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (12, 100, 2, 9, N'SP6')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (13, 50, 2, 10, N'SP3')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (14, 100, 1, 10, N'SP6')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (15, 50, 1, 11, N'SP3')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (16, 10, 1, 12, N'SP23')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (17, 10, 1, 13, N'SP23')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (18, 10, 2, 14, N'SP19')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (19, 100, 2, 14, N'SP5')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (20, 10, 1, 15, N'SP19')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (21, 20, 20, 16, N'SP22')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (22, 20, 20, 17, N'SP22')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (23, 50, 1, 18, N'SP3')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (24, 50, 1, 19, N'SP3')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (40, 15, 15, 25, N'SP1')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (41, 500, 1, 28, N'SP1')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (42, 500, 1, 29, N'SP1')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (43, 500, 1, 30, N'SP1')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (44, 10, 1, 31, N'SP16')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (45, 500, 1, 31, N'SP1')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (46, 20, 1, 31, N'SP23')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (47, 500, 1, 32, N'SP1')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (48, 50, 1, 32, N'SP21')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (49, 500, 1, 33, N'SP1')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (50, 20, 1, 33, N'SP10')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (51, 50, 1, 33, N'SP21')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (52, 10, 1, 34, N'SP19')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (53, 500, 1, 34, N'SP1')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (54, 20, 1, 34, N'SP10')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (55, 20, 1, 35, N'SP10')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (56, 20, 1, 36, N'SP10')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (57, 500, 1, 37, N'SP1')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (58, 20, 1, 37, N'SP10')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (59, 20, 1, 38, N'SP10')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (60, 500, 1, 39, N'SP1')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (61, 20, 1, 40, N'SP10')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (62, 500, 1, 41, N'SP1')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (63, 20, 1, 41, N'SP10')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (64, 100, 1, 42, N'SP2')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (65, 20, 1, 43, N'SP10')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (66, 20, 1, 44, N'SP10')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (67, 500, 1, 45, N'SP1')
INSERT [dbo].[tblOrderDetail] ([detailID], [price], [quantity], [orderID], [productID]) VALUES (68, 20, 1, 45, N'SP10')
SET IDENTITY_INSERT [dbo].[tblOrderDetail] OFF
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP1', N'Bananaa', N'https://www.pngall.com/wp-content/uploads/2016/04/Banana-Free-Download-PNG.png', 500, 50, N'CT3', CAST(N'2022-10-12' AS Date), CAST(N'2022-10-13' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP10', N'Strawberri', N'https://e7.pngegg.com/pngimages/983/762/png-clipart-strawberry-fruit-strawberry.png', 20, 20, N'CT1', CAST(N'2022-03-02' AS Date), CAST(N'2022-03-02' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP16', N'TOM', N'https://www.pinterest.com/pin/846676798698436712/', 10, 100, N'CT1', CAST(N'2022-10-13' AS Date), CAST(N'2022-11-12' AS Date), N'False')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP19', N'DurIan', N'https://img.freepik.com/free-photo/durian-fruit-with-slices-leaves-isolated-white-surface_252965-910.jpg', 10, 7, N'CT3', CAST(N'2021-10-10' AS Date), CAST(N'2022-10-10' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP2', N'apple', N'https://img.lovepik.com/free-png/20210927/lovepik-apple-png-image_401592228_wh1200.png', 100, 50, N'CT2', CAST(N'2022-05-07' AS Date), CAST(N'2022-09-07' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP21', N'WaterMelon', N'https://i-suckhoe.vnecdn.net/2019/05/20/duahaungon-1558332883-15583328-5859-6444-1558333733_680x0.png', 50, 10, N'CT3', CAST(N'2022-10-03' AS Date), CAST(N'2022-02-01' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP22', N'Tomato', N'https://toppng.com/uploads/preview/tomato-roma-tomato-11563053313hzmixpiswm.png', 20, 100, N'CT2', CAST(N'2021-10-20' AS Date), CAST(N'2022-05-20' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP23', N'Coffe', N'https://png.pngtree.com/png-clipart/20190925/ourmid/pngtree-flying-cup-of-coffee-with-splash-and-coffee-beans-png-background-png-image_1742479.jpg', 20, 20, N'CT2', CAST(N'2022-02-03' AS Date), CAST(N'2022-08-02' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP3', N'Kiwi', N'https://banner2.cleanpng.com/20180202/vpq/kisspng-kiwifruit-icon-kiwi-5a74c49a256b88.1399010615176019461533.jpg', 50, 43, N'CT3', CAST(N'2022-05-03' AS Date), CAST(N'2022-09-03' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP35', N'abc', N'https://png.pngtree.com/png-clipart/20190925/ourmid/pngtree-flying-cup-of-coffee-with-splash-and-coffee-beans-png-background-png-image_1742479.jpg', 20, 10, N'CT1', CAST(N'2021-10-10' AS Date), CAST(N'2022-05-05' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP36', N'Strawberry', N'https://e7.pngegg.com/pngimages/983/762/png-clipart-strawberry-fruit-strawberry.png', 20, 20, N'CT3', CAST(N'2022-12-03' AS Date), CAST(N'2022-02-03' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP4', N'orange', N'https://thuviendohoa.vn/upload/images/items/hinh-anh-qua-cam-vang-tuoi-ngon-png-73.jpg', 100, 0, N'CT1', CAST(N'2022-05-07' AS Date), CAST(N'2022-09-07' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP5', N'Mango', N'https://banner2.cleanpng.com/20171202/bfe/mango-png-picture-5a230a345b75b5.1661290515122458123746.jpg', 100, 16, N'CT1', CAST(N'2022-05-07' AS Date), CAST(N'2022-09-07' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP6', N'Grape', N'https://www.kindpng.com/picc/m/42-426088_grape-red-grape-png-transparent-png.png', 100, 47, N'CT3', CAST(N'2022-05-07' AS Date), CAST(N'2022-09-07' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP7', N'Avocado', N'https://toppng.com/uploads/preview/avocado-11526067324c2ctzkvu8d.png', 100, 50, N'CT1', CAST(N'2022-05-07' AS Date), CAST(N'2022-09-07' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP8', N'Berry', N'https://www.nicepng.com/png/detail/238-2389594_mixberry-mix-berry-png.png', 100, 45, N'CT3', CAST(N'2022-05-07' AS Date), CAST(N'2022-09-07' AS Date), N'True')
INSERT [dbo].[tblProduct] ([productID], [productName], [image], [price], [quantity], [categoryID], [importDate], [usingDate], [status]) VALUES (N'SP9', N'Durian', N'https://w7.pngwing.com/pngs/780/30/png-transparent-durian-yellow-fruit-durian-thumbnail.png', 30, 75, N'CT3', CAST(N'2022-10-03' AS Date), CAST(N'2022-02-01' AS Date), N'False')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'RS', N'AK47')
INSERT [dbo].[tblRoles] ([roleID], [roleName]) VALUES (N'US', N'M4A1')
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'bangdase150648@fpt.edu.vn', N'', N'RS', N'', CAST(N'1900-01-01' AS Date), 0, N'bangdase150648@fpt.edu.vn')
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE120', N'123', N'RS', N'ca mau', CAST(N'2000-06-07' AS Date), 646416, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE123', N'123', N'US', N'12/3 duong 456', CAST(N'2001-01-05' AS Date), 123456, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE147', N'123', N'RS', N'58/7 binh thanh', CAST(N'1998-05-03' AS Date), 494646, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE258', N'123', N'RS', N'23/7 long an', CAST(N'2001-05-03' AS Date), 6565654, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE333', N'123', N'RS', N'9/8 thai banh', CAST(N'2001-09-07' AS Date), 2115646, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE359', N'123', N'RS', N'85 thanh dong', CAST(N'1999-10-20' AS Date), 64694984, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE369', N'123', N'RS', N'12 binh chanh', CAST(N'2003-11-03' AS Date), 7979898, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE454', N'123', N'RS', N'27/5 phu an', CAST(N'2001-04-06' AS Date), 2326265, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE456', N'123', N'RS', N'78/5 abc', CAST(N'2001-10-20' AS Date), 96584, N'damanhbangthpt@gmail.com')
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE458', N'123', N'RS', N'2 cu chi', CAST(N'2007-02-03' AS Date), 5131646, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE664', N'123', N'RS', N'8/21 bac giang', CAST(N'1998-05-03' AS Date), 531568, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE699', N'123', N'RS', N'12/8 tan thong hoi', CAST(N'2002-10-12' AS Date), 3313111, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE785', N'123', N'RS', N'binh duong', CAST(N'1982-03-01' AS Date), 161611, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE789', N'123', N'RS', N'58/7 binh thanh', CAST(N'1998-05-03' AS Date), 494646, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE888', N'123', N'RS', N'58/7 tay ninh', CAST(N'1888-10-11' AS Date), 5465313, NULL)
INSERT [dbo].[tblUsers] ([userID], [password], [roleID], [address], [birthday], [phone], [email]) VALUES (N'SE986', N'123', N'RS', N'ap 8 phu hoa', CAST(N'1998-05-03' AS Date), 794649, NULL)
ALTER TABLE [dbo].[tblOrder]  WITH CHECK ADD FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrder] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__tblOrderD__produ__29572725] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProduct] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetail] CHECK CONSTRAINT [FK__tblOrderD__produ__29572725]
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK__tblProduc__categ__1B0907CE] FOREIGN KEY([categoryID])
REFERENCES [dbo].[tblCategory] ([categoryID])
GO
ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK__tblProduc__categ__1B0907CE]
GO
ALTER TABLE [dbo].[tblUsers]  WITH CHECK ADD FOREIGN KEY([roleID])
REFERENCES [dbo].[tblRoles] ([roleID])
GO
USE [master]
GO
ALTER DATABASE [ShoppingManagement] SET  READ_WRITE 
GO
