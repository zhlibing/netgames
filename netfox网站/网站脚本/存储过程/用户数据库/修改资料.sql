


USE [QPGameUserDB]
GO

IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[GSP_GP_UpdateUserInfo]') and OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[GSP_GP_UpdateUserInfo]
GO

CREATE PROCEDURE [GSP_GP_UpdateUserInfo]
	@dwUserID INT,
	@strCompellation NVARCHAR(16),
	@strQQ NVARCHAR(16),
	@strEmail NVARCHAR(32),
	@strSeatPhone NVARCHAR(32),
	@strMobilePhone NVARCHAR(16),
	@strDwellingPlace NVARCHAR(128),
	@strPostalCode NVARCHAR(8),
	@strUserNote NVARCHAR(256),
	@LogonPass 	char (32),
	@LogonPass2 char (32),
	@Typ NVARCHAR (50),
	@UserID INT,
	@FaceID INT

WITH ENCRYPTION AS
BEGIN
	IF @TYP='LogonPass'
	BEGIN
		IF EXISTS (SELECT UserID FROM AccountsInfo WHERE UserID=@UserID And LogonPass=@LogonPass)
		BEGIN
			UPDATE [AccountsInfo] 
			SET  LogonPass	 = @LogonPass2 WHERE ( [UserID]	 = @UserID)
			SELECT '成功信息:修改登入密码成功!'
		END
		ELSE
		BEGIN
			SELECT '您的原密码输入错误!'
		END
	END	

END
return 0
go