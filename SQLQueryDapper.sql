USE [DapperDB]
GO
/****** Object:  Table [dbo].[Company] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company]') AND type in (N'U'))
DROP TABLE [dbo].[Company]
GO
/****** Object:  StoredProcedure [dbo].[CompanyViewByID] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompanyViewByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CompanyViewByID]
GO
/****** Object:  StoredProcedure [dbo].[CompanyViewAll] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompanyViewAll]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CompanyViewAll]
GO
/****** Object:  StoredProcedure [dbo].[CompanyDeleteByID] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompanyDeleteByID]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CompanyDeleteByID]
GO
/****** Object:  StoredProcedure [dbo].[CompanyAddOrEdit] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompanyAddOrEdit]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[CompanyAddOrEdit]
GO

/****** Object:  StoredProcedure [dbo].[CompanyAddOrEdit] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompanyAddOrEdit]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[CompanyAddOrEdit]
@ID INT,
@NewGuid nvarchar(50),
@Title nvarchar(50),
@LocationLongitude float,
@LocationLatitude float,
@AddressLine2 nvarchar(50),
@PostCode nvarchar(50),
@EmployeeNumber nvarchar(50),
@AboutUs nvarchar(50),
@Image nvarchar(50)
AS

	IF @ID =0
		INSERT INTO Company(NewGuid,Title,LocationLongitude,LocationLatitude,AddressLine2,PostCode,EmployeeNumber,AboutUs,Image)
		VALUES (@NewGuid,@Title,@LocationLongitude,@LocationLatitude,@AddressLine2,@PostCode,@EmployeeNumber,@AboutUs,@Image)
	ELSE
		UPDATE Company
		SET
		NewGuid=@NewGuid,
		Title=@Title,
		LocationLongitude=@LocationLongitude,
		LocationLatitude=@LocationLatitude,
		AddressLine2=@AddressLine2,
		PostCode=@PostCode,
		EmployeeNumber=@EmployeeNumber,
		AboutUs=@AboutUs,
		Image=@Image
		WHERE ID = @ID
		' 
END
GO
/****** Object:  StoredProcedure [dbo].[CompanyDeleteByID] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompanyDeleteByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[CompanyDeleteByID]
@ID nvarchar(50)
As
	DELETE FROM Company
	WHERE ID = @ID
	' 
END
GO
/****** Object:  StoredProcedure [dbo].[CompanyViewAll] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompanyViewAll]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[CompanyViewAll]
AS
	SELECT *
	FROM Company
	' 
END
GO
/****** Object:  StoredProcedure [dbo].[CompanyViewByID] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CompanyViewByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROC [dbo].[CompanyViewByID]
@ID INT
AS
		SELECT *
		FROM Company
		WHERE ID  = @ID' 
END
GO
/****** Object:  Table [dbo].[Company] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Company]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NewGuid] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[LocationLongitude] [float] NULL,
	[LocationLatitude] [float] NULL,
	[AddressLine2] [nvarchar](50) NULL,
	[PostCode] [nvarchar](50) NULL,
	[EmployeeNumber] [nvarchar](50) NULL,
	[AboutUs] [nvarchar](50) NULL,
	[Image] [nvarchar](50) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
