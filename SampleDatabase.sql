--USE master

--CREATE DATABASE Sample

USE Sample

--Create Post table in Sample Database
CREATE TABLE [dbo].[Post] (
	[PostID] INT NOT NULL IDENTITY
	,[Title] NVARCHAR(50) NOT NULL
	,[Body] NVARCHAR(4000) NOT NULL
	,[Publish] DATETIME NULL
	,PRIMARY KEY CLUSTERED ([PostID] ASC)
	)
GO

--Create Movie table in Sample Database
CREATE TABLE [dbo].[Movie] (
	[Id] INT NOT NULL PRIMARY KEY IDENTITY
	,[Title] NVARCHAR(100) NOT NULL
	,[Director] NVARCHAR(100) NOT NULL
	,[DateReleased] DATETIME NOT NULL
	,[InTheaters] BIT NOT NULL
	,[BoxOfficeTotals] MONEY NOT NULL
	,[Description] NVARCHAR(4000) NULL
	)
GO

--Add values to Post table
CREATE PROCEDURE [dbo].[Post_Add] @PostID INT OUTPUT
	,--Pass a agrument as OOP
	@Title NVARCHAR(50)
	,@Body NVARCHAR(4000)
	,@Publish DATETIME
AS
BEGIN
	INSERT INTO [Post] (
		[Title]
		,[Body]
		,[Publish]
		)
	VALUES (
		@Title
		,@Body
		,@Publish
		)

	SET @PostID = @@IDENTITY
END
GO

--Add values to Movie table
CREATE PROCEDURE [dbo].[Movie_Add] @Id INT OUTPUT
	,@Title NVARCHAR(100)
	,@Director NVARCHAR(100)
	,@DateReleased DATETIME
	,@InTheaters BIT
	,@BoxOfficeTotals MONEY
	,@Description NVARCHAR(4000)
AS
BEGIN
	INSERT INTO [Movie] (
		[Title]
		,[Director]
		,[DateReleased]
		,[InTheaters]
		,[BoxOfficeTotals]
		,[Description]
		)
	VALUES (
		@Title
		,@Director
		,@DateReleased
		,@InTheaters
		,@BoxOfficeTotals
		,@Description
		)

	SET @Id = @@IDENTITY
END
GO

--Update Post table
CREATE PROCEDURE [dbo].[Post_Update] @PostID INT
	,@Title NVARCHAR(50)
	,@Body NVARCHAR(4000)
	,@Publish DATETIME
AS
UPDATE [Post]
SET [Title] = @Title
	,[Body] = @Body
	,[Publish] = @Publish
WHERE [PostID] = @PostID
GO

--Update Movie table
CREATE PROCEDURE [dbo].[Movie_Update] @Id INT
	,@Title NVARCHAR(100)
	,@Director NVARCHAR(100)
	,@DateReleased DATETIME
	,@InTheaters BIT
	,@BoxOfficeTotals MONEY
	,@Description NVARCHAR(4000)
AS
UPDATE [Movie]
SET [Title] = @Title
	,[Director] = @Director
	,[DateReleased] = @DateReleased
	,[InTheaters] = @InTheaters
	,[BoxOfficeTotals] = @BoxOfficeTotals
	,[Description] = @Description
WHERE [Id] = @Id
GO

--Delete a record in Post table
CREATE PROCEDURE [dbo].[Post_Delete] @PostID INT
AS
DELETE [Post]
WHERE [PostID] = @PostID
GO

--Delete a record in Movie table
CREATE PROCEDURE [dbo].[Movie_Delete] @Id INT
AS
DELETE [Movie]
WHERE [Id] = @Id
GO

--Count all records in Post table
CREATE PROCEDURE [dbo].[Post_Count]
AS
SELECT count(PostID)
FROM [Post]
GO

--Count all records in Movie table
CREATE PROCEDURE [dbo].[Movie_Count]
AS
SELECT count(Id)
FROM [Movie]
GO

--Return a list of records in Post table 
CREATE PROCEDURE [dbo].[Post_All]
AS
SET NOCOUNT ON --Stops the message that shows the count of the number 
	--of rows affected by a Transact-SQL statement or stored procedure 
	--from being returned as part of the result set.

SELECT *
FROM [Post]
ORDER BY [PostID] DESC
GO

--Return a list of records in Movie table 
CREATE PROCEDURE [dbo].[Movie_All]
AS
SET NOCOUNT ON

SELECT *
FROM [Movie]
ORDER BY [Id] DESC
GO

--Return a post
CREATE PROCEDURE [dbo].[Post_Single] @PostID INT
AS
SET NOCOUNT ON

SELECT *
FROM [Post]
WHERE [PostID] = @PostID
GO

--Return a movie
CREATE PROCEDURE [dbo].[Movie_Single] @Id INT
AS
SET NOCOUNT ON

SELECT *
FROM [Movie]
WHERE [Id] = @Id
GO

-- Find a post
CREATE PROCEDURE [dbo].[Post_Find] @Title NVARCHAR(50)
AS
SET NOCOUNT ON

SELECT *
FROM [Post]
WHERE [Title] LIKE N'%' + @Title + '%';
GO

-- Find a movie
CREATE PROCEDURE [dbo].[Movie_Find] @Title NVARCHAR(100)
AS
SET NOCOUNT ON

SELECT *
FROM [Movie]
WHERE [Title] LIKE N'%' + @Title + '%';
GO

--Return paging results
CREATE PROCEDURE [dbo].[Movie_Paging] @PageNumber INT
	,@PageSize INT
AS
DECLARE @Movies TABLE (
	RowNumber INT
	,Id INT
	,Title NVARCHAR(100)
	,Director NVARCHAR(100)
	,DateReleased DATETIME
	,InTheaters BIT
	,BoxOfficeTotals MONEY
	,Description NVARCHAR(4000)
	)

