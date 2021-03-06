USE [CatalogDB]
GO
/****** Object:  Table [dbo].[AttributeGroups]    Script Date: 11/22/2017 11:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeGroups](
	[AttributeGroupId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](50) NOT NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUser] [nvarchar](50) NULL,
 CONSTRAINT [PK_AttributeGroups] PRIMARY KEY CLUSTERED 
(
	[AttributeGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 11/22/2017 11:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[AttributeId] [uniqueidentifier] NOT NULL,
	[AttributeGroupId] [uniqueidentifier] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[AttriuteValueTypeId] [uniqueidentifier] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](50) NOT NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUser] [nvarchar](50) NULL,
 CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
(
	[AttributeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttributeValueTypes]    Script Date: 11/22/2017 11:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributeValueTypes](
	[AttriuteValueTypeId] [uniqueidentifier] NOT NULL,
	[AttributeValueType] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AttributeValueTypes] PRIMARY KEY CLUSTERED 
(
	[AttriuteValueTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 11/22/2017 11:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [uniqueidentifier] NOT NULL,
	[ParentId] [uniqueidentifier] NULL,
	[Name] [nvarchar](50) NOT NULL,
	[DisplayName] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](50) NOT NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUser] [nvarchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAttributes]    Script Date: 11/22/2017 11:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAttributes](
	[ProductAttributeId] [uniqueidentifier] NOT NULL,
	[ProductId] [uniqueidentifier] NOT NULL,
	[AttributeId] [uniqueidentifier] NOT NULL,
	[AttributeValue] [nvarchar](50) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](50) NOT NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUser] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCategories]    Script Date: 11/22/2017 11:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategories](
	[ProductId] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ProductCategories] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 11/22/2017 11:42:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [nvarchar](50) NOT NULL,
	[ModifyDate] [datetime] NULL,
	[ModifyUser] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attributes]  WITH CHECK ADD  CONSTRAINT [FK_Attributes_AttributeGroups] FOREIGN KEY([AttributeGroupId])
REFERENCES [dbo].[AttributeGroups] ([AttributeGroupId])
GO
ALTER TABLE [dbo].[Attributes] CHECK CONSTRAINT [FK_Attributes_AttributeGroups]
GO
ALTER TABLE [dbo].[Attributes]  WITH CHECK ADD  CONSTRAINT [FK_Attributes_AttributeValueTypes] FOREIGN KEY([AttriuteValueTypeId])
REFERENCES [dbo].[AttributeValueTypes] ([AttriuteValueTypeId])
GO
ALTER TABLE [dbo].[Attributes] CHECK CONSTRAINT [FK_Attributes_AttributeValueTypes]
GO
ALTER TABLE [dbo].[ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributes_Attributes] FOREIGN KEY([AttributeId])
REFERENCES [dbo].[Attributes] ([AttributeId])
GO
ALTER TABLE [dbo].[ProductAttributes] CHECK CONSTRAINT [FK_ProductAttributes_Attributes]
GO
ALTER TABLE [dbo].[ProductAttributes]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttributes_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ProductAttributes] CHECK CONSTRAINT [FK_ProductAttributes_Products]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryId])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Categories]
GO
ALTER TABLE [dbo].[ProductCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategories_Products] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([ProductId])
GO
ALTER TABLE [dbo].[ProductCategories] CHECK CONSTRAINT [FK_ProductCategories_Products]
GO
