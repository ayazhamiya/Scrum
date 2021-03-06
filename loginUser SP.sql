USE [scrum_db]
GO
/****** Object:  StoredProcedure [dbo].[loginUser]    Script Date: 12/12/2016 3:03:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[loginUser]
	--input variables
	@email VARCHAR(100),
	@password VARCHAR(100),
	--output variables
	@islogin int OUTPUT,
	@user_id int OUTPUT,
	@user_fname VARCHAR(100) OUTPUT,
	@user_lname VARCHAR(100) OUTPUT
AS
	BEGIN
		SET NOCOUNT ON;
			IF EXISTS(select * from users where email=@email and password=@password)
				Begin
					SET @islogin=1
					select @user_id=userid, @user_fname=fname, @user_lname=lname 
						from users where email=@email and password=@password
				End
			ELSE 
				SELECT @islogin=0
	END