INSERT INTO @Movies
SELECT ROW_NUMBER() OVER (
		ORDER BY Movie.Id
		) AS Row
	,Id
	,Title
	,Director
	,DateReleased
	,InTheaters
	,BoxOfficeTotals
	,Description
FROM Movie

SELECT count(Id)
FROM @Movies

SELECT *
FROM @Movies
WHERE RowNumber > (@PageNumber - 1) * @PageSize
	AND RowNumber <= @PageNumber * @PageSize

--Insert data to Post table
SET IDENTITY_INSERT [dbo].[Movie] ON

INSERT [dbo].[Movie] (
	[Id]
	,[Title]
	,[Director]
	,[DateReleased]
	,[InTheaters]
	,[BoxOfficeTotals]
	,[Description]
	)
VALUES (
	1
	,N'Titanic'
	,N'James Cameron'
	,CAST(0x00008B1000000000 AS DATETIME)
	,0
	,600000000.0000
	,N'One of the greatest movies of the last 200 years! This movie will make you cry, laugh, and dance. The directing is fantastic! The acting is moving! The music will make your heart tremble with emotion!'
	)

INSERT [dbo].[Movie] (
	[Id]
	,[Title]
	,[Director]
	,[DateReleased]
	,[InTheaters]
	,[BoxOfficeTotals]
	,[Description]
	)
VALUES (
	2
	,N'Star Wars II'
	,N'George Lucas'
	,CAST(0x00006E7300000000 AS DATETIME)
	,1
	,500000000.0000
	,N'One of the greatest movies of the last 200 years! This movie will make you cry, laugh, and dance. The directing is fantastic! The acting is moving! The music will make your heart tremble with emotion!'
	)

INSERT [dbo].[Movie] (
	[Id]
	,[Title]
	,[Director]
	,[DateReleased]
	,[InTheaters]
	,[BoxOfficeTotals]
	,[Description]
	)
VALUES (
	3
	,N'Jurassic Park'
	,N'Steven Spielberg'
	,CAST(0x0000855700000000 AS DATETIME)
	,1
	,400000000.0000
	,N'One of the greatest movies of the last 200 years! This movie will make you cry, laugh, and dance. The directing is fantastic! The acting is moving! The music will make your heart tremble with emotion!'
	)

INSERT [dbo].[Movie] (
	[Id]
	,[Title]
	,[Director]
	,[DateReleased]
	,[InTheaters]
	,[BoxOfficeTotals]
	,[Description]
	)
VALUES (
	4
	,N'Jaws'
	,N'Steven Spielberg'
	,CAST(0x00006B9600000000 AS DATETIME)
	,0
	,300000000.0000
	,N'One of the greatest movies of the last 200 years! This movie will make you cry, laugh, and dance. The directing is fantastic! The acting is moving! The music will make your heart tremble with emotion!'
	)

INSERT [dbo].[Movie] (
	[Id]
	,[Title]
	,[Director]
	,[DateReleased]
	,[InTheaters]
	,[BoxOfficeTotals]
	,[Description]
	)
VALUES (
	5
	,N'Ghost'
	,N'Jerry Zucker'
	,CAST(0x0000810C00000000 AS DATETIME)
	,0
	,200000000.0000
	,N'One of the greatest movies of the last 200 years! This movie will make you cry, laugh, and dance. The directing is fantastic! The acting is moving! The music will make your heart tremble with emotion!'
	)

INSERT [dbo].[Movie] (
	[Id]
	,[Title]
	,[Director]
	,[DateReleased]
	,[InTheaters]
	,[BoxOfficeTotals]
	,[Description]
	)
VALUES (
	7
	,N'Forrest Gump'
	,N'Robert Zemeckis'
	,CAST(0x000086C500000000 AS DATETIME)
	,1
	,300000000.0000
	,N'One of the greatest movies of the last 200 years! This movie will make you cry, laugh, and dance. The directing is fantastic! The acting is moving! The music will make your heart tremble with emotion!'
	)

INSERT [dbo].[Movie] (
	[Id]
	,[Title]
	,[Director]
	,[DateReleased]
	,[InTheaters]
	,[BoxOfficeTotals]
	,[Description]
	)
VALUES (
	8
	,N'Ice Age'
	,N'Chris Wedge'
	,CAST(0x0000923700000000 AS DATETIME)
	,1
	,200000000.0000
	,NULL
	)

INSERT [dbo].[Movie] (
	[Id]
	,[Title]
	,[Director]
	,[DateReleased]
	,[InTheaters]
	,[BoxOfficeTotals]
	,[Description]
	)
VALUES (
	9
	,N'Shrek'
	,N'Andrew Adamson'
	,CAST(0x000090C900000000 AS DATETIME)
	,0
	,400000000.0000
	,NULL
	)

INSERT [dbo].[Movie] (
	[Id]
	,[Title]
	,[Director]
	,[DateReleased]
	,[InTheaters]
	,[BoxOfficeTotals]
	,[Description]
	)
VALUES (
	10
	,N'Independence Day'
	,N'Roland Emmerich'
	,CAST(0x000089A200000000 AS DATETIME)
	,1
	,300000000.0000
	,NULL
	)

INSERT [dbo].[Movie] (
	[Id]
	,[Title]
	,[Director]
	,[DateReleased]
	,[InTheaters]
	,[BoxOfficeTotals]
	,[Description]
	)
VALUES (
	22
	,N'The Ring'
	,N'Gore Verbinski'
	,CAST(0x000093AD00000000 AS DATETIME)
	,1
	,100000000.0000
	,NULL
	)

SET IDENTITY_INSERT [dbo].[Movie] OFF
GO


