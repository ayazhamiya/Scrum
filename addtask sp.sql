USE [scrum_db]
GO
/****** Object:  StoredProcedure [dbo].[addtask]    Script Date: 12/16/2016 3:52:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[addtask]
	@task_title VARCHAR(100) = null,
	@task_description VARCHAR(1000)=null,
	@task_startdate Date = null,
	@task_enddate Date = null,
	@userid int = null
As
	BEGIN
		SET NOCOUNT ON
			insert into dbo.tasks(
				task_title,
				task_description,
				task_startdate,
				task_enddate,
				userid
			)
			Values(
				@task_title,
				@task_description,
				@task_startdate,
				@task_enddate,
				@userid
			)
		END
