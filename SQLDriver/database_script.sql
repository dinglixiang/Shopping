SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[users]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[users](
	[user_email] [varchar](50) NULL,
	[user_password] [varchar](50) NULL,
	[user_confirmpassword] [varchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[products]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[products](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[product_name] [nvarchar](50) NULL,
	[product_price] [float] NULL,
	[product_describe] [text] NULL,
	[product_sales] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[orders]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[orders](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[order_product_name] [nvarchar](50) NULL,
	[order_receiver] [nchar](10) NULL,
	[order_address] [nvarchar](50) NULL,
	[order_tel] [nvarchar](50) NULL
) ON [PRIMARY]
END
