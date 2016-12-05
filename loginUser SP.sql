create procedure [dbo].[loginUser]
	@email VARCHAR(100),
	@password VARCHAR(100)
AS
	BEGIN
		SET NOCOUNT ON;
			IF EXISTS(select * from users where email=@email and password=@password)
				SELECT 1
			ELSE 
				SELECT 0
	END