/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Express Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_ProductStatus]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
ALTER TABLE [dbo].[Products] DROP CONSTRAINT IF EXISTS [FK_Products_ProductCategories]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Employees]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
ALTER TABLE [dbo].[Employees] DROP CONSTRAINT IF EXISTS [FK_Employees_Departments]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT IF EXISTS [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 4/8/2022 2:58:15 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductStatus]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/8/2022 2:58:15 PM ******/
DROP TABLE IF EXISTS [dbo].[Products]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 4/8/2022 2:58:15 PM ******/
DROP TABLE IF EXISTS [dbo].[ProductCategories]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/8/2022 2:58:15 PM ******/
DROP TABLE IF EXISTS [dbo].[Employees]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 4/8/2022 2:58:15 PM ******/
DROP TABLE IF EXISTS [dbo].[Departments]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/8/2022 2:58:15 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/8/2022 2:58:15 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/8/2022 2:58:15 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/8/2022 2:58:15 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/8/2022 2:58:15 PM ******/
DROP TABLE IF EXISTS [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/8/2022 2:58:15 PM ******/
DROP TABLE IF EXISTS [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 4/8/2022 2:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 4/8/2022 2:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 4/8/2022 2:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 4/8/2022 2:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 4/8/2022 2:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 4/8/2022 2:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 4/8/2022 2:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/8/2022 2:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employees]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Employees](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](20) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PositionTitle] [varchar](20) NULL,
	[DirectReportID] [int] NULL,
	[DepartmentID] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 4/8/2022 2:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductCategories](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductCategory] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Products]    Script Date: 4/8/2022 2:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[ProductDescription] [varchar](200) NULL,
	[ProductCategoryID] [int] NOT NULL,
	[ProductStatusID] [int] NOT NULL,
	[Price] [money] NULL,
	[ProductImage] [varchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ProductStatus]    Script Date: 4/8/2022 2:58:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductStatus](
	[ProductStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](20) NULL,
 CONSTRAINT [PK_ProductStatus] PRIMARY KEY CLUSTERED 
(
	[ProductStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'202203082301582_InitialCreate', N'_StoreFront.UI.MVC.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CDB6EE336107D2FD07F10F4D416592B97EE621BD85BA44ED206DD5CB04E167D0B68897684952855A2D20445BFAC0FFDA4FE42871275E345175BB19DA240118BC333C3E10C391C0EF7DFBFFF19FFF8E47BC6238E62372013F360B46F1A98D881E392E5C44CE8E2CD7BF3C70F5F7F353E73FC27E3734E77C4E8A0278927E603A5E1B165C5F603F6513CF25D3B0AE260414776E05BC809ACC3FDFD1FAC83030B038409588631FE9410EAFA38FD013FA701B1714813E45D060EF662FE1D5A6629AA71857C1C87C8C613734683089F4701A1A3BB8BD1E5E7E928EB631A279E8B409E19F616A681080928A220EDF15D8C67143A2C67217C40DEED7388816E81BC18F3511C97E45D07B47FC80664951D73283B8969E0F7043C38E21AB2C4EE2BE9D92C34083A3C035DD36736EA548F13F3C2C1E9A74F81070A10191E4FBD88114FCCCB82C5491C5E613ACA3B8E32C8F308E0FE08A22FA32AE29ED1B9DF5E615187A37DF6DF9E314D3C9A447842704223E4ED1937C9DC73ED5FF1F36DF00593C9D1C17C71F4FEED3BE41CBDFB1E1FBDAD8E14C60A74B50FF0E9260A421C816C78518CDF34AC7A3F4BEC5874ABF4C9B402B604CE611A97E8E923264BFA006E73F8DE34CEDD27ECE45FB871DD11177C093AD128819F5789E7A1B9878B76AB9127FB7F03D7C3B7EF06E17A851EDD653AF5027F709C08FCEA13F6D2D6F8C10D33F7AACDF73D27039FF4D9EFBA7D65ADF7B320896C3698404B728BA225A675E9C65669BC9D4C9A410D6FD639EAEE9B369354366F25291BD02A9E90B3D8B437E4F2BE2CDFCE167712863079A969318D3419DCBD6ECF1A09207B864C5A1AD24157432230C0FFF3BA78E623D71B6061ECC0052293851BF9B818E54F01982122BD65BE41710CEB82F30B8A1F1A44873F07107D86ED2402739D51E4872FCEEDE62120F82AF1E7CC0B36C76BB0A9B9FD23384736F8DD1961BDD6C6FB18D85F82849E11E714517C47ED1C90FDBC75FDEE0083887362DB388ECFC198B1330D20F0CE012F083D3AEC0DC7D6A96D0726530FB9BE3A321156D4FB9CB48C4ED4145284A2215345294DA27E0C962EE9266A4EAA1735A368159593F515958175939453EA054D095AE5CCA8068BFBD2191A3EF04B61773FF25B6FF3D6AD051535A691C9CF98E0089631E706518A2352CE409775631BC1423A7D8CE98BEF4D29A7CFC84B8666B59237A48BC0F0DE90C2EEBE37A462C2E747D761514987E3504E0CF09DE8D527AD769F1324DBB43BD486B969E69B590374EE7212C781EDA65EA04884F134465D7E88E18CF69C46361A312F0203034377D996075F606CA66854D7E4147B9862E3C4CE12855314DBC891D50803727A0896EFA80AC1CAFC485DB8EF249E60E938629D103B04C5E0A92EA1B25BB8C47643E4B56A49E8D9710B63632F78882DA738C484316CD54417E6EA740813A0E0234C4A9B86C656C5E29A0D5113B5EAE6BC2D842DE75DCA526CC4265B62678D5DF2F8ED450CB359631B30CE66957411409BDADB8681F2B34A5703100F2EBB66A0C2894963A03CA4DA8881D635B60503ADABE4D519687644ED3AFFC27975D7CCB37E50DEFCB6DEA8AE2DD8664D1F3B669A59EC097D28F4C0916C9EA773D6889FA8E2700672F2F359CC435DD14418F80CD37ACAA68C779571A8D50C221A51136069682DA0FC525002921CAA8770792EAF513A1E45F480CDF36E8DB07CED17602B362063572F472B84FA2B54D1383B9D3E8A9115D6201979A7C34205476110E2E2551F7807A5E8F2B2B262BAC4C27DA2E1CAC0F8643428A82572D528291FCCE05ACA4DB35D4BAA80AC4F48B6969684F049A3A57C30836B89DB68BB921441418FB0602D15D5B7F0819C2DCF7414BB4DD136B6B2CA29FE616C694AACC697280C5DB2AC945CF12FC62CABB79ABE99F52F41F2330CCB8E15954885B405271A4468898556600D929EBB514C4F114573C4F23C53C797C8947BAB66F9CF5956B74F7912F37D20A7667FF39B55DD4D7E6DC79543128E740EE3F4595C93E228AC40DDDD608570C84391227F3F0DBCC427FA304BDF3BBBC5ABF6CFBEC808634B905F0AA3249D49C16E7D023A4D8FEC1A834E5511CBAC3E5D7A089DD2F348B4AA765D74AA47C9935555145D026B6BD3A70B6A569832316AEC3F63AD082FE363BC54A50AC03FF5C4A8543B486095B6EEA8F582942A66BDA53BA250755285149A7A4859AD2DA909596D58094FA3513545770E723549155D6EED8EACA82BA9422B9A57C056C82CB6754755949E548115CDDDB1CB3A147129DDE15D4C7B9659731BCB0EBDEBED631A8C97591787D9062B77FB55A0CAE79E58FCF65E02E3DF77D2A6B427BF356D2ACB78AC67531A0CFD2A54BB1BAF2F428D17FA7ACCDA85776DA16FBAF0D7E3F5B3DC17B50FE9F8279214DC8B63A070DC1BF3A357FBB31BE92C96919846AE46B0AAE798627FC40846B3DFBDA9E762B6A4E7049788B80B1CD3ACC8C33CDC3F3814DEECECCEFB192B8E1D4F7174D53DA2A9CFD906EAB5C8238AEC0714C9D5136BBC312941A5C4F40571F0D3C4FC33ED759CE638D85FE9E73DE322BE23EEEF0934DC460936FE92AB4187A9B9EFF0CAA310F4AF57F17CA2BBCA2F7EBBCFBAEE19D711B8D3B1B12F287A95E9AF3FAAE8254DD6750D69567E6AF17ABDADF67241892A78CBEA0F15E62E1DE491422EE5373E7AFAB6AF68CA87086B212A1E1B0C8537880A758F0956C1D23E2470E0274D1F12F41BACFA61C12AA2691F15B8A43F98F8A4A0FB3294F7DCE23EA438366D62494AF5DC5A92BD567DE6B6F726A9727B2D4797ABB37BC00D5A81BD5E88F2CA2A9B07DB3A1585CB83616FD3EE5FBC5A79570A94CBA07DBB75C99B2C456EB862FA5F5520EF40CD9CA20668FB75C69BB6355D1E78C78B35FB5513EF98B1F16D7EFB35C39B36365D8278C78DAD5765F08ED9DAB6F6CF2D5B5AE72D74EB75BE72C992E63E4795456EABE3CD52EE70FC9F0760045944993DBF54178E3515BDB6302C49F44CF5156B2263C97124BE124533DB7E63E51B7EE360394D335B4D9D67136FBEFE37F2E634CDBC35D593DBA84056D62FAAAAC25BD6B1A682AAD754715C1B494B817B5BCCDA7839FF9A0A8C07514ACD7B34B7CBAFA79E7810950CE93A3DEA87E58B62D83B2BFF8A23ECDFB1BB2C21D8BFE948B05DDB350B9A0BB208F2CD5B90282711323497982207B6D49388BA0B6453686609E8F4FD789AD463D72073EC5C90EB8486098521637FEED5125E2C0868E29F1649D7651E5F87EC573CC410404C9725EEAFC94F89EB3985DCE78A9C90068245173CDDCBE692B2B4EFF2B940BA0A484720AEBE2228BAC57EE801587C4D66E811AF221B98DF47BC44F6739901D481B44F445DEDE353172D23E4C71CA3EC0F3FC1861DFFE9C37F17AC05F3CC540000, N'6.2.0-61023')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'199ab8d2-4333-408b-8af8-5275e7ca283b', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'7a0d908a-93e0-4535-859a-89050a5eea5c', N'User')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'42426949-0192-43ad-952d-b5eec7fd58d2', N'199ab8d2-4333-408b-8af8-5275e7ca283b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c26a8d43-b414-446a-9e73-452c6b53c6f4', N'199ab8d2-4333-408b-8af8-5275e7ca283b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f36a785d-3f10-444a-9eed-8bc4a7b272dc', N'199ab8d2-4333-408b-8af8-5275e7ca283b')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2ca7268b-22b2-44ae-ba35-61ac6f33c566', N'7a0d908a-93e0-4535-859a-89050a5eea5c')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'2ca7268b-22b2-44ae-ba35-61ac6f33c566', N'user@mvc2.com', 0, N'AOqZQRIPmjzv/DKMkl/a6DcZKJV6eTxmQUThswCXsazBVpSKEWnJg4EBsGrTuF0L5w==', N'8175c405-6832-4ca6-88b8-8ee4caa4eee1', NULL, 0, 0, NULL, 1, 0, N'user@mvc2.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'42426949-0192-43ad-952d-b5eec7fd58d2', N'zakarysisler@outlook.com', 0, N'AO3cNBZNF8lgEKyCp2C/TyJwe95CCl/AvJxg1FzbEjpQWdOSOIAG9BdgPimuVTNYfQ==', N'5a7265cb-d8f8-4412-98b6-20d90bda39e2', NULL, 0, 0, NULL, 1, 0, N'zakarysisler@outlook.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'c26a8d43-b414-446a-9e73-452c6b53c6f4', N'admin@mvc2.com', 1, N'AMBVLz+TBV74/FpDtGdgUFqlwcDzXjrneGHmpP+pgDVpsk1wA6BfKTYUiNLW3JSW6g==', N'd7d7f4fb-f78d-4b58-aac4-c161774f92fb', NULL, 0, 0, NULL, 1, 0, N'admin@mvc2.com')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'f36a785d-3f10-444a-9eed-8bc4a7b272dc', N'admin@example.com', 1, N'AEz+MLShcBpgYnYA5P+yticuGhWrJifqvm82Gq5W2kOWTYLQz2hWRfvnLRpmAydp7g==', N'8b8ea83c-3a93-4866-98d0-605c7b3d3c30', NULL, 0, 0, NULL, 1, 0, N'admin@example.com')
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (1, N'Sales')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (2, N'Management')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (3, N'I.T.')
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName]) VALUES (4, N'Shipping')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PositionTitle], [DirectReportID], [DepartmentID]) VALUES (1, N'John', N'Smith', N'CEO', NULL, 2)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PositionTitle], [DirectReportID], [DepartmentID]) VALUES (2, N'Jane', N'Doe', N'Sales Manager', 1, 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PositionTitle], [DirectReportID], [DepartmentID]) VALUES (3, N'Jack', N'Johnson', N'Sales Rep', 2, 1)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PositionTitle], [DirectReportID], [DepartmentID]) VALUES (4, N'Jim', N'Bob', N'I.T. Manager', 1, 3)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PositionTitle], [DirectReportID], [DepartmentID]) VALUES (5, N'Joe', N'Dirt', N'Shipping Manager', 1, 4)
INSERT [dbo].[Employees] ([EmployeeID], [FirstName], [LastName], [PositionTitle], [DirectReportID], [DepartmentID]) VALUES (6, N'Zak', N'Sisler', N'Lead Janitor', 1, 2)
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[ProductCategories] ON 

