
/* Drop Foreign Key Constraints */

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_ProductCategory_Category]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [lego].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_Category]
GO

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[FK_ProductCategory_Products]') AND OBJECTPROPERTY(id, 'IsForeignKey') = 1) 
ALTER TABLE [lego].[ProductCategory] DROP CONSTRAINT [FK_ProductCategory_Products]
GO

/* Drop Tables */

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = object_id('[lego].[ProductCategory]') AND OBJECTPROPERTY(id, 'IsUserTable') = 1) 
DROP TABLE [lego].[ProductCategory]
GO

/* Create Tables */

CREATE TABLE [lego].[ProductCategory]
(
	[ProductId] int NOT NULL,
	[CategoryId] int NOT NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [lego].[ProductCategory] 
 ADD CONSTRAINT [PK_ProductCategory]
	PRIMARY KEY CLUSTERED ([ProductId],[CategoryId])
GO

CREATE INDEX [IXFK_ProductCategory_Category] 
 ON [lego].[ProductCategory] ([CategoryId] ASC)
GO

CREATE INDEX [IXFK_ProductCategory_Products] 
 ON [lego].[ProductCategory] ([ProductId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [lego].[ProductCategory] ADD CONSTRAINT [FK_ProductCategory_Category]
	FOREIGN KEY ([CategoryId]) REFERENCES [lego].[Category] ([Id]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [lego].[ProductCategory] ADD CONSTRAINT [FK_ProductCategory_Products]
	FOREIGN KEY ([ProductId]) REFERENCES [lego].[Products] ([Id]) ON DELETE No Action ON UPDATE No Action
GO