USE [KargoTakip]
GO
/****** Object:  Table [dbo].[Hareketler]    Script Date: 11.01.2025 09:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hareketler](
	[HareketID] [int] IDENTITY(1,1) NOT NULL,
	[KargoID] [int] NOT NULL,
	[Tarih] [datetime2](7) NOT NULL,
	[Durum] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Hareketler] PRIMARY KEY CLUSTERED 
(
	[HareketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kargolar]    Script Date: 11.01.2025 09:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kargolar](
	[KargoID] [int] IDENTITY(1,1) NOT NULL,
	[GondericiTelefonu] [nvarchar](max) NOT NULL,
	[AliciAdresi] [nvarchar](max) NOT NULL,
	[Durum] [nvarchar](max) NULL,
	[KullaniciID] [int] NULL,
	[AliciAd] [nvarchar](max) NOT NULL,
	[AliciIl] [nvarchar](max) NOT NULL,
	[AliciIlce] [nvarchar](max) NOT NULL,
	[AliciTelefonu] [nvarchar](max) NOT NULL,
	[GondericiAd] [nvarchar](max) NOT NULL,
	[GondericiAdresi] [nvarchar](max) NOT NULL,
	[GondericiIl] [nvarchar](max) NOT NULL,
	[GondericiIlce] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Kargolar] PRIMARY KEY CLUSTERED 
(
	[KargoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 11.01.2025 09:42:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[AdSoyad] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Sifre] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Kargolar] ADD  DEFAULT (N'') FOR [AliciAd]
GO
ALTER TABLE [dbo].[Kargolar] ADD  DEFAULT (N'') FOR [AliciIl]
GO
ALTER TABLE [dbo].[Kargolar] ADD  DEFAULT (N'') FOR [AliciIlce]
GO
ALTER TABLE [dbo].[Kargolar] ADD  DEFAULT (N'') FOR [AliciTelefonu]
GO
ALTER TABLE [dbo].[Kargolar] ADD  DEFAULT (N'') FOR [GondericiAd]
GO
ALTER TABLE [dbo].[Kargolar] ADD  DEFAULT (N'') FOR [GondericiAdresi]
GO
ALTER TABLE [dbo].[Kargolar] ADD  DEFAULT (N'') FOR [GondericiIl]
GO
ALTER TABLE [dbo].[Kargolar] ADD  DEFAULT (N'') FOR [GondericiIlce]
GO
ALTER TABLE [dbo].[Hareketler]  WITH CHECK ADD  CONSTRAINT [FK_Hareketler_Kargolar_KargoID] FOREIGN KEY([KargoID])
REFERENCES [dbo].[Kargolar] ([KargoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Hareketler] CHECK CONSTRAINT [FK_Hareketler_Kargolar_KargoID]
GO
ALTER TABLE [dbo].[Kargolar]  WITH CHECK ADD  CONSTRAINT [FK_Kargolar_Kullanicilar_KullaniciID] FOREIGN KEY([KullaniciID])
REFERENCES [dbo].[Kullanicilar] ([KullaniciID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Kargolar] CHECK CONSTRAINT [FK_Kargolar_Kullanicilar_KullaniciID]
GO
