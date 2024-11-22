IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'MEU_BLOG')

BEGIN

	create database meu_blog;

END
GO
use meu_blog;

GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Blogs')
BEGIN
	CREATE TABLE [dbo].[Blogs] (
		[blogId] INT IDENTITY (1,1) NOT NULL,
		[name] NVARCHAR(200) NULL,
		[Url] NVARCHAR (200) NULL,
		CONSTRAINT [PK_dbo.Blogs] PRIMARY KEY CLUSTERED ([BlogId] ASC)

		);
END
GO

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name = 'Tabela')
BEGIN
	CREATE TABLE [dbo].[Posts] (
		[PostId] INT IDENTITY (1,1) NOT NULL,
		[Title] NVARCHAR(200) NULL,
		[Content] NTEXT NULL,
		[BlogId] INT NOT NULL,
		CONSTRAINT [PK_dbo.Posts] PRIMARY KEY CLUSTERED ([PostId] ASC),
		CONSTRAINT [FK_dbo.Posts_dbo.Blogs_BlogId]
			FOREIGN KEY ([BlogId])
			REFERENCES [dbo].[Blogs] ([BlogId])
			ON DELETE CASCADE 

	);
END
GO
