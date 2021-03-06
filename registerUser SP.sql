USE [scrum_db]
GO
/****** Object:  StoredProcedure [dbo].[registerUser]    Script Date: 12/4/2016 8:39:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[registerUser]
	@email VARCHAR(50) =NULL,
	@fname VARCHAR(50) =NULL,
	@lname VARCHAR(50) =NULL,
	@psw VARCHAR(50) =NULL,
	@usertype int = null,
	@isauthenticate int = null
AS
	BEGIN
		SET NOCOUNT ON
			INSERT INTO dbo.users
			(email,
			fname,
			lname,
			password,
			usertype,
			isauthenticate
			)
		VALUES(
			@email,
			@fname,
			@lname,
			@psw,
			@usertype,
			@isauthenticate
			)
		END
