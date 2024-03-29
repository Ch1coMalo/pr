USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 06.05.2023 23:44:50 ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Hospital] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Hospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Hospital] SET QUERY_STORE = OFF
GO
USE [Hospital]
GO
/****** Object:  Table [dbo].[Analyses]    Script Date: 06.05.2023 23:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Analyses](
	[NumAnalysisId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ViewAnalysis] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Анализы] PRIMARY KEY CLUSTERED 
(
	[NumAnalysisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conclusion]    Script Date: 06.05.2023 23:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conclusion](
	[DiagnosisId] [int] NOT NULL,
	[Diagnosis] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Заключение] PRIMARY KEY CLUSTERED 
(
	[DiagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doc]    Script Date: 06.05.2023 23:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doc](
	[DocId] [int] NOT NULL,
	[DocSurname] [varchar](50) NOT NULL,
	[DocName] [varchar](20) NOT NULL,
	[DocFathername] [varchar](50) NULL,
	[ProfessionId] [int] NOT NULL,
 CONSTRAINT [PK_Врач] PRIMARY KEY CLUSTERED 
(
	[DocId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pacient]    Script Date: 06.05.2023 23:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pacient](
	[PacientId] [int] NOT NULL,
	[PacSurname] [varchar](50) NOT NULL,
	[PacName] [varchar](20) NOT NULL,
	[PacFathername] [varchar](50) NOT NULL,
	[DateOfBirth] [smalldatetime] NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[NumPolicy] [int] NULL,
 CONSTRAINT [PK_Пациент] PRIMARY KEY CLUSTERED 
(
	[PacientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prepar]    Script Date: 06.05.2023 23:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prepar](
	[PreparationId] [int] NOT NULL,
	[Preparation] [varchar](50) NOT NULL,
	[Contraindications] [text] NOT NULL,
	[PeriodOfUse] [varchar](50) NOT NULL,
	[ShelfLife] [varchar](10) NULL,
	[Dose] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Препарат] PRIMARY KEY CLUSTERED 
(
	[PreparationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reception]    Script Date: 06.05.2023 23:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reception](
	[ReceptionId] [int] NOT NULL,
	[DataRec] [datetime] NOT NULL,
	[DataFinal] [datetime] NOT NULL,
	[DiagnosisId] [int] NOT NULL,
	[DocId] [int] NOT NULL,
	[PacientId] [int] NOT NULL,
	[NumRecipeId] [int] NOT NULL,
	[NumAnalysis] [int] NOT NULL,
 CONSTRAINT [PK_Прием] PRIMARY KEY CLUSTERED 
(
	[ReceptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recipe]    Script Date: 06.05.2023 23:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipe](
	[NumRecipeId] [int] NOT NULL,
	[PreparationId] [int] NOT NULL,
 CONSTRAINT [PK_Рецепт] PRIMARY KEY CLUSTERED 
(
	[NumRecipeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialty]    Script Date: 06.05.2023 23:44:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialty](
	[ProfessionId] [int] NOT NULL,
	[Profession] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Специальность] PRIMARY KEY CLUSTERED 
(
	[ProfessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doc]  WITH CHECK ADD  CONSTRAINT [FK_Врач_Специальность] FOREIGN KEY([ProfessionId])
REFERENCES [dbo].[Specialty] ([ProfessionId])
GO
ALTER TABLE [dbo].[Doc] CHECK CONSTRAINT [FK_Врач_Специальность]
GO
ALTER TABLE [dbo].[Reception]  WITH CHECK ADD  CONSTRAINT [FK_Прием_Анализы] FOREIGN KEY([NumAnalysis])
REFERENCES [dbo].[Analyses] ([NumAnalysisId])
GO
ALTER TABLE [dbo].[Reception] CHECK CONSTRAINT [FK_Прием_Анализы]
GO
ALTER TABLE [dbo].[Reception]  WITH CHECK ADD  CONSTRAINT [FK_Прием_Врач] FOREIGN KEY([DocId])
REFERENCES [dbo].[Doc] ([DocId])
GO
ALTER TABLE [dbo].[Reception] CHECK CONSTRAINT [FK_Прием_Врач]
GO
ALTER TABLE [dbo].[Reception]  WITH CHECK ADD  CONSTRAINT [FK_Прием_Заключение] FOREIGN KEY([DiagnosisId])
REFERENCES [dbo].[Conclusion] ([DiagnosisId])
GO
ALTER TABLE [dbo].[Reception] CHECK CONSTRAINT [FK_Прием_Заключение]
GO
ALTER TABLE [dbo].[Reception]  WITH CHECK ADD  CONSTRAINT [FK_Прием_Пациент] FOREIGN KEY([PacientId])
REFERENCES [dbo].[Pacient] ([PacientId])
GO
ALTER TABLE [dbo].[Reception] CHECK CONSTRAINT [FK_Прием_Пациент]
GO
ALTER TABLE [dbo].[Reception]  WITH CHECK ADD  CONSTRAINT [FK_Прием_Рецепт] FOREIGN KEY([NumRecipeId])
REFERENCES [dbo].[Recipe] ([NumRecipeId])
GO
ALTER TABLE [dbo].[Reception] CHECK CONSTRAINT [FK_Прием_Рецепт]
GO
ALTER TABLE [dbo].[Recipe]  WITH CHECK ADD  CONSTRAINT [FK_Рецепт_Препарат] FOREIGN KEY([PreparationId])
REFERENCES [dbo].[Prepar] ([PreparationId])
GO
ALTER TABLE [dbo].[Recipe] CHECK CONSTRAINT [FK_Рецепт_Препарат]
GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
