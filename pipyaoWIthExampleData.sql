USE [master]
GO
/****** Object:  Database [WSDB]    Script Date: 04.02.2025 18:16:14 ******/
CREATE DATABASE [WSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WSDB', FILENAME = N'C:\Users\Admin\WSDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WSDB_log', FILENAME = N'C:\Users\Admin\WSDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [WSDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WSDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WSDB] SET  MULTI_USER 
GO
ALTER DATABASE [WSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WSDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WSDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WSDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WSDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [WSDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [WSDB]
GO
/****** Object:  Table [dbo].[DepartmentLevel1]    Script Date: 04.02.2025 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentLevel1](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_DepartmentLevel1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentLevel2]    Script Date: 04.02.2025 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentLevel2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_DepartmentLevel2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentLevel3]    Script Date: 04.02.2025 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentLevel3](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_DepartmentLevel3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 04.02.2025 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](150) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Patronym] [nvarchar](150) NOT NULL,
	[Birthdate] [date] NOT NULL,
	[WorkPhone] [nvarchar](50) NOT NULL,
	[Room] [nvarchar](50) NOT NULL,
	[WorkEmail] [nvarchar](150) NOT NULL,
	[OrganisationId] [int] NULL,
	[DepartmentLevel1Id] [int] NULL,
	[DepartmentLevel2Id] [int] NULL,
	[DepartmentLevel3Id] [int] NULL,
	[RoleId] [int] NOT NULL,
	[ManagerId] [int] NULL,
	[AssistantId] [int] NULL,
	[Info] [nvarchar](500) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Events]    Script Date: 04.02.2025 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[EventDate] [date] NULL,
	[EventTime] [time](7) NULL,
	[EmployeeId] [int] NULL,
	[Description] [nvarchar](250) NULL,
 CONSTRAINT [PK_Events] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organisation]    Script Date: 04.02.2025 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organisation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Organisation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 04.02.2025 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrainingMaterials]    Script Date: 04.02.2025 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrainingMaterials](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TrainingId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ApproveDate] [date] NULL,
	[EditDate] [date] NULL,
	[Status] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[Area] [nvarchar](50) NULL,
	[Author] [nvarchar](50) NULL,
 CONSTRAINT [PK_TrainingMaterials] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Trainings]    Script Date: 04.02.2025 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainings](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[EmployeeId] [int] NOT NULL,
 CONSTRAINT [PK_Trainings] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VacationCalendar]    Script Date: 04.02.2025 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VacationCalendar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
 CONSTRAINT [PK_VacationCalendar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VacationTypes]    Script Date: 04.02.2025 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VacationTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_VacationTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkingCalendar]    Script Date: 04.02.2025 18:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkingCalendar](
	[Id] [bigint] NOT NULL,
	[ExceptionDate] [date] NOT NULL,
	[IsWorkingDay] [bit] NOT NULL,
 CONSTRAINT [WorkingCalendar_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DepartmentLevel1] ON 

INSERT [dbo].[DepartmentLevel1] ([Id], [Name]) VALUES (1, N'Административный департамент')
INSERT [dbo].[DepartmentLevel1] ([Id], [Name]) VALUES (2, N'Академия Умные дороги')
INSERT [dbo].[DepartmentLevel1] ([Id], [Name]) VALUES (3, N'Аппарат управления')
INSERT [dbo].[DepartmentLevel1] ([Id], [Name]) VALUES (4, N'Департамент коммуникаций')
INSERT [dbo].[DepartmentLevel1] ([Id], [Name]) VALUES (5, N'Департамент маркетинга и партнерских отношений')
INSERT [dbo].[DepartmentLevel1] ([Id], [Name]) VALUES (6, N'Департамент по организации корпоративов')
INSERT [dbo].[DepartmentLevel1] ([Id], [Name]) VALUES (7, N'Департамент по работе с персоналом')
INSERT [dbo].[DepartmentLevel1] ([Id], [Name]) VALUES (8, N'Департамент по работе с промышленностью')
INSERT [dbo].[DepartmentLevel1] ([Id], [Name]) VALUES (9, N'Департамент стратегии и планирования')
INSERT [dbo].[DepartmentLevel1] ([Id], [Name]) VALUES (10, N'Управление Финансового планирования и контроля')
INSERT [dbo].[DepartmentLevel1] ([Id], [Name]) VALUES (11, N'Финансово-экономический департамент')
INSERT [dbo].[DepartmentLevel1] ([Id], [Name]) VALUES (12, N'Юридический департамент')
SET IDENTITY_INSERT [dbo].[DepartmentLevel1] OFF
GO
SET IDENTITY_INSERT [dbo].[DepartmentLevel2] ON 

INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (1, N'Административный департамент')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (2, N'Академия Умные дороги')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (3, N'Аналитический отдел')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (4, N'Департамент коммуникаций')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (5, N'Департамент маркетинга и партнерских отношений')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (6, N'Договорной отдел')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (7, N'Общий отдел')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (8, N'Отдел закупок')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (9, N'Отдел проектного управления')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (10, N'Отдел протокольного сопровождения')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (11, N'Отдел сетевых программ')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (12, N'Проектно-аналитический отдел')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (13, N'Управление административно-хозяйственной деятельности')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (14, N'Управление безопасности')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (15, N'Управление бухгалтерского и налогового учета')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (16, N'Управление казначейства')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (17, N'Управление маркетинга')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (18, N'Управление нормативного обеспечения и договорной работы')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (19, N'Управление по PR-проектам')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (20, N'Управление по обеспечению безопасности')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (21, N'Управление по развитию бизнеса')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (22, N'Управление по развитию партнерских отношений')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (23, N'Управление Пресс-службы')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (24, N'Учебно-организационный отдел')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (25, N'Финансово-экономический департамент')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (26, N'Финансово-экономическое управление')
INSERT [dbo].[DepartmentLevel2] ([Id], [Name]) VALUES (27, N'Юридический департамент')
SET IDENTITY_INSERT [dbo].[DepartmentLevel2] OFF
GO
SET IDENTITY_INSERT [dbo].[DepartmentLevel3] ON 

INSERT [dbo].[DepartmentLevel3] ([Id], [Name]) VALUES (1, N'Лицензионный отдел')
INSERT [dbo].[DepartmentLevel3] ([Id], [Name]) VALUES (2, N'Операционный отдел')
INSERT [dbo].[DepartmentLevel3] ([Id], [Name]) VALUES (3, N'Отдел ИТ')
INSERT [dbo].[DepartmentLevel3] ([Id], [Name]) VALUES (4, N'Отдел по организации и сопровождению мероприятий')
INSERT [dbo].[DepartmentLevel3] ([Id], [Name]) VALUES (5, N'Отдел по организации мероприятий')
INSERT [dbo].[DepartmentLevel3] ([Id], [Name]) VALUES (6, N'Отдел по привлечению новых клиентов')
INSERT [dbo].[DepartmentLevel3] ([Id], [Name]) VALUES (7, N'Отдел по работе с корпорациями')
INSERT [dbo].[DepartmentLevel3] ([Id], [Name]) VALUES (8, N'Отдел по работе со СМИ')
INSERT [dbo].[DepartmentLevel3] ([Id], [Name]) VALUES (9, N'Отдел цифровых коммуникаций')
INSERT [dbo].[DepartmentLevel3] ([Id], [Name]) VALUES (10, N'Управление административно-хозяйственной деятельности')
INSERT [dbo].[DepartmentLevel3] ([Id], [Name]) VALUES (11, N'Управление маркетинга')
INSERT [dbo].[DepartmentLevel3] ([Id], [Name]) VALUES (12, N'Управление Пресс-службы')
SET IDENTITY_INSERT [dbo].[DepartmentLevel3] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (1, N'Белоусов', N'Семен', N'Агафонович', CAST(N'1971-04-25' AS Date), N'+7 (179) 370-26-88', N'402А', N'белоусов@гкдр.ру', 1, 1, 1, NULL, 1, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (2, N'Матвеев', N'Вадим', N'Юрьевич', CAST(N'1989-06-20' AS Date), N'+7 (711) 977-16-52', N'402А', N'матвеев@гкдр.ру', 1, 1, 1, NULL, 29, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (3, N'Ермакова', N'Юнона', N'Руслановна', CAST(N'1979-04-14' AS Date), N'+7 (210) 088-64-36', N'482', N'ермакова@гкдр.ру', 1, 1, 6, NULL, 22, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (4, N'Евсеева', N'Генриетта', N'Дмитриевна', CAST(N'1967-05-18' AS Date), N'+7 (904) 027-35-92', N'482', N'евсеева@гкдр.ру', 1, 1, 6, NULL, 44, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (5, N'Шарапова', N'Дария', N'Андреевна', CAST(N'1971-08-21' AS Date), N'+7 (212) 625-28-08', N'482', N'шарапова@гкдр.ру', 1, 1, 6, NULL, 44, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (6, N'Кузьмина', N'Галина', N'Максовна', CAST(N'1969-01-15' AS Date), N'+7 (370) 519-03-10', N'479', N'кузьмина@гкдр.ру', 1, 1, 7, NULL, 22, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (7, N'Гурьева', N'Янина', N'Тимофеевна', CAST(N'1964-12-29' AS Date), N'+7 (401) 189-86-51', N'479', N'гурьева@гкдр.ру', 1, 1, 7, NULL, 31, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (8, N'Большакова', N'Снежана', N'Тарасовна', CAST(N'1984-05-23' AS Date), N'+7 (223) 503-67-44', N'479', N'большакова@гкдр.ру', 1, 1, 7, NULL, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (9, N'Миронова', N'Диша', N'Митрофановна', CAST(N'1977-12-15' AS Date), N'+7 (084) 252-77-53', N'479', N'миронова@гкдр.ру', 1, 1, 7, NULL, 44, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (10, N'Жданова', N'Виоланта', N'Иосифовна', CAST(N'1996-05-13' AS Date), N'+7 (900) 353-41-72', N'479', N'жданова@гкдр.ру', 1, 1, 7, NULL, 44, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (11, N'Колесников', N'Анатолий', N'Владленович', CAST(N'1990-02-26' AS Date), N'+7 (438) 363-52-14', N'482', N'колесников@гкдр.ру', 1, 1, 8, NULL, 22, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (12, N'Мухин', N'Флор', N'Иванович', CAST(N'1975-10-31' AS Date), N'+7 (487) 123-91-17', N'482', N'мухин@гкдр.ру', 1, 1, 8, NULL, 44, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (13, N'Воронова', N'Устинья', N'Митрофановна', CAST(N'1999-08-07' AS Date), N'+7 (708) 393-49-39', N'483', N'воронова@гкдр.ру', 1, 1, 10, NULL, 21, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (14, N'Ковалёва', N'Муза', N'Тарасовна', CAST(N'1964-01-26' AS Date), N'+7 (624) 457-34-25', N'483', N'ковалёва@гкдр.ру', 1, 1, 10, NULL, 22, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (15, N'Крылов', N'Флор', N'Максович', CAST(N'1996-10-07' AS Date), N'+7 (902) 340-55-48', N'483', N'крылов@гкдр.ру', 1, 1, 13, 3, 22, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (16, N'Зимин', N'Илья', N'Серапионович', CAST(N'1971-05-02' AS Date), N'+7 (565) 435-79-80', N'483', N'зимин@гкдр.ру', 1, 1, 13, 3, 44, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (17, N'Зайцев', N'Парамон', N'Феликсович', CAST(N'1984-10-15' AS Date), N'+7 (454) 252-05-25', N'525', N'зайцев@гкдр.ру', 1, 1, 13, 10, 5, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (18, N'Маслов', N'Модест', N'Дамирович', CAST(N'1968-04-27' AS Date), N'+7 (664) 602-03-71', N'525', N'маслов@гкдр.ру', 1, 1, 13, 10, 7, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (19, N'Исаков', N'Велорий', N'Витальевич', CAST(N'1960-06-26' AS Date), N'+7 (098) 359-34-95', N'525', N'исаков@гкдр.ру', 1, 1, 13, 10, 7, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (20, N'Шашков', N'Донат', N'Владленович', CAST(N'1980-01-08' AS Date), N'+7 (051) 523-43-73', N'525', N'шашков@гкдр.ру', 1, 1, 13, 10, 7, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (21, N'Тарасов', N'Эрнест', N'Якунович', CAST(N'1988-06-22' AS Date), N'+7 (131) 790-43-24', N'525', N'тарасов@гкдр.ру', 1, 1, 13, 10, 20, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (22, N'Зимин', N'Лев', N'Евсеевич', CAST(N'1998-09-25' AS Date), N'+7 (609) 728-78-87', N'525', N'зимин@гкдр.ру', 1, 1, 13, 10, 23, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (23, N'Суханов', N'Эрнест', N'Петрович', CAST(N'1966-04-23' AS Date), N'+7 (342) 350-52-75', N'525', N'суханов@гкдр.ру', 1, 1, 13, 10, 34, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (24, N'Харитонов', N'Любомир', N'Андреевич', CAST(N'2001-05-29' AS Date), N'+7 (933) 010-23-01', N'525', N'харитонов@гкдр.ру', 1, 1, 13, 10, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (25, N'Евдокимов', N'Павел', N'Пётрович', CAST(N'1997-01-20' AS Date), N'+7 (676) 507-65-30', N'525', N'евдокимов@гкдр.ру', 1, 1, 13, 10, 41, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (26, N'Кулагин', N'Аввакум', N'Альбертович', CAST(N'1983-04-25' AS Date), N'+7 (091) 411-45-67', N'489', N'кулагин@гкдр.ру', 1, 1, 14, NULL, 23, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (27, N'Рогов', N'Май', N'Филатович', CAST(N'1967-04-06' AS Date), N'+7 (046) 142-05-62', N'489', N'рогов@гкдр.ру', 1, 1, 14, NULL, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (28, N'Фролов', N'Мартин', N'Константинович', CAST(N'2002-08-07' AS Date), N'+7 (604) 952-64-10', N'527', N'фролов@гкдр.ру', 1, 1, 20, NULL, 23, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (29, N'Копылов', N'Власий', N'Валентинович', CAST(N'2000-07-03' AS Date), N'+7 (710) 970-74-65', N'527', N'копылов@гкдр.ру', 1, 1, 20, NULL, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (30, N'Воронцов', N'Мстислав', N'Лаврентьевич', CAST(N'1968-04-08' AS Date), N'+7 (154) 776-83-19', N'527', N'воронцов@гкдр.ру', 1, 1, 20, NULL, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (31, N'Стрелков', N'Аркадий', N'Никитевич', CAST(N'1990-06-02' AS Date), N'+7 (938) 736-81-71', N'527', N'стрелков@гкдр.ру', 1, 1, 20, NULL, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (32, N'Кононов', N'Август', N'Германнович', CAST(N'1968-04-29' AS Date), N'+7 (812) 849-39-84', N'527', N'кононов@гкдр.ру', 1, 1, 20, NULL, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (33, N'Горбачёв', N'Глеб', N'Мэлсович', CAST(N'1974-11-07' AS Date), N'+7 (626) 861-82-67', N'527', N'горбачёв@гкдр.ру', 1, 1, 20, NULL, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (34, N'Беляев', N'Тарас', N'Владленович', CAST(N'2001-07-15' AS Date), N'+7 (909) 176-65-42', N'527', N'беляев@гкдр.ру', 1, 1, 20, NULL, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (35, N'Селезнёва', N'Мэри', N'Фроловна', CAST(N'2002-12-22' AS Date), N'+7 (956) 710-49-22', N'477', N'селезнёва@гкдр.ру', 1, 2, 2, NULL, 10, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (36, N'Филиппова', N'Аза', N'Николаевна', CAST(N'1989-05-23' AS Date), N'+7 (163) 312-43-14', N'477', N'филиппова@гкдр.ру', 1, 2, 2, NULL, 18, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (37, N'Галкина', N'Эрика', N'Лукьяновна', CAST(N'1969-11-26' AS Date), N'+7 (567) 060-46-69', N'404', N'галкина@гкдр.ру', 1, 2, 11, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (38, N'Лихачёва', N'Динара', N'Георгьевна', CAST(N'1990-12-04' AS Date), N'+7 (624) 064-06-24', N'404', N'лихачёва@гкдр.ру', 1, 2, 11, NULL, 22, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (39, N'Лобанова', N'Дебора', N'Владимировна', CAST(N'1970-06-25' AS Date), N'+7 (318) 827-54-60', N'404', N'лобанова@гкдр.ру', 1, 2, 11, NULL, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (40, N'Коновалова', N'Карина', N'Анатольевна', CAST(N'1982-07-25' AS Date), N'+7 (800) 239-60-38', N'404', N'коновалова@гкдр.ру', 1, 2, 11, NULL, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (41, N'Дьячков', N'Гордей', N'Юрьевич', CAST(N'1992-12-10' AS Date), N'+7 (462) 807-37-94', N'415', N'дьячков@гкдр.ру', 1, 2, 12, NULL, 5, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (42, N'Дементьев', N'Людвиг', N'Дмитриевич', CAST(N'1984-10-30' AS Date), N'+7 (232) 050-93-59', N'415', N'дементьев@гкдр.ру', 1, 2, 12, NULL, 9, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (43, N'Тетерин', N'Терентий', N'Артёмович', CAST(N'1979-03-25' AS Date), N'+7 (855) 470-76-70', N'415', N'тетерин@гкдр.ру', 1, 2, 12, NULL, 22, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (44, N'Шарапов', N'Нинель', N'Артемович', CAST(N'2001-05-29' AS Date), N'+7 (064) 865-03-57', N'415', N'шарапов@гкдр.ру', 1, 2, 12, NULL, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (45, N'Быкова', N'Роксалана', N'Евгеньевна', CAST(N'1995-05-10' AS Date), N'+7 (640) 077-77-65', N'479', N'быкова@гкдр.ру', 1, 2, 24, NULL, 6, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (46, N'Карпова', N'Берта', N'Васильевна', CAST(N'1989-01-26' AS Date), N'+7 (424) 549-00-75', N'479', N'карпова@гкдр.ру', 1, 2, 24, NULL, 22, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (47, N'Князева', N'Эрида', N'Михайловна', CAST(N'1985-02-09' AS Date), N'+7 (476) 265-08-34', N'479', N'князева@гкдр.ру', 1, 2, 24, NULL, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (48, N'Боброва', N'Анэля', N'Григорьевна', CAST(N'1961-07-19' AS Date), N'+7 (197) 497-66-92', N'479', N'боброва@гкдр.ру', 1, 2, 24, NULL, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (49, N'Ефремов', N'Вальтер', N'Платонович', CAST(N'1999-03-12' AS Date), N'+7 (210) 001-40-01', N'Ресепшн', N'ефремов@гкдр.ру', 1, 3, NULL, NULL, 8, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (50, N'Смирнов', N'Аввакум', N'Проклович', CAST(N'2001-04-07' AS Date), N'+7 (234) 327-27-37', N'406А', N'смирнов@гкдр.ру', 1, 3, NULL, NULL, 12, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (51, N'Сидорова', N'Богдана', N'Степановна', CAST(N'1992-03-01' AS Date), N'+7 (333) 007-73-86', N'406А', N'сидорова@гкдр.ру', 1, 3, NULL, NULL, 13, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (52, N'Медведева', N'Анфиса', N'Куприяновна', CAST(N'1968-06-22' AS Date), N'+7 (352) 984-89-47', N'406А', N'медведева@гкдр.ру', 1, 3, NULL, NULL, 14, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (53, N'Соколова', N'Злата', N'Донатовна', CAST(N'1976-05-11' AS Date), N'+7 (263) 295-98-84', N'406А', N'соколова@гкдр.ру', 1, 3, NULL, NULL, 15, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (54, N'Максимова', N'Антонина', N'Наумовна', CAST(N'1988-09-29' AS Date), N'+7 (059) 049-11-97', N'406А', N'максимова@гкдр.ру', 1, 3, NULL, NULL, 16, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (55, N'Емельянова', N'Лали', N'Адольфовна', CAST(N'1974-11-18' AS Date), N'+7 (643) 148-48-83', N'406А', N'емельянова@гкдр.ру', 1, 3, NULL, NULL, 17, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (56, N'Лобанов', N'Андрей', N'Владленович', CAST(N'1985-05-13' AS Date), N'+7 (749) 358-03-33', N'406А', N'лобанов@гкдр.ру', 1, 3, NULL, NULL, 26, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (57, N'Бирюков', N'Валерий', N'Леонидович', CAST(N'1977-08-20' AS Date), N'+7 (882) 562-21-24', N'Ресепшн', N'бирюков@гкдр.ру', 1, 3, NULL, NULL, 27, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (58, N'Рябов', N'Влас', N'Богданович', CAST(N'1978-04-07' AS Date), N'+7 (673) 157-65-87', N'406А', N'рябов@гкдр.ру', 1, 3, NULL, NULL, 37, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (59, N'Мельников', N'Модест', N'Тихонович', CAST(N'1961-04-14' AS Date), N'+7 (480) 955-36-17', N'406А', N'мельников@гкдр.ру', 1, 3, NULL, NULL, 36, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (60, N'Никифорова', N'Любава', N'Васильевна', CAST(N'1967-02-21' AS Date), N'+7 (890) 112-51-51', N'406', N'никифорова@гкдр.ру', 1, 4, 4, NULL, 19, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (61, N'Денисова', N'Веселина', N'Демьяновна', CAST(N'1965-01-19' AS Date), N'+7 (606) 810-72-96', N'489А', N'денисова@гкдр.ру', 1, 4, 19, 4, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (62, N'Лобанова', N'Георгина', N'Евсеевна', CAST(N'1972-03-02' AS Date), N'+7 (760) 683-71-57', N'406', N'лобанова@гкдр.ру', 1, 4, 19, 7, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (63, N'Калашникова', N'Маргарита', N'Адольфовна', CAST(N'1977-03-25' AS Date), N'+7 (567) 984-10-59', N'404', N'калашникова@гкдр.ру', 1, 4, 23, 8, 22, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (64, N'Корнилов', N'Давид', N'Михайлович', CAST(N'1965-05-12' AS Date), N'+7 (535) 508-09-63', N'404', N'корнилов@гкдр.ру', 1, 4, 23, 8, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (65, N'Мишина', N'Сабрина', N'Всеволодовна', CAST(N'1979-11-05' AS Date), N'+7 (123) 099-67-67', N'489А', N'мишина@гкдр.ру', 1, 4, 23, 9, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (66, N'Давыдова', N'Крис', N'Алексеевна', CAST(N'1967-05-21' AS Date), N'+7 (086) 732-87-28', N'489А', N'давыдова@гкдр.ру', 1, 4, 23, 9, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (67, N'Тетерина', N'Сабрина', N'Евсеевна', CAST(N'1983-10-30' AS Date), N'+7 (305) 078-20-93', N'489А', N'тетерина@гкдр.ру', 1, 4, 23, 9, 42, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (68, N'Мишина', N'Зоряна', N'Семёновна', CAST(N'1980-05-17' AS Date), N'+7 (941) 758-60-21', N'489А', N'мишина@гкдр.ру', 1, 4, 23, 12, 35, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (69, N'Филиппова', N'Ирэн', N'Рудольфовна', CAST(N'2002-04-03' AS Date), N'+7 (791) 893-63-24', N'406', N'филиппова@гкдр.ру', 1, 5, 5, NULL, 19, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (70, N'Сорокина', N'Виктория', N'Альбертовна', CAST(N'1965-06-27' AS Date), N'+7 (256) 543-71-97', N'489А', N'сорокина@гкдр.ру', 1, 5, 17, 1, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (71, N'Фролова', N'Эрида', N'Юлиановна', CAST(N'1964-12-24' AS Date), N'+7 (382) 787-58-02', N'489А', N'фролова@гкдр.ру', 1, 5, 17, 11, 32, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (72, N'Дементьева', N'Дарьяна', N'Пантелеймоновна', CAST(N'1977-08-06' AS Date), N'+7 (772) 653-55-16', N'410Б', N'дементьева@гкдр.ру', 1, 5, 21, 6, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (73, N'Денисова', N'Эдилия', N'Святославовна', CAST(N'1983-07-29' AS Date), N'+7 (661) 640-32-15', N'410Б', N'денисова@гкдр.ру', 1, 5, 21, 6, 33, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (74, N'Борисова', N'Варвара', N'Богуславовна', CAST(N'1988-10-25' AS Date), N'+7 (625) 163-29-48', N'410Б', N'борисова@гкдр.ру', 1, 5, 21, 6, 34, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (75, N'Сафонова', N'Алина', N'Михайловна', CAST(N'1993-07-15' AS Date), N'+7 (949) 247-53-70', N'402Б', N'сафонова@гкдр.ру', 1, 5, 21, 5, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (76, N'Моисеев', N'Павел', N'Витальевич', CAST(N'1990-03-29' AS Date), N'+7 (395) 842-89-60', N'411', N'моисеев@гкдр.ру', 1, 5, 22, NULL, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (77, N'Денисова', N'Альжбета', N'Валерьевна', CAST(N'1967-06-29' AS Date), N'+7 (405) 652-62-30', N'411', N'денисова@гкдр.ру', 1, 5, 22, NULL, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (78, N'Калинина', N'Лариса', N'Улебовна', CAST(N'1975-04-14' AS Date), N'+7 (459) 094-61-74', N'402Б', N'калинина@гкдр.ру', 1, 6, NULL, NULL, 21, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (79, N'Громова', N'Роксалана', N'Егоровна', CAST(N'1961-03-17' AS Date), N'+7 (790) 385-88-79', N'402Б', N'громова@гкдр.ру', 1, 6, NULL, NULL, 34, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (80, N'Авдеева', N'Лика', N'Лаврентьевна', CAST(N'1969-10-15' AS Date), N'+7 (905) 571-85-23', N'402Б', N'авдеева@гкдр.ру', 1, 6, NULL, NULL, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (81, N'Фадеева', N'Юлиана', N'Святославовна', CAST(N'1966-02-22' AS Date), N'+7 (325) 978-22-94', N'401', N'фадеева@гкдр.ру', 1, 7, NULL, NULL, 9, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (82, N'Королёва', N'Диана', N'Созоновна', CAST(N'1979-04-01' AS Date), N'+7 (198) 515-56-04', N'401', N'королёва@гкдр.ру', 1, 7, NULL, NULL, 11, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (83, N'Михеева', N'Георгина', N'Борисовна', CAST(N'1983-07-03' AS Date), N'+7 (951) 095-81-15', N'401', N'михеева@гкдр.ру', 1, 7, NULL, NULL, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (84, N'Михеева', N'Георгина', N'Борисовна', CAST(N'1971-05-28' AS Date), N'+7 (818) 456-17-32', N'401', N'михеева@гкдр.ру', 1, 7, NULL, NULL, 40, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (85, N'Савельева', N'Диша', N'Данииловна', CAST(N'1986-01-28' AS Date), N'+7 (145) 189-60-52', N'410Б', N'савельева@гкдр.ру', 1, 8, NULL, NULL, 11, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (86, N'Щербакова', N'Лира', N'Витальевна', CAST(N'1965-03-26' AS Date), N'+7 (066) 097-49-63', N'410Б', N'щербакова@гкдр.ру', 1, 8, NULL, NULL, 30, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (87, N'Калинина', N'Радмила', N'Пётровна', CAST(N'1960-12-29' AS Date), N'+7 (041) 340-67-42', N'410Б', N'калинина@гкдр.ру', 1, 8, NULL, NULL, 34, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (88, N'Харитонова', N'Видана', N'Николаевна', CAST(N'1962-09-07' AS Date), N'+7 (686) 601-90-65', N'410Б', N'харитонова@гкдр.ру', 1, 8, NULL, NULL, 34, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (89, N'Рожкова', N'Сильвия', N'Мартыновна', CAST(N'1974-10-18' AS Date), N'+7 (141) 793-69-11', N'410Б', N'рожкова@гкдр.ру', 1, 8, NULL, NULL, 34, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (90, N'Нестерова', N'Данна', N'Игнатьевна', CAST(N'1982-12-28' AS Date), N'+7 (383) 545-59-27', N'487', N'нестерова@гкдр.ру', 1, 9, 3, NULL, 31, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (91, N'Корнилова', N'Ангелина', N'Алексеевна', CAST(N'1977-06-07' AS Date), N'+7 (195) 929-02-05', N'487', N'корнилова@гкдр.ру', 1, 9, 3, NULL, 31, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (92, N'Аксёнова', N'Мирра', N'Григорьевна', CAST(N'1978-12-28' AS Date), N'+7 (614) 995-85-89', N'487', N'аксёнова@гкдр.ру', 1, 9, 3, NULL, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (93, N'Фадеева', N'Влада', N'Семёновна', CAST(N'1987-02-17' AS Date), N'+7 (060) 326-14-90', N'421', N'фадеева@гкдр.ру', 1, 9, 9, NULL, 31, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (94, N'Кононова', N'Майя', N'Максовна', CAST(N'1979-12-10' AS Date), N'+7 (673) 181-26-22', N'421', N'кононова@гкдр.ру', 1, 9, 9, NULL, 31, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (95, N'Некрасова', N'Лилу', N'Константиновна', CAST(N'1995-06-29' AS Date), N'+7 (885) 634-33-04', N'401', N'некрасова@гкдр.ру', 1, 10, NULL, NULL, 9, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (96, N'Баранова', N'Диана', N'Леонидовна', CAST(N'1989-01-28' AS Date), N'+7 (174) 853-49-83', N'401', N'баранова@гкдр.ру', 1, 10, NULL, NULL, 23, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (97, N'Гришина', N'Азалия', N'Агафоновна', CAST(N'1999-11-11' AS Date), N'+7 (017) 495-66-09', N'401', N'гришина@гкдр.ру', 1, 10, NULL, NULL, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (98, N'Архипова', N'Наталья', N'Юрьевна', CAST(N'1967-09-06' AS Date), N'+7 (325) 282-73-59', N'401', N'архипова@гкдр.ру', 1, 10, NULL, NULL, 45, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (99, N'Рожкова', N'Мила', N'Кирилловна', CAST(N'1969-10-29' AS Date), N'+7 (644) 679-57-32', N'488', N'рожкова@гкдр.ру', 1, 11, 15, NULL, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (100, N'Богданова', N'Эллада', N'Георгиевна', CAST(N'1997-05-28' AS Date), N'+7 (366) 341-61-81', N'488', N'богданова@гкдр.ру', 1, 11, 15, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (101, N'Яковлева', N'Аделия', N'Геласьевна', CAST(N'1960-07-09' AS Date), N'+7 (990) 358-79-57', N'488', N'яковлева@гкдр.ру', 1, 11, 15, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (102, N'Соловьёва', N'Габриэлла', N'Созоновна', CAST(N'1969-12-18' AS Date), N'+7 (298) 353-76-77', N'488', N'соловьёва@гкдр.ру', 1, 11, 15, NULL, 2, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (103, N'Щукина', N'Розалина', N'Витальевна', CAST(N'1992-05-04' AS Date), N'+7 (041) 888-17-81', N'488', N'щукина@гкдр.ру', 1, 11, 15, NULL, 3, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (104, N'Никитина', N'Азалия', N'Алексеевна', CAST(N'1983-06-02' AS Date), N'+7 (379) 582-61-58', N'488', N'никитина@гкдр.ру', 1, 11, 15, NULL, 4, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (105, N'Дроздова', N'Береслава', N'Максимовна', CAST(N'1962-10-27' AS Date), N'+7 (812) 542-65-16', N'488', N'дроздова@гкдр.ру', 1, 11, 15, NULL, 24, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (106, N'Галкина', N'Божена', N'Филипповна', CAST(N'1974-03-31' AS Date), N'+7 (120) 462-91-94', N'488', N'галкина@гкдр.ру', 1, 11, 15, NULL, 43, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (107, N'Казакова', N'Земфира', N'Федосеевна', CAST(N'1967-03-20' AS Date), N'+7 (312) 173-95-22', N'488', N'казакова@гкдр.ру', 1, 11, 15, NULL, 43, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (108, N'Доронина', N'Эдуарда', N'Дмитрьевна', CAST(N'1972-07-12' AS Date), N'+7 (398) 556-52-52', N'421', N'доронина@гкдр.ру', 1, 11, 16, 2, 39, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (109, N'Гурьева', N'Фанни', N'Андреевна', CAST(N'1965-04-07' AS Date), N'+7 (192) 794-90-18', N'421', N'гурьева@гкдр.ру', 1, 11, 16, 2, 39, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (110, N'Кононова', N'Нонна', N'Анатольевна', CAST(N'1988-03-03' AS Date), N'+7 (049) 956-85-86', N'421', N'кононова@гкдр.ру', 1, 11, 16, 2, 39, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (111, N'Блинова', N'Милослава', N'Андреевна', CAST(N'1969-05-21' AS Date), N'+7 (134) 370-87-86', N'524', N'блинова@гкдр.ру', 1, 11, 25, NULL, 22, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (112, N'Щукина', N'Владислава', N'Альбертовна', CAST(N'1968-02-04' AS Date), N'+7 (441) 380-03-70', N'524', N'щукина@гкдр.ру', 1, 11, 25, NULL, 28, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (113, N'Громова', N'Архелия', N'Святославовна', CAST(N'1983-08-26' AS Date), N'+7 (834) 538-57-98', N'524', N'громова@гкдр.ру', 1, 11, 25, NULL, 39, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (114, N'Соколова', N'Фанни', N'Григорьевна', CAST(N'2002-11-28' AS Date), N'+7 (787) 780-96-88', N'524', N'соколова@гкдр.ру', 1, 11, 25, NULL, 39, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (115, N'Веселова', N'Регина', N'Натановна', CAST(N'1980-05-27' AS Date), N'+7 (695) 489-78-71', N'523', N'веселова@гкдр.ру', 1, 11, 26, NULL, 25, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (116, N'Субботина', N'Инга', N'Васильевна', CAST(N'1985-08-17' AS Date), N'+7 (955) 709-44-45', N'523', N'субботина@гкдр.ру', 1, 11, 26, NULL, 38, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (117, N'Исаков', N'Аполлон', N'Ефимович', CAST(N'1998-05-02' AS Date), N'+7 (952) 550-14-44', N'421', N'исаков@гкдр.ру', 1, 12, 18, NULL, 23, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (118, N'Галкин', N'Никифор', N'Евсеевич', CAST(N'1975-01-13' AS Date), N'+7 (270) 482-96-24', N'524', N'галкин@гкдр.ру', 1, 12, 27, NULL, 11, NULL, NULL, NULL)
INSERT [dbo].[Employees] ([Id], [Surname], [Name], [Patronym], [Birthdate], [WorkPhone], [Room], [WorkEmail], [OrganisationId], [DepartmentLevel1Id], [DepartmentLevel2Id], [DepartmentLevel3Id], [RoleId], [ManagerId], [AssistantId], [Info]) VALUES (119, N'Харитонова', N'Ангелина', N'Мэлоровна', CAST(N'1990-06-21' AS Date), N'+7 (800) 847-84-22', N'524', N'харитонова@гкдр.ру', 1, 12, 27, NULL, 19, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Events] ON 

INSERT [dbo].[Events] ([Id], [Name], [Status], [EventDate], [EventTime], [EmployeeId], [Description]) VALUES (1, N'Корпоративный праздник', N'Planned', CAST(N'2023-12-31' AS Date), CAST(N'18:00:00' AS Time), 1, N'Новый год')
INSERT [dbo].[Events] ([Id], [Name], [Status], [EventDate], [EventTime], [EmployeeId], [Description]) VALUES (2, N'Обучение по безопасности', N'Completed', CAST(N'2023-01-10' AS Date), CAST(N'09:00:00' AS Time), 2, N'Обучение сотрудников по технике безопасности')
INSERT [dbo].[Events] ([Id], [Name], [Status], [EventDate], [EventTime], [EmployeeId], [Description]) VALUES (3, N'Встреча с клиентами', N'Scheduled', CAST(N'2023-02-15' AS Date), CAST(N'14:00:00' AS Time), 3, N'Встреча для обсуждения новых проектов')
SET IDENTITY_INSERT [dbo].[Events] OFF
GO
SET IDENTITY_INSERT [dbo].[Organisation] ON 

INSERT [dbo].[Organisation] ([Id], [Name]) VALUES (1, N'Дороги России')
SET IDENTITY_INSERT [dbo].[Organisation] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [Name]) VALUES (1, N'Административный директор-руководитель аппарата')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (2, N'Бухгалтер')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (3, N'Бухгалтер по расчету заработной платы')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (4, N'Ведущий бухгалтер')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (5, N'Ведущий специалист')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (6, N'Ведущий специалист по договорной работе')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (7, N'Водитель')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (8, N'Генеральный директор')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (9, N'Главный специалист')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (10, N'Директор Академии')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (11, N'Директор департамента')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (12, N'Заместитель генерального директора по внедрению стандартов')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (13, N'Заместитель генерального директора по исследованиям и разработкам')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (14, N'Заместитель генерального директора по коммуникациям')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (15, N'Заместитель генерального директора по маркетингу и партнерским отношениям')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (16, N'Заместитель генерального директора по организации корпоративов')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (17, N'Заместитель генерального директора по подготовке кадров')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (18, N'Заместитель директора Академии по практической подготовке')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (19, N'Заместитель директора департамента')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (20, N'Курьер')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (21, N'Менеджер проектов')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (22, N'Начальник отдела')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (23, N'Начальник управления')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (24, N'Начальник управления - Заместитель главного бухгалтера')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (25, N'Начальник финансово - экономического отдела')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (26, N'Первый заместитель генерального директора')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (27, N'Помощник генерального директора')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (28, N'Руководитель департамента - Главный бухгалтер')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (29, N'Руководитель контрольно-ревизионного направления')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (30, N'Руководитель направления')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (31, N'Руководитель проекта')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (32, N'Руководитель проекта по разработке дизайна')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (33, N'Руководитель проекта по рекламе')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (34, N'Руководитель проектов')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (35, N'Руководитель управления')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (36, N'Советник генерального директора по оперативному планированию')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (37, N'Советник генерального директора по стратегическому развитию')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (38, N'Специалист')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (39, N'Специалист казначейства')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (40, N'Специалист по охране труда')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (41, N'Специалист по складской работе')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (42, N'Специалист технического сопровождения')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (43, N'Старший бухгалтер')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (44, N'Старший специалист')
INSERT [dbo].[Roles] ([Id], [Name]) VALUES (45, N'Финансовый контролер')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[TrainingMaterials] ON 

INSERT [dbo].[TrainingMaterials] ([Id], [TrainingId], [Name], [ApproveDate], [EditDate], [Status], [Type], [Area], [Author]) VALUES (1, 1, N'Презентация по основам программирования', CAST(N'2022-12-15' AS Date), CAST(N'2023-01-01' AS Date), N'Approved', N'Presentation', N'IT', N'Иван Иванов')
INSERT [dbo].[TrainingMaterials] ([Id], [TrainingId], [Name], [ApproveDate], [EditDate], [Status], [Type], [Area], [Author]) VALUES (2, 2, N'Руководство по администрированию баз данных', CAST(N'2022-12-20' AS Date), CAST(N'2023-01-10' AS Date), N'Pending', N'Manual', N'Технический отдел', N'Петр Петров')
INSERT [dbo].[TrainingMaterials] ([Id], [TrainingId], [Name], [ApproveDate], [EditDate], [Status], [Type], [Area], [Author]) VALUES (3, 3, N'Видеоуроки командной работы', CAST(N'2022-12-25' AS Date), CAST(N'2023-02-01' AS Date), N'Approved', N'Video', N'HR', N'Сергей Сергеев')
SET IDENTITY_INSERT [dbo].[TrainingMaterials] OFF
GO
SET IDENTITY_INSERT [dbo].[Trainings] ON 

INSERT [dbo].[Trainings] ([Id], [Name], [StartDate], [EndDate], [EmployeeId]) VALUES (1, N'Основы программирования', CAST(N'2023-01-01' AS Date), CAST(N'2023-01-15' AS Date), 1)
INSERT [dbo].[Trainings] ([Id], [Name], [StartDate], [EndDate], [EmployeeId]) VALUES (2, N'Администрирование баз данных', CAST(N'2023-02-01' AS Date), CAST(N'2023-02-14' AS Date), 2)
INSERT [dbo].[Trainings] ([Id], [Name], [StartDate], [EndDate], [EmployeeId]) VALUES (3, N'Командная работа', CAST(N'2023-03-01' AS Date), CAST(N'2023-03-07' AS Date), 3)
SET IDENTITY_INSERT [dbo].[Trainings] OFF
GO
SET IDENTITY_INSERT [dbo].[VacationCalendar] ON 

INSERT [dbo].[VacationCalendar] ([Id], [TypeId], [EmployeeId], [StartDate], [EndDate]) VALUES (1, 1, 1, CAST(N'2023-06-01' AS Date), CAST(N'2023-06-15' AS Date))
INSERT [dbo].[VacationCalendar] ([Id], [TypeId], [EmployeeId], [StartDate], [EndDate]) VALUES (2, 1, 2, CAST(N'2023-07-01' AS Date), CAST(N'2023-07-14' AS Date))
INSERT [dbo].[VacationCalendar] ([Id], [TypeId], [EmployeeId], [StartDate], [EndDate]) VALUES (3, 2, 3, CAST(N'2023-08-01' AS Date), CAST(N'2023-08-07' AS Date))
SET IDENTITY_INSERT [dbo].[VacationCalendar] OFF
GO
SET IDENTITY_INSERT [dbo].[VacationTypes] ON 

INSERT [dbo].[VacationTypes] ([Id], [Name]) VALUES (1, N'Отпуск')
INSERT [dbo].[VacationTypes] ([Id], [Name]) VALUES (2, N'Отгул')
SET IDENTITY_INSERT [dbo].[VacationTypes] OFF
GO
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (1, CAST(N'2024-01-01' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (2, CAST(N'2024-01-02' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (3, CAST(N'2024-01-03' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (4, CAST(N'2024-01-04' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (5, CAST(N'2024-01-05' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (6, CAST(N'2024-01-08' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (7, CAST(N'2024-02-23' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (8, CAST(N'2024-03-08' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (9, CAST(N'2024-04-27' AS Date), 1)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (10, CAST(N'2024-04-29' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (11, CAST(N'2024-04-30' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (12, CAST(N'2024-05-01' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (13, CAST(N'2024-05-09' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (14, CAST(N'2024-05-10' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (15, CAST(N'2024-06-12' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (16, CAST(N'2024-11-02' AS Date), 1)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (17, CAST(N'2024-11-04' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (18, CAST(N'2024-12-28' AS Date), 1)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (19, CAST(N'2024-12-30' AS Date), 0)
INSERT [dbo].[WorkingCalendar] ([Id], [ExceptionDate], [IsWorkingDay]) VALUES (20, CAST(N'2024-12-31' AS Date), 0)
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_DepartmentLevel1] FOREIGN KEY([DepartmentLevel1Id])
REFERENCES [dbo].[DepartmentLevel1] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_DepartmentLevel1]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_DepartmentLevel2] FOREIGN KEY([DepartmentLevel2Id])
REFERENCES [dbo].[DepartmentLevel2] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_DepartmentLevel2]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_DepartmentLevel3] FOREIGN KEY([DepartmentLevel3Id])
REFERENCES [dbo].[DepartmentLevel3] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_DepartmentLevel3]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Employees1] FOREIGN KEY([AssistantId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Employees1]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Organisation] FOREIGN KEY([OrganisationId])
REFERENCES [dbo].[Organisation] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Organisation]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Roles]
GO
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [FK_Events_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [FK_Events_Employees]
GO
ALTER TABLE [dbo].[TrainingMaterials]  WITH CHECK ADD  CONSTRAINT [FK_TrainingMaterials_Trainings] FOREIGN KEY([TrainingId])
REFERENCES [dbo].[Trainings] ([Id])
GO
ALTER TABLE [dbo].[TrainingMaterials] CHECK CONSTRAINT [FK_TrainingMaterials_Trainings]
GO
ALTER TABLE [dbo].[Trainings]  WITH CHECK ADD  CONSTRAINT [FK_Trainings_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[Trainings] CHECK CONSTRAINT [FK_Trainings_Employees]
GO
ALTER TABLE [dbo].[VacationCalendar]  WITH CHECK ADD  CONSTRAINT [FK_VacationCalendar_Employees] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employees] ([Id])
GO
ALTER TABLE [dbo].[VacationCalendar] CHECK CONSTRAINT [FK_VacationCalendar_Employees]
GO
ALTER TABLE [dbo].[VacationCalendar]  WITH CHECK ADD  CONSTRAINT [FK_VacationCalendar_VacationTypes] FOREIGN KEY([TypeId])
REFERENCES [dbo].[VacationTypes] ([Id])
GO
ALTER TABLE [dbo].[VacationCalendar] CHECK CONSTRAINT [FK_VacationCalendar_VacationTypes]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Идентификатор строки' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkingCalendar', @level2type=N'COLUMN',@level2name=N'Id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'День-исключение' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkingCalendar', @level2type=N'COLUMN',@level2name=N'ExceptionDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 - будний день, но законодательно принят выходным' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkingCalendar', @level2type=N'COLUMN',@level2name=N'IsWorkingDay'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Список дней исключений в производственном календаре' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WorkingCalendar'
GO
USE [master]
GO
ALTER DATABASE [WSDB] SET  READ_WRITE 
GO
