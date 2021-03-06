USE [scrum_db]
GO
/****** Object:  StoredProcedure [dbo].[addtask]    Script Date: 12/18/2016 4:25:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[addtask]
	@task_title VARCHAR(100) = null,
	@task_description VARCHAR(1000)=null,
	@task_startdate Date = null,
	@task_enddate Date = null,
	@userid int = null,
	@task_status VARCHAR(50)=null
As
	BEGIN
		SET NOCOUNT ON
			insert into dbo.tasks(
				task_title,
				task_description,
				task_startdate,
				task_enddate,
				userid,
				task_status
			)
			Values(
				@task_title,
				@task_description,
				@task_startdate,
				@task_enddate,
				@userid,
				@task_status
			)
		END
