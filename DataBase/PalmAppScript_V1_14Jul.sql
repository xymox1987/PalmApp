USE [PalmApp]
GO
/****** Object:  Table [dbo].[City]    Script Date: 14/07/2022 6:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] NOT NULL,
	[City] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 14/07/2022 6:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Lattitude] [float] NOT NULL,
	[Longitud] [float] NOT NULL,
	[UserId] [nvarchar](100) NOT NULL,
	[CityId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[UriImage] [nvarchar](max) NULL,
	[EventTypeId] [int] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventType]    Script Date: 14/07/2022 6:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventType](
	[EventType] [int] NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_EventType] PRIMARY KEY CLUSTERED 
(
	[EventType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Farming]    Script Date: 14/07/2022 6:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Farming](
	[FarmingId] [bigint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Lattitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[UserId] [nvarchar](100) NOT NULL,
	[CityId] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Farming] PRIMARY KEY CLUSTERED 
(
	[FarmingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friend]    Script Date: 14/07/2022 6:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friend](
	[Id] [bigint] NOT NULL,
	[UserId] [nvarchar](100) NOT NULL,
	[FriendId] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Friend] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FriendRequest]    Script Date: 14/07/2022 6:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendRequest](
	[Id] [bigint] NOT NULL,
	[UserRequestedId] [nvarchar](100) NOT NULL,
	[UserRequesterId] [nvarchar](100) NOT NULL,
	[Enabled] [bit] NOT NULL,
 CONSTRAINT [PK_FriendRequest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 14/07/2022 6:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[RoleId] [int] NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 14/07/2022 6:53:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[DocumentType] [int] NOT NULL,
	[DocumentNumber] [nvarchar](50) NOT NULL,
	[Phone] [nchar](10) NULL,
	[UrlImage] [nvarchar](200) NULL,
	[CityId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_City]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_EventType] FOREIGN KEY([EventTypeId])
REFERENCES [dbo].[EventType] ([EventType])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_EventType]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_User]
GO
ALTER TABLE [dbo].[Farming]  WITH CHECK ADD  CONSTRAINT [FK_Farming_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[Farming] CHECK CONSTRAINT [FK_Farming_City]
GO
ALTER TABLE [dbo].[Farming]  WITH CHECK ADD  CONSTRAINT [FK_Farming_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Farming] CHECK CONSTRAINT [FK_Farming_User]
GO
ALTER TABLE [dbo].[Friend]  WITH CHECK ADD  CONSTRAINT [FK_Friend_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Friend] CHECK CONSTRAINT [FK_Friend_User]
GO
ALTER TABLE [dbo].[Friend]  WITH CHECK ADD  CONSTRAINT [FK_Friend_User1] FOREIGN KEY([FriendId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Friend] CHECK CONSTRAINT [FK_Friend_User1]
GO
ALTER TABLE [dbo].[FriendRequest]  WITH CHECK ADD  CONSTRAINT [FK_FriendRequest_User] FOREIGN KEY([UserRequestedId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[FriendRequest] CHECK CONSTRAINT [FK_FriendRequest_User]
GO
ALTER TABLE [dbo].[FriendRequest]  WITH CHECK ADD  CONSTRAINT [FK_FriendRequest_User1] FOREIGN KEY([UserRequesterId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[FriendRequest] CHECK CONSTRAINT [FK_FriendRequest_User1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([CityId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_City]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Rol] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Rol] ([RoleId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Rol]
GO
