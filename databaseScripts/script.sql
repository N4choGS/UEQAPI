USE [master]
GO
/****** Object:  Database [ueqData]    Script Date: 9/3/2023 11:14:13 AM ******/
CREATE DATABASE [ueqData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ueqData', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ueqData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ueqData_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ueqData_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ueqData] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ueqData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ueqData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ueqData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ueqData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ueqData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ueqData] SET ARITHABORT OFF 
GO
ALTER DATABASE [ueqData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ueqData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ueqData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ueqData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ueqData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ueqData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ueqData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ueqData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ueqData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ueqData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ueqData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ueqData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ueqData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ueqData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ueqData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ueqData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ueqData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ueqData] SET RECOVERY FULL 
GO
ALTER DATABASE [ueqData] SET  MULTI_USER 
GO
ALTER DATABASE [ueqData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ueqData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ueqData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ueqData] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ueqData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ueqData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ueqData', N'ON'
GO
ALTER DATABASE [ueqData] SET QUERY_STORE = ON
GO
ALTER DATABASE [ueqData] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ueqData]
GO
/****** Object:  Table [dbo].[Module]    Script Date: 9/3/2023 11:14:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Module](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](246) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Project]    Script Date: 9/3/2023 11:14:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Project](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](246) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questionnaire]    Script Date: 9/3/2023 11:14:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questionnaire](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[moduleId] [int] NULL,
	[projectId] [int] NULL,
	[createdDate] [date] NULL,
	[annoying_enjoyable] [int] NULL,
	[notUnderstandable_understandable] [int] NULL,
	[dull_creative] [int] NULL,
	[difficultToLearn_easyToLearn] [int] NULL,
	[inferior_valuable] [int] NULL,
	[boring_exciting] [int] NULL,
	[notInteresting_interesting] [int] NULL,
	[unpredictable_predictable] [int] NULL,
	[slow_fast] [int] NULL,
	[conventional_inventive] [int] NULL,
	[obstructive_supportive] [int] NULL,
	[bad_good] [int] NULL,
	[complicated_easy] [int] NULL,
	[unlikable_pleasing] [int] NULL,
	[usual_leadingEdge] [int] NULL,
	[unpleasant_pleasant] [int] NULL,
	[notSecure_secure] [int] NULL,
	[motivating_demotivating] [int] NULL,
	[doesNotMeetExpectations_meetsExpectations] [int] NULL,
	[inefficient_efficient] [int] NULL,
	[confusing_clear] [int] NULL,
	[impractical_practical] [int] NULL,
	[cluttered_organized] [int] NULL,
	[unattractive_attractive] [int] NULL,
	[unfriendly_friendly] [int] NULL,
	[conservative_innovative] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Questionnaire]  WITH CHECK ADD FOREIGN KEY([moduleId])
REFERENCES [dbo].[Module] ([id])
GO
ALTER TABLE [dbo].[Questionnaire]  WITH CHECK ADD FOREIGN KEY([projectId])
REFERENCES [dbo].[Project] ([id])
GO
/****** Object:  StoredProcedure [dbo].[GetQuestionnaireData]    Script Date: 9/3/2023 11:14:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetQuestionnaireData]
    @ProjectIds NVARCHAR(MAX),
    @ModuleIds NVARCHAR(MAX) = NULL,
    @StartDate DATE,
    @EndDate DATE = NULL
AS
BEGIN
    -- Create a temporary table to store the list of project IDs
    CREATE TABLE #TempProjectIds (Id INT)

    -- Split the comma-separated list of project IDs and insert them into the temporary table
    INSERT INTO #TempProjectIds (Id)
    SELECT value
    FROM STRING_SPLIT(@ProjectIds, ',')

    -- Create a temporary table to store the list of module IDs (if provided)
    IF @ModuleIds IS NOT NULL
    BEGIN
        CREATE TABLE #TempModuleIds (Id INT)

        -- Split the comma-separated list of module IDs and insert them into the temporary table
        INSERT INTO #TempModuleIds (Id)
        SELECT value
        FROM STRING_SPLIT(@ModuleIds, ',')
    END

    -- Retrieve the matching records based on the provided criteria
    SELECT *
    FROM Questionnaire
    WHERE
        ProjectId IN (SELECT Id FROM #TempProjectIds)
        AND (@ModuleIds IS NULL OR ModuleId IN (SELECT Id FROM #TempModuleIds))
        AND createdDate >= @StartDate
        AND (@EndDate IS NULL OR createdDate <= @EndDate)

    -- Drop the temporary tables
    DROP TABLE #TempProjectIds

    IF @ModuleIds IS NOT NULL
    BEGIN
        DROP TABLE #TempModuleIds
    END
END
GO
USE [master]
GO
ALTER DATABASE [ueqData] SET  READ_WRITE 
GO
