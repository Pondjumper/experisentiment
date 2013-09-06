SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'lentil_user')
CREATE LOGIN [lentil_user] WITH PASSWORD = 'P@$$w0rd!'
GO
CREATE USER [lentil_user] FOR LOGIN [lentil_user]
GO
GRANT CONNECT TO [lentil_user]
GO
PRINT N'Creating role aspnet_Membership_FullAccess'
GO
CREATE ROLE [aspnet_Membership_FullAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_Membership_FullAccess', N'lentil_user'
GO
PRINT N'Creating role aspnet_Membership_BasicAccess'
GO
CREATE ROLE [aspnet_Membership_BasicAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_Membership_BasicAccess', N'aspnet_Membership_FullAccess'
GO
EXEC sp_addrolemember N'aspnet_Membership_BasicAccess', N'lentil_user'
GO
PRINT N'Creating role aspnet_Membership_ReportingAccess'
GO
CREATE ROLE [aspnet_Membership_ReportingAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_Membership_ReportingAccess', N'aspnet_Membership_FullAccess'
GO
EXEC sp_addrolemember N'aspnet_Membership_ReportingAccess', N'lentil_user'
GO
PRINT N'Creating role aspnet_Personalization_FullAccess'
GO
CREATE ROLE [aspnet_Personalization_FullAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_Personalization_FullAccess', N'lentil_user'
GO
PRINT N'Creating role aspnet_Personalization_BasicAccess'
GO
CREATE ROLE [aspnet_Personalization_BasicAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_Personalization_BasicAccess', N'aspnet_Personalization_FullAccess'
GO
EXEC sp_addrolemember N'aspnet_Personalization_BasicAccess', N'lentil_user'
GO
PRINT N'Creating role aspnet_Personalization_ReportingAccess'
GO
CREATE ROLE [aspnet_Personalization_ReportingAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_Personalization_ReportingAccess', N'aspnet_Personalization_FullAccess'
GO
EXEC sp_addrolemember N'aspnet_Personalization_ReportingAccess', N'lentil_user'
GO
PRINT N'Creating role aspnet_Profile_FullAccess'
GO
CREATE ROLE [aspnet_Profile_FullAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_Profile_FullAccess', N'lentil_user'
GO
PRINT N'Creating role aspnet_Profile_BasicAccess'
GO
CREATE ROLE [aspnet_Profile_BasicAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_Profile_BasicAccess', N'aspnet_Profile_FullAccess'
GO
EXEC sp_addrolemember N'aspnet_Profile_BasicAccess', N'lentil_user'
GO
PRINT N'Creating role aspnet_Profile_ReportingAccess'
GO
CREATE ROLE [aspnet_Profile_ReportingAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_Profile_ReportingAccess', N'aspnet_Profile_FullAccess'
GO
EXEC sp_addrolemember N'aspnet_Profile_ReportingAccess', N'lentil_user'
GO
PRINT N'Creating role aspnet_Roles_FullAccess'
GO
CREATE ROLE [aspnet_Roles_FullAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_Roles_FullAccess', N'lentil_user'
GO
PRINT N'Creating role aspnet_Roles_BasicAccess'
GO
CREATE ROLE [aspnet_Roles_BasicAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_Roles_BasicAccess', N'aspnet_Roles_FullAccess'
GO
EXEC sp_addrolemember N'aspnet_Roles_BasicAccess', N'lentil_user'
GO
PRINT N'Creating role aspnet_Roles_ReportingAccess'
GO
CREATE ROLE [aspnet_Roles_ReportingAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_Roles_ReportingAccess', N'aspnet_Roles_FullAccess'
GO
EXEC sp_addrolemember N'aspnet_Roles_ReportingAccess', N'lentil_user'
GO
PRINT N'Creating role aspnet_WebEvent_FullAccess'
GO
CREATE ROLE [aspnet_WebEvent_FullAccess]
AUTHORIZATION [dbo]
GO
EXEC sp_addrolemember N'aspnet_WebEvent_FullAccess', N'lentil_user'
GO
PRINT N'Creating role db_datareader'
GO
EXEC sp_addrolemember N'db_datareader', N'lentil_user'
GO
PRINT N'Creating role db_datawriter'
GO
EXEC sp_addrolemember N'db_datawriter', N'lentil_user'
GO
BEGIN TRANSACTION
GO
PRINT N'Creating schemata'
GO
CREATE SCHEMA [aspnet_Membership_BasicAccess]
AUTHORIZATION [aspnet_Membership_BasicAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [aspnet_Membership_FullAccess]
AUTHORIZATION [aspnet_Membership_FullAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [aspnet_Membership_ReportingAccess]
AUTHORIZATION [aspnet_Membership_ReportingAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [aspnet_Personalization_BasicAccess]
AUTHORIZATION [aspnet_Personalization_BasicAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [aspnet_Personalization_FullAccess]
AUTHORIZATION [aspnet_Personalization_FullAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [aspnet_Personalization_ReportingAccess]
AUTHORIZATION [aspnet_Personalization_ReportingAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [aspnet_Profile_BasicAccess]
AUTHORIZATION [aspnet_Profile_BasicAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [aspnet_Profile_FullAccess]
AUTHORIZATION [aspnet_Profile_FullAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [aspnet_Profile_ReportingAccess]
AUTHORIZATION [aspnet_Profile_ReportingAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [aspnet_Roles_BasicAccess]
AUTHORIZATION [aspnet_Roles_BasicAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [aspnet_Roles_FullAccess]
AUTHORIZATION [aspnet_Roles_FullAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [aspnet_Roles_ReportingAccess]
AUTHORIZATION [aspnet_Roles_ReportingAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
CREATE SCHEMA [aspnet_WebEvent_FullAccess]
AUTHORIZATION [aspnet_WebEvent_FullAccess]
GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO