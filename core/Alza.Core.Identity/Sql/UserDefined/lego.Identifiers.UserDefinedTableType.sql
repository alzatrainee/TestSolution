USE [Projects]
GO
/****** Object:  UserDefinedTableType [lego].[Identifiers]    Script Date: 25.11.2016 17:56:44 ******/
DROP TYPE [lego].[Identifiers]
GO
/****** Object:  UserDefinedTableType [lego].[Identifiers]    Script Date: 25.11.2016 17:56:44 ******/
CREATE TYPE [lego].[Identifiers] AS TABLE(
	[Id] [int] NOT NULL,
	PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (IGNORE_DUP_KEY = OFF)
)
GO
GRANT EXECUTE ON TYPE::[lego].[Identifiers] TO [ProjectNET] AS [dbo]
GO