INSERT [dbo].[ProductCategories] ([ProductCategoryID], [ProductCategory]) VALUES (1, N'Sets')
INSERT [dbo].[ProductCategories] ([ProductCategoryID], [ProductCategory]) VALUES (2, N'Pieces')
INSERT [dbo].[ProductCategories] ([ProductCategoryID], [ProductCategory]) VALUES (3, N'Boards')
INSERT [dbo].[ProductCategories] ([ProductCategoryID], [ProductCategory]) VALUES (4, N'Cases')
INSERT [dbo].[ProductCategories] ([ProductCategoryID], [ProductCategory]) VALUES (5, N'Lessons')
INSERT [dbo].[ProductCategories] ([ProductCategoryID], [ProductCategory]) VALUES (6, N'Membership')
INSERT [dbo].[ProductCategories] ([ProductCategoryID], [ProductCategory]) VALUES (7, N'Books')
SET IDENTITY_INSERT [dbo].[ProductCategories] OFF
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (1, N'Starter Chess Board', N'Simple chess board', 3, 1, 20.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (3, N'Blue Glass Set', N'Blue and clear set', 1, 2, 18.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (4, N'Premium Chess Case', N'A velvet laden chess case', 4, 3, 35.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (5, N'Fancy Uber Luxury Set', N'Bourgeoisie approved chess set', 1, 4, 80.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (6, N'Gold & Silver Chess Set', N'Gold and Silver Chess Set', 1, 2, 45.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (7, N'Metal Chess Pieces', N'Metal chess pieces', 2, 1, 2.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (10, N'Stone Chess Pieces', N'Stone chess pieces', 2, 3, 4.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (11, N'Glass Chess Pieces', N'Glass chess pieces', 2, 1, 1.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (12, N'Wood Chess Pieces', N'Wood chess pieces', 2, 3, 2.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (13, N'Beginner Chess Lesson', N'Fundamentals of chess', 5, 1, 75.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (14, N'Intermediate Chess Lessons', N'Intermediate chess lessons', 5, 1, 85.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (15, N'Expert Chess Lessons', N'Expert chess lessons', 5, 1, 95.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (16, N'Grandmaster Chess Lessons', N'Grandmaster chess lessons', 5, 1, 100.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (17, N'Chess Tutoring', N'Individual chess tutoring', 5, 1, 25.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (19, N'Chess Timer', N'Standard chess timer', 2, 1, 30.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (20, N'Chess Book Collection', N'A teaching series', 7, 4, 60.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (22, N'Chess Club Membership', N'Membership fee', 6, 1, 35.0000, NULL)
INSERT [dbo].[Products] ([ProductID], [ProductName], [ProductDescription], [ProductCategoryID], [ProductStatusID], [Price], [ProductImage]) VALUES (23, N'Master Laozi Chess Book', N'Grandmaster chess book', 7, 3, 45.0000, NULL)
SET IDENTITY_INSERT [dbo].[Products] OFF
SET IDENTITY_INSERT [dbo].[ProductStatus] ON 

INSERT [dbo].[ProductStatus] ([ProductStatusID], [StatusName]) VALUES (1, N'In Stock')
INSERT [dbo].[ProductStatus] ([ProductStatusID], [StatusName]) VALUES (2, N'Out of Stock')
INSERT [dbo].[ProductStatus] ([ProductStatusID], [StatusName]) VALUES (3, N'Backordered')
INSERT [dbo].[ProductStatus] ([ProductStatusID], [StatusName]) VALUES (4, N'Discontinued')
SET IDENTITY_INSERT [dbo].[ProductStatus] OFF
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Departments]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([DirectReportID])
REFERENCES [dbo].[Employees] ([EmployeeID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Employees_Employees]') AND parent_object_id = OBJECT_ID(N'[dbo].[Employees]'))
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductCategories] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategories] ([ProductCategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductCategories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductStatus] FOREIGN KEY([ProductStatusID])
REFERENCES [dbo].[ProductStatus] ([ProductStatusID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Products_ProductStatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Products]'))
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductStatus]
GO
