IF NOT EXISTS (SELECT * FROM master.dbo.syslogins WHERE loginname = N'SSBCLOUD\aoneil')
CREATE LOGIN [SSBCLOUD\aoneil] FROM WINDOWS
GO
CREATE USER [SSBCLOUD\aoneil] FOR LOGIN [SSBCLOUD\aoneil] WITH DEFAULT_SCHEMA=[SSBCLOUD\aoneil]
GO
REVOKE CONNECT TO [SSBCLOUD\aoneil]
