USE [QLCAOOC]
GO
/****** Object:  Table [dbo].[CHITIETHOPDONG]    Script Date: 5/17/2018 3:33:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CHITIETHOPDONG](
	[MaHD] [varchar](5) NOT NULL,
	[MaPHG] [varchar](5) NOT NULL,
	[ThoiGianThue] [int] NULL,
 CONSTRAINT [PK_CHITIETHOPDONG] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC,
	[MaPHG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CONGTY]    Script Date: 5/17/2018 3:33:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CONGTY](
	[MaCongTy] [varchar](5) NOT NULL,
	[TenCT] [nvarchar](50) NULL,
	[DiaChiCT] [nvarchar](50) NULL,
	[SDT] [nvarchar](12) NULL,
	[MaHD] [varchar](5) NOT NULL,
 CONSTRAINT [PK_CONGTY] PRIMARY KEY CLUSTERED 
(
	[MaCongTy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HOPDONG]    Script Date: 5/17/2018 3:33:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HOPDONG](
	[MaHD] [varchar](5) NOT NULL,
	[NgayLap] [datetime] NULL,
	[TienCoc] [int] NULL,
 CONSTRAINT [PK_HOPDONG] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 5/17/2018 3:33:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[MaNV] [varchar](5) NOT NULL,
	[TenNV] [nvarchar](50) NULL,
	[DiaChiNV] [nvarchar](50) NULL,
	[SDTNV] [nvarchar](10) NULL,
	[HinhAnh] [varchar](50) NULL,
	[ChucVu] [nvarchar](30) NULL,
	[MaCongTy] [varchar](5) NOT NULL,
	[MaPHG] [varchar](5) NOT NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHIEUGIAHAN]    Script Date: 5/17/2018 3:33:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHIEUGIAHAN](
	[MaPhieuGiaHan] [varchar](5) NOT NULL,
	[NgayGiaHan] [datetime] NULL,
	[NgayHetHan] [datetime] NULL,
	[MaHD] [varchar](5) NULL,
	[MaPHG] [varchar](5) NULL,
 CONSTRAINT [PK_PHIEUGIAHAN] PRIMARY KEY CLUSTERED 
(
	[MaPhieuGiaHan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHONG]    Script Date: 5/17/2018 3:33:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHONG](
	[MaPHG] [varchar](5) NOT NULL,
	[TenPHG] [nvarchar](50) NULL,
	[Tang] [int] NOT NULL,
	[DienTich] [int] NOT NULL,
 CONSTRAINT [PK_PHONG] PRIMARY KEY CLUSTERED 
(
	[MaPHG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TAIKHOAN]    Script Date: 5/17/2018 3:33:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TAIKHOAN](
	[MaTK] [varchar](5) NOT NULL,
	[TenDN] [varchar](50) NULL,
	[MatKhau] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TANG]    Script Date: 5/17/2018 3:33:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TANG](
	[Tang] [int] NOT NULL,
	[DienTich] [int] NOT NULL,
	[Gia] [nchar](10) NOT NULL,
 CONSTRAINT [PK_TANG] PRIMARY KEY CLUSTERED 
(
	[Tang] ASC,
	[DienTich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THAMSO]    Script Date: 5/17/2018 3:33:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THAMSO](
	[MaTS] [varchar](5) NOT NULL,
	[TenTS] [nvarchar](50) NULL,
	[GiaTriTS] [int] NULL,
 CONSTRAINT [PK_THAMSO] PRIMARY KEY CLUSTERED 
(
	[MaTS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'1', N'1', 9)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'10', N'10', 10)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'11', N'11', 6)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'12', N'12', 11)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'13', N'13', 22)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'14', N'14', 7)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'15', N'15', 13)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'16', N'16', 6)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'17', N'17', 8)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'18', N'18', 9)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'19', N'19', 21)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'2', N'2', 17)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'20', N'20', 19)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'3', N'3', 12)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'4', N'4', 16)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'5', N'5', 21)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'6', N'6', 14)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'7', N'7', 16)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'8', N'8', 20)
INSERT [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG], [ThoiGianThue]) VALUES (N'9', N'9', 15)
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'1', N'McDONALD', N'12 Charles Delea', N'490-118-5583', N'1')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'10', N'FPT SOFTWARE', N'64 Juan Laidlaw', N'259-333-0141', N'10')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'11', N'GLOBAL CYBERSOFT', N'68 Sherie Sidlow', N'770-830-0203', N'11')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'12', N'HARVEY NASH', N'974 Hermia Yaldren', N'223-311-9416', N'12')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'13', N'FUJINET', N'145 Davis Newvill', N'462-266-3865', N'13')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'14', N'DIGI-TEXX', N'156 Sansone Durran', N'231-999-0634', N'14')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'15', N'KMS TECHNOLOGY', N'124 Maddie Adamthwaite', N'225-569-1962', N'15')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'16', N'TMA SOLUTIONS', N'675 Kerrill Puttick', N'147-556-5658', N'16')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'17', N'MK SMART', N'564 Valencia Flynn', N'534-659-2938', N'17')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'18', N'INTERNATIONAL BUSINESS MACHINE', N'325 Bernita Bamlet', N'270-248-5522', N'18')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'19', N'MICROSOFT COMPANY', N'79 Ricky Karby', N'454-742-7545', N'19')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'2', N'HIGHLANDS Coffee', N'54 Darin Trainer', N'757-942-3707', N'2')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'20', N'ORACLE', N'55 Henrik Dimmer', N'331-622-8247', N'20')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'3', N'STARBUCKS', N'98 Shandee Gateshill', N'284-871-6762', N'3')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'4', N'PHÚC LONG Coffee', N'123 Lou Worg', N'223-881-6293', N'4')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'5', N'THE COFFEE HOUSE', N'86 Merry Costall', N'678-453-1532', N'5')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'6', N'ORIENT SOFTWARE', N'45 Rusty Kiddell', N'601-839-1862', N'6')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'7', N'PIZZA COMPANY', N'64 Charmian Arnholtz', N'964-938-4039', N'7')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'8', N'JOLIE PEE', N'75 Matelda Corbin', N'540-195-9778', N'8')
INSERT [dbo].[CONGTY] ([MaCongTy], [TenCT], [DiaChiCT], [SDT], [MaHD]) VALUES (N'9', N'LOTTERIA', N'24 Augustus Surr', N'917-744-7575', N'9')
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'1', CAST(N'2017-09-26 00:00:00.000' AS DateTime), 7300000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'10', CAST(N'2017-04-28 00:00:00.000' AS DateTime), 8300000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'11', CAST(N'2018-03-15 00:00:00.000' AS DateTime), 5400000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'12', CAST(N'2017-07-15 00:00:00.000' AS DateTime), 6100000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'13', CAST(N'2017-11-11 00:00:00.000' AS DateTime), 7600000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'14', CAST(N'2017-12-18 00:00:00.000' AS DateTime), 7800000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'15', CAST(N'2017-10-02 00:00:00.000' AS DateTime), 8000000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'16', CAST(N'2017-05-30 00:00:00.000' AS DateTime), 9300000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'17', CAST(N'2017-12-04 00:00:00.000' AS DateTime), 8900000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'18', CAST(N'2018-02-06 00:00:00.000' AS DateTime), 6700000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'19', CAST(N'2017-06-24 00:00:00.000' AS DateTime), 5900000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'2', CAST(N'2018-01-22 00:00:00.000' AS DateTime), 5100000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'20', CAST(N'2018-02-28 00:00:00.000' AS DateTime), 8100000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'3', CAST(N'2017-06-10 00:00:00.000' AS DateTime), 9100000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'4', CAST(N'2017-10-02 00:00:00.000' AS DateTime), 8500000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'5', CAST(N'2017-07-29 00:00:00.000' AS DateTime), 6400000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'6', CAST(N'2018-03-11 00:00:00.000' AS DateTime), 9600000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'7', CAST(N'2018-01-05 00:00:00.000' AS DateTime), 7400000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'8', CAST(N'2018-02-27 00:00:00.000' AS DateTime), 7600000)
INSERT [dbo].[HOPDONG] ([MaHD], [NgayLap], [TienCoc]) VALUES (N'9', CAST(N'2017-08-30 00:00:00.000' AS DateTime), 7300000)
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'1', N'Gwyneth Le Sarr', N'Ricky De Mitris', N'3801616618', N'1.jpg', N'Giam doc', N'1', N'1')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'10', N'Karil Andrichak', N'Amble Sandom', N'7409796594', N'', N'Nhan vien', N'1', N'1')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'100', N'Farris Vasiltsov', N'Rivkah Brailsford', N'1698332070', N'', N'Nhan vien', N'10', N'10')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'101', N'Morgana Ornils', N'Trumann Tinker', N'3336854764', N'11.png', N'Giam doc', N'11', N'11')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'102', N'Iseabal Qualtro', N'Emerson Shanks', N'2721953820', N'', N'Nhan vien', N'11', N'11')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'103', N'Charisse Everson', N'Rosalinde Strettell', N'5442544138', N'', N'Nhan vien', N'11', N'11')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'104', N'Elladine Geke', N'Leela Glowacha', N'7734887347', N'', N'Nhan vien', N'11', N'11')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'105', N'Erna Godley', N'Sidoney Skirvin', N'1366914910', N'', N'Nhan vien', N'11', N'11')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'106', N'Althea Havoc', N'Gabriele Winger', N'2551452476', N'', N'Nhan vien', N'11', N'11')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'107', N'Victoria Avrahamof', N'Quincy Royste', N'1155545405', N'', N'Nhan vien', N'11', N'11')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'108', N'Ali Dockrill', N'Hailee Quilligan', N'2202460352', N'', N'Nhan vien', N'11', N'11')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'109', N'Karrah Craigmile', N'Luther Ilett', N'2803075083', N'', N'Nhan vien', N'11', N'11')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'11', N'Teddy Leathe', N'Darill Pimer', N'6733769169', N'2.jpg', N'Giam doc', N'2', N'2')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'110', N'Elroy Cabena', N'Lizabeth Dannett', N'3819142466', N'', N'Nhan vien', N'11', N'11')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'111', N'Jameson Chudleigh', N'Con Riditch', N'8248703344', N'', N'Giam doc', N'12', N'12')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'112', N'Datha Barbara', N'Izak Areles', N'6898341848', N'12.jpg', N'Nhan vien', N'12', N'12')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'113', N'Kinnie Kruszelnicki', N'Arlan Sutherns', N'7856322852', N'', N'Nhan vien', N'12', N'12')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'114', N'Mathe Ivel', N'Edithe Sallowaye', N'1944026400', N'', N'Nhan vien', N'12', N'12')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'115', N'Sullivan Beining', N'Tynan Girhard', N'1822987621', N'', N'Nhan vien', N'12', N'12')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'116', N'Elita Muffin', N'Rob Mott', N'1306880849', N'', N'Nhan vien', N'12', N'12')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'117', N'Keary Castro', N'Zonnya Leindecker', N'1852941088', N'', N'Nhan vien', N'12', N'12')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'118', N'Emmott Aldcorn', N'Bobbe Guitt', N'46032599', N'', N'Nhan vien', N'12', N'12')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'119', N'Concordia Lamborn', N'Consuelo Littleover', N'1816058048', N'', N'Nhan vien', N'12', N'12')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'12', N'Eda Slides', N'Kimmie Hullin', N'9406739411', N'', N'Nhan vien', N'2', N'2')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'120', N'Joshuah Doige', N'Philly Sreenan', N'8799751813', N'', N'Nhan vien', N'12', N'12')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'121', N'Bret Lorek', N'Matti Cass', N'4898533108', N'13.jpg', N'Giam doc', N'13', N'13')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'122', N'Pascal Haukey', N'Leena Stainson', N'9553545745', N'', N'Nhan vien', N'13', N'13')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'123', N'Peadar Jonas', N'Dale Dacke', N'5624072819', N'', N'Nhan vien', N'13', N'13')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'124', N'Mark Glawsop', N'Homere Austing', N'2972192271', N'', N'Nhan vien', N'13', N'13')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'125', N'Tommy Testo', N'Shannen Cryer', N'4762636044', N'', N'Nhan vien', N'13', N'13')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'126', N'Mari Hacking', N'Phillie Portman', N'5308046557', N'', N'Nhan vien', N'13', N'13')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'127', N'Myca Kemetz', N'Jana Kenion', N'7424884202', N'', N'Nhan vien', N'13', N'13')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'128', N'Claudius Colam', N'Lazar Dash', N'3338776219', N'', N'Nhan vien', N'13', N'13')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'129', N'Nicolais Twidle', N'Maddie Cowpland', N'6233225899', N'', N'Nhan vien', N'13', N'13')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'13', N'Rafa McGibbon', N'Sibyl Graver', N'8111095332', N'', N'Nhan vien', N'2', N'2')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'130', N'Ferdinand Glynne', N'Gabbi Nicholson', N'7002339491', N'', N'Nhan vien', N'13', N'13')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'131', N'Angela Pascoe', N'Jeremiah Tabbernor', N'2082101671', N'14.jpg', N'Giam doc', N'14', N'14')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'132', N'Oberon Thowes', N'Dacey Glazzard', N'3387990890', N'', N'Nhan vien', N'14', N'14')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'133', N'Tucker Preto', N'Marta Siddeley', N'9529901836', N'', N'Nhan vien', N'14', N'14')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'134', N'Lauri Castanos', N'Marilin Silcock', N'220146640', N'', N'Nhan vien', N'14', N'14')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'135', N'Opalina Keeri', N'Shandeigh Seage', N'4686384563', N'', N'Nhan vien', N'14', N'14')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'136', N'Fionna Saltern', N'Orella Brosh', N'2191135189', N'', N'Nhan vien', N'14', N'14')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'137', N'Ronnie Barthorpe', N'Jo ann Egdal', N'4703816584', N'', N'Nhan vien', N'14', N'14')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'138', N'Ewen Goodsell', N'Shandee Gilburt', N'5696705896', N'', N'Nhan vien', N'14', N'14')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'139', N'Heidie Confait', N'Rouvin Peachman', N'8777779262', N'', N'Nhan vien', N'14', N'14')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'14', N'Noland Faragan', N'Doris Giacobilio', N'6208832809', N'', N'Nhan vien', N'2', N'2')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'140', N'Erma Feldfisher', N'Yoko Sahnow', N'783981980', N'', N'Nhan vien', N'14', N'14')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'141', N'Yoshi Trodler', N'Roman Bewly', N'3939548524', N'15.jpg', N'Giam doc', N'15', N'15')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'142', N'Alix Gulvin', N'Vanda Gostage', N'3213237552', N'', N'Nhan vien', N'15', N'15')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'143', N'Biron Mulkerrins', N'Murvyn Andrioni', N'5158987881', N'', N'Nhan vien', N'15', N'15')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'144', N'Selia Huckle', N'Shanda Cownden', N'6163696577', N'', N'Nhan vien', N'15', N'15')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'145', N'Buck Burkill', N'Zelda Edards', N'1211210858', N'', N'Nhan vien', N'15', N'15')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'146', N'Skippy Radclyffe', N'Alejoa Kitchiner', N'5292574069', N'', N'Nhan vien', N'15', N'15')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'147', N'Elsie Briers', N'Chantalle Merrigans', N'9106487891', N'', N'Nhan vien', N'15', N'15')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'148', N'Ernesto Buntin', N'Alvin Pinniger', N'3669361848', N'', N'Nhan vien', N'15', N'15')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'149', N'Krispin Dunning', N'Torry Sickamore', N'560602689', N'', N'Nhan vien', N'15', N'15')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'15', N'Colman Sepey', N'Mike Vinall', N'1227788631', N'', N'Nhan vien', N'2', N'2')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'150', N'Kynthia Loveridge', N'Ennis MacBey', N'5184555520', N'', N'Nhan vien', N'15', N'15')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'151', N'Caddric Sandells', N'Tarrance Danielot', N'3511792341', N'16.jpg', N'Giam doc', N'16', N'16')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'152', N'Jelene Fennelow', N'Julita Drysdall', N'6493544363', N'', N'Nhan vien', N'16', N'16')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'153', N'Delphine Kinnear', N'Leroi Toward', N'3388563418', N'', N'Nhan vien', N'16', N'16')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'154', N'Boris Beelby', N'Germaine Paslow', N'2731329613', N'', N'Nhan vien', N'16', N'16')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'155', N'Abdel Stanlock', N'Lion Rauprich', N'4855917836', N'', N'Nhan vien', N'16', N'16')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'156', N'Fianna Tomaselli', N'Art Hazelton', N'2223614542', N'', N'Nhan vien', N'16', N'16')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'157', N'Tisha Lowle', N'Paquito Izhaky', N'6615401362', N'', N'Nhan vien', N'16', N'16')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'158', N'Luke Norvill', N'Darcy Aldwich', N'7635931061', N'', N'Nhan vien', N'16', N'16')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'159', N'Ora Pattinson', N'Connie Brimble', N'5955334716', N'', N'Nhan vien', N'16', N'16')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'16', N'Othilie MacFarlan', N'Reid Pixton', N'2512061358', N'', N'Nhan vien', N'2', N'2')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'160', N'Enoch Reedshaw', N'Gregory Salaman', N'9736874397', N'', N'Nhan vien', N'16', N'16')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'161', N'Read Strutz', N'Brander MacColgan', N'3917950073', N'17.jpg', N'Giam doc', N'17', N'17')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'162', N'Anna-diana Ricart', N'Riley Wigfield', N'5467193569', N'', N'Nhan vien', N'17', N'17')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'163', N'Gretta Ralph', N'Norry Caulliere', N'6443370626', N'', N'Nhan vien', N'17', N'17')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'164', N'Colly Braams', N'Matt Frounks', N'7705907696', N'', N'Nhan vien', N'17', N'17')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'165', N'Albina Cholmondeley', N'Rozelle Tucsell', N'1242420922', N'', N'Nhan vien', N'17', N'17')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'166', N'Iona Barge', N'Minda Nairns', N'8006260821', N'', N'Nhan vien', N'17', N'17')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'167', N'Joshua Feavers', N'Doria Dodshun', N'3737557027', N'', N'Nhan vien', N'17', N'17')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'168', N'Joyce Kenwin', N'Alix Gaisford', N'5965625498', N'', N'Nhan vien', N'17', N'17')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'169', N'Dasie Dinwoodie', N'Emile Sposito', N'1352480208', N'', N'Nhan vien', N'17', N'17')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'17', N'Monique Probbin', N'Jodie Dahlgren', N'9177115358', N'', N'Nhan vien', N'2', N'2')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'170', N'Mercy Nilges', N'Patton Petracchi', N'4455199501', N'', N'Nhan vien', N'17', N'17')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'171', N'Domini Avrasin', N'Ardith Rushmer', N'7019433452', N'18.jpg', N'Giam doc', N'18', N'18')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'172', N'Ingaborg Biasotti', N'La verne Hannigane', N'5329327497', N'', N'Nhan vien', N'18', N'18')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'173', N'Annalise Townsend', N'Hanna McQuarrie', N'7072505255', N'', N'Nhan vien', N'18', N'18')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'174', N'Roscoe Frier', N'Gabriele Donativo', N'1075987003', N'', N'Nhan vien', N'18', N'18')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'175', N'Staford Scotson', N'Lavinie Brenard', N'2751754312', N'', N'Nhan vien', N'18', N'18')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'176', N'Josie Neising', N'Merill Tatham', N'7953717604', N'', N'Nhan vien', N'18', N'18')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'177', N'Joanne Chidwick', N'Bartlet Brennand', N'3111506913', N'', N'Nhan vien', N'18', N'18')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'178', N'Madonna Annwyl', N'Mable Dainty', N'1579291149', N'', N'Nhan vien', N'18', N'18')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'179', N'Val A''Barrow', N'Gilli de Clerk', N'4918571354', N'', N'Nhan vien', N'18', N'18')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'18', N'Shermy Booeln', N'Tarrance Christiensen', N'5826718255', N'', N'Nhan vien', N'2', N'2')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'180', N'Valina Tomsa', N'Marianne Demangeon', N'907650430', N'', N'Nhan vien', N'18', N'18')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'181', N'Rockie Dewes', N'Margery MacGraith', N'850729232', N'19.jpg', N'Giam doc', N'19', N'19')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'182', N'Stephana Effemy', N'Kent Plaunch', N'9494131669', N'', N'Nhan vien', N'19', N'19')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'183', N'Al Sperwell', N'Bianca Leaton', N'6424582216', N'', N'Nhan vien', N'19', N'19')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'184', N'Armstrong Wagenen', N'Lissa Exley', N'1068680744', N'', N'Nhan vien', N'19', N'19')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'185', N'Hussein Florio', N'Ilse Burleigh', N'1035409129', N'', N'Nhan vien', N'19', N'19')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'186', N'Iormina Huyge', N'Pavel Langrick', N'9759682325', N'', N'Nhan vien', N'19', N'19')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'187', N'Guido Martignon', N'Almire Dudderidge', N'7145309880', N'', N'Nhan vien', N'19', N'19')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'188', N'Melany Pettett', N'Saul Steffan', N'9418281550', N'', N'Nhan vien', N'19', N'19')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'189', N'Stoddard Avrashin', N'Brandea Umbert', N'60967914', N'', N'Nhan vien', N'19', N'19')
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'19', N'Caprice Ivanyushkin', N'Grete Bramont', N'9966641447', N'', N'Nhan vien', N'2', N'2')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'190', N'Seumas Danick', N'Sunny Sacaze', N'2034945770', N'', N'Nhan vien', N'19', N'19')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'191', N'Carmon Cartmael', N'Jerri Withams', N'1924041222', N'20.png', N'Giam doc', N'20', N'20')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'192', N'Tabby Infante', N'Harlene Boyford', N'2155946155', N'', N'Nhan vien', N'20', N'20')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'193', N'Ravid Rapin', N'Jethro Massie', N'8845645846', N'', N'Nhan vien', N'20', N'20')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'194', N'Latrina Powys', N'Bertrand Birks', N'2917754598', N'', N'Nhan vien', N'20', N'20')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'195', N'Adi Kinghorn', N'Merill Gallanders', N'1227389084', N'', N'Nhan vien', N'20', N'20')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'196', N'Raynell Pitt', N'Kiley Ordidge', N'1206560271', N'', N'Nhan vien', N'20', N'20')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'197', N'Anjela Morrissey', N'Gun Jebb', N'6885286188', N'', N'Nhan vien', N'20', N'20')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'198', N'Priscilla Hollyer', N'Neall Dowears', N'7767149925', N'', N'Nhan vien', N'20', N'20')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'199', N'Jamill Hanfrey', N'Reade Quinsee', N'3283006746', N'', N'Nhan vien', N'20', N'20')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'2', N'Perry Fox', N'Flossie Kirkby', N'1359782730', N'', N'Nhan vien', N'1', N'1')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'20', N'Gareth Gravenor', N'Anatol Utton', N'5297708965', N'', N'Nhan vien', N'2', N'2')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'200', N'Francisca Bamell', N'Buddy Betser', N'7681088884', N'', N'Nhan vien', N'20', N'20')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'201', N'abc', N'fjdlfj', N'0123456789', N'21.jpg', N'nhan vien', N'4', N'1')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'21', N'Lanae Raffin', N'Aurthur MacKaig', N'5443187772', N'3.jpg', N'Giam doc', N'3', N'3')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'22', N'Nataline Lenney', N'Enrichetta Keelinge', N'19691815', N'', N'Nhan vien', N'3', N'3')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'23', N'Isidor Hartropp', N'Windy Whitty', N'6122388020', N'', N'Nhan vien', N'3', N'3')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'24', N'Rock Haughey', N'Shay Crinkley', N'2975280247', N'', N'Nhan vien', N'3', N'3')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'25', N'Dory Eastlake', N'Clarinda Eliet', N'5158965955', N'', N'Nhan vien', N'3', N'3')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'26', N'Kaja Fardon', N'Maurine Goodding', N'9956465782', N'', N'Nhan vien', N'3', N'3')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'27', N'Porter Stebles', N'Mikol Piller', N'6992016611', N'', N'Nhan vien', N'3', N'3')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'28', N'Phillipe BURWIN', N'Spense Churchman', N'6413833327', N'', N'Nhan vien', N'3', N'3')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'29', N'Millie Grouvel', N'Robina Atcock', N'2845305327', N'', N'Nhan vien', N'3', N'3')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'3', N'Tanya Bocke', N'Anne-marie McLleese', N'7756831544', N'', N'Nhan vien', N'1', N'1')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'30', N'Alleyn Chomley', N'Christophorus Bester', N'1044962834', N'', N'Nhan vien', N'3', N'3')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'31', N'Leonora Pearn', N'Stephanie Halbeard', N'2754989156', N'4.jpg', N'Giam doc', N'4', N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'32', N'Saloma Brislane', N'Meg Lynock', N'9297466806', N'', N'Nhan vien', N'4', N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'33', N'Susana Halfacre', N'Michele Clague', N'9392990149', N'', N'Nhan vien', N'4', N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'34', N'Bertina Pettendrich', N'Anson Bly', N'3792970709', N'', N'Nhan vien', N'4', N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'35', N'Karita Klimschak', N'Blakeley Meneo', N'9993568212', N'', N'Nhan vien', N'4', N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'36', N'Darius Haythorn', N'Winslow Worledge', N'2546535205', N'', N'Nhan vien', N'4', N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'37', N'Bronson Mallalieu', N'Marwin Pickersail', N'2854265132', N'', N'Nhan vien', N'4', N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'38', N'Hart Clewlow', N'Orion Abramowitz', N'6595961076', N'', N'Nhan vien', N'4', N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'39', N'Glen Fahrenbacher', N'Marie-jeanne Abramowsky', N'9554946148', N'', N'Nhan vien', N'4', N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'4', N'Jean Dahmke', N'Benjy Lawrenson', N'4519254222', N'', N'Nhan vien', N'1', N'1')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'40', N'Katinka Maylam', N'Allyce Butner', N'1371536490', N'', N'Nhan vien', N'4', N'4')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'41', N'Clemmy Penticost', N'Archaimbaud Hurche', N'7469400133', N'5.jpg', N'Giam doc', N'5', N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'42', N'Gill Hattiff', N'Vanda Stood', N'2603122586', N'', N'Nhan vien', N'5', N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'43', N'Cristie Iston', N'Hewie Gilhool', N'9884699106', N'', N'Nhan vien', N'5', N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'44', N'Asher Adderley', N'Lucia Gouge', N'869262921', N'', N'Nhan vien', N'5', N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'45', N'Mufi Dix', N'Padgett Shutte', N'8748290195', N'', N'Nhan vien', N'5', N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'46', N'Selina Shewery', N'Robin Northcott', N'3842756763', N'', N'Nhan vien', N'5', N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'47', N'Markos Camlin', N'Gabe Starkey', N'2583418619', N'', N'Nhan vien', N'5', N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'48', N'Kendall Ryal', N'Caleb Zellner', N'2906422575', N'', N'Nhan vien', N'5', N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'49', N'Jerrine Neads', N'Hatty Throughton', N'8862594419', N'', N'Nhan vien', N'5', N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'5', N'Silvano Undrill', N'Ulrika Ferrulli', N'3725305507', N'', N'Nhan vien', N'1', N'1')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'50', N'Lev Coskerry', N'Percival Allix', N'5144276652', N'', N'Nhan vien', N'5', N'5')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'51', N'Fidelio Toombs', N'Cassondra Kinvig', N'5742162862', N'6.jpg', N'Giam doc', N'6', N'6')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'52', N'Gunther Dougher', N'Kleon Yaakov', N'8954391258', N'', N'Nhan vien', N'6', N'6')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'53', N'Felipe Slowly', N'Jeanelle Weedenburg', N'3461030956', N'', N'Nhan vien', N'6', N'6')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'54', N'Manuel Rain', N'Bronny Sulland', N'3923234914', N'', N'Nhan vien', N'6', N'6')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'55', N'Min Morris', N'Gabrila Tidmarsh', N'6663458054', N'', N'Nhan vien', N'6', N'6')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'56', N'Kristo Poupard', N'Ly Seide', N'8786224044', N'', N'Nhan vien', N'6', N'6')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'57', N'Damian Banner', N'Honey Gownge', N'92351773', N'', N'Nhan vien', N'6', N'6')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'58', N'Prudence Hardstaff', N'Clemmie Payn', N'4599500', N'', N'Nhan vien', N'6', N'6')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'59', N'Otis Brumhead', N'Chaunce Bannell', N'4231614664', N'', N'Nhan vien', N'6', N'6')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'6', N'Clara Lidgey', N'Cherey Depper', N'3335131098', N'', N'Nhan vien', N'1', N'1')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'60', N'Dusty Wind', N'Lani Woodger', N'4283020980', N'', N'Nhan vien', N'6', N'6')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'61', N'Izaak Matushevich', N'Ashlee Berntsson', N'7948807658', N'7.jpg', N'Giam doc', N'7', N'7')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'62', N'Amalea Shayler', N'Bryna Murra', N'9493216835', N'', N'Nhan vien', N'7', N'7')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'63', N'Kalindi Jenney', N'Mehetabel Bulger', N'6333263317', N'', N'Nhan vien', N'7', N'7')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'64', N'Ashia Wesker', N'Leonore McCorrie', N'3885400238', N'', N'Nhan vien', N'7', N'7')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'65', N'Raoul Bearns', N'Mignon Pawlik', N'6763205049', N'', N'Nhan vien', N'7', N'7')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'66', N'Gardener Webburn', N'Ede Vanyatin', N'7798473969', N'', N'Nhan vien', N'7', N'7')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'67', N'Lee Rama', N'Harrie Lapish', N'4178007810', N'', N'Nhan vien', N'7', N'7')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'68', N'Nonnah Lytlle', N'Abigael Etuck', N'9957747955', N'', N'Nhan vien', N'7', N'7')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'69', N'Aylmar Stinchcombe', N'Clarisse Ghioni', N'1043990211', N'', N'Nhan vien', N'7', N'7')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'7', N'Evvy Abbott', N'Alister Styan', N'6576129294', N'', N'Nhan vien', N'1', N'1')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'70', N'Hilda Patman', N'Virginia Milmore', N'2165802992', N'', N'Nhan vien', N'7', N'7')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'71', N'Corinna Henstone', N'Pennie Dockwray', N'2761449579', N'8.jpg', N'Giam doc', N'8', N'8')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'72', N'Turner Orans', N'Sigfried Slee', N'3759922294', N'', N'Nhan vien', N'8', N'8')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'73', N'Ansell Nesey', N'Rosemonde Pervoe', N'7365917664', N'', N'Nhan vien', N'8', N'8')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'74', N'Mahalia Bricket', N'Eb Junkison', N'5767121985', N'', N'Nhan vien', N'8', N'8')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'75', N'Meade Leyden', N'Dedra Krzyzowski', N'8391557687', N'', N'Nhan vien', N'8', N'8')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'76', N'Walther Mathet', N'Elia Seville', N'7241138263', N'', N'Nhan vien', N'8', N'8')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'77', N'Murray Oakman', N'Jori Deinhardt', N'9297241175', N'', N'Nhan vien', N'8', N'8')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'78', N'Callean Renwick', N'Codi McKeating', N'7076212485', N'', N'Nhan vien', N'8', N'8')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'79', N'Tracee Ormes', N'Danny Edghinn', N'5786684033', N'', N'Nhan vien', N'8', N'8')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'8', N'Barbi Padly', N'Vail MacMeekan', N'9683740989', N'', N'Nhan vien', N'1', N'1')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'80', N'Murdoch Panniers', N'Hashim Bogges', N'4468735450', N'', N'Nhan vien', N'8', N'8')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'81', N'Laurianne Sammut', N'Alena Valenti', N'6722051944', N'', N'Giam doc', N'9', N'9')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'82', N'Malchy Clancy', N'Elmo Jeste', N'6955697353', N'9.jpg', N'Nhan vien', N'9', N'9')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'83', N'Abbey Karpol', N'Suzanne Gorges', N'5874088734', N'', N'Nhan vien', N'9', N'9')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'84', N'Frasier Brickett', N'Dewie Zeal', N'3245576596', N'', N'Nhan vien', N'9', N'9')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'85', N'Al Angeli', N'Bevvy Fluck', N'5626223247', N'', N'Nhan vien', N'9', N'9')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'86', N'Mickie Mushawe', N'Joyous Fuzzens', N'7957443142', N'', N'Nhan vien', N'9', N'9')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'87', N'Yalonda Lewer', N'Lamont Cromett', N'9258198892', N'', N'Nhan vien', N'9', N'9')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'88', N'Yovonnda Durram', N'Brent Aitken', N'4864865641', N'', N'Nhan vien', N'9', N'9')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'89', N'Zahara Gindghill', N'Adriane Aimson', N'3772438645', N'', N'Nhan vien', N'9', N'9')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'9', N'Kearney Druce', N'Richard Jonczyk', N'6461323718', N'', N'Nhan vien', N'1', N'1')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'90', N'Harmonie Rivett', N'Burtie Beurich', N'1496068978', N'', N'Nhan vien', N'9', N'9')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'91', N'Hinze Moughtin', N'Myca Bockin', N'7028849941', N'10.jpg', N'Giam doc', N'10', N'10')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'92', N'Liuka Savatier', N'Rorke McClory', N'4127080254', N'', N'Nhan vien', N'10', N'10')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'93', N'Rossy Ossipenko', N'Stephie Gueste', N'4921761063', N'', N'Nhan vien', N'10', N'10')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'94', N'Rois Shemmans', N'Florella Abramovicz', N'9148407733', N'', N'Nhan vien', N'10', N'10')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'95', N'Pace Boost', N'Pepillo Cantillon', N'7124094192', N'', N'Nhan vien', N'10', N'10')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'96', N'Myrle Dresche', N'Nadeen Newarte', N'3045281576', N'', N'Nhan vien', N'10', N'10')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'97', N'Luciano Westhoff', N'Dulciana Hess', N'7929709766', N'', N'Nhan vien', N'10', N'10')
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'98', N'Cherey Alten', N'Jaime Reynold', N'8897628995', N'', N'Nhan vien', N'10', N'10')
GO
INSERT [dbo].[NHANVIEN] ([MaNV], [TenNV], [DiaChiNV], [SDTNV], [HinhAnh], [ChucVu], [MaCongTy], [MaPHG]) VALUES (N'99', N'Philippine Winterbotham', N'Myrtle Wilson', N'5668958845', N'', N'Nhan vien', N'10', N'10')
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'1', N'101', 1, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'10', N'302', 3, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'100', N'2504', 25, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'11', N'303', 3, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'12', N'304', 3, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'13', N'401', 4, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'14', N'402', 4, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'15', N'403', 4, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'16', N'404', 4, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'17', N'501', 5, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'18', N'502', 5, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'19', N'503', 5, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'2', N'102', 1, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'20', N'504', 5, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'21', N'601', 6, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'22', N'602', 6, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'23', N'603', 6, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'24', N'604', 6, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'25', N'701', 7, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'26', N'702', 7, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'27', N'703', 7, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'28', N'704', 7, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'29', N'801', 8, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'3', N'103', 1, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'30', N'802', 8, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'31', N'803', 8, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'32', N'804', 8, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'33', N'901', 9, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'34', N'902', 9, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'35', N'903', 9, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'36', N'904', 9, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'37', N'1001', 10, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'38', N'1002', 10, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'39', N'1003', 10, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'4', N'104', 1, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'40', N'1004', 10, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'41', N'1101', 11, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'42', N'1102', 11, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'43', N'1103', 11, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'44', N'1104', 11, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'45', N'1201', 12, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'46', N'1202', 12, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'47', N'1203', 12, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'48', N'1204', 12, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'49', N'1301', 13, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'5', N'201', 2, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'50', N'1302', 13, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'51', N'1303', 13, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'52', N'1304', 13, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'53', N'1401', 14, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'54', N'1402', 14, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'55', N'1403', 14, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'56', N'1404', 14, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'57', N'1501', 15, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'58', N'1502', 15, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'59', N'1503', 15, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'6', N'202', 2, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'60', N'1504', 15, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'61', N'1601', 16, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'62', N'1602', 16, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'63', N'1603', 16, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'64', N'1604', 16, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'65', N'1701', 17, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'66', N'1702', 17, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'67', N'1703', 17, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'68', N'1704', 17, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'69', N'1801', 18, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'7', N'203', 2, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'70', N'1802', 18, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'71', N'1803', 18, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'72', N'1804', 18, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'73', N'1901', 19, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'74', N'1902', 19, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'75', N'1903', 19, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'76', N'1904', 19, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'77', N'2001', 20, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'78', N'2002', 20, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'79', N'2003', 20, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'8', N'204', 2, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'80', N'2004', 20, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'81', N'2101', 21, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'82', N'2102', 21, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'83', N'2103', 21, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'84', N'2104', 21, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'85', N'2201', 22, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'86', N'2202', 22, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'87', N'2203', 22, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'88', N'2204', 22, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'89', N'2301', 23, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'9', N'301', 3, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'90', N'2302', 23, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'91', N'2303', 23, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'92', N'2304', 23, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'93', N'2401', 24, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'94', N'2402', 24, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'95', N'2403', 24, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'96', N'2404', 24, 200)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'97', N'2501', 25, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'98', N'2502', 25, 100)
INSERT [dbo].[PHONG] ([MaPHG], [TenPHG], [Tang], [DienTich]) VALUES (N'99', N'2503', 25, 200)
GO
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (1, 100, N'18200000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (1, 200, N'28200000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (2, 100, N'15800000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (2, 200, N'25800000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (3, 100, N'11100000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (3, 200, N'21100000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (4, 100, N'10300000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (4, 200, N'20300000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (5, 100, N'19400000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (5, 200, N'29400000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (6, 100, N'13400000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (6, 200, N'23400000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (7, 100, N'12200000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (7, 200, N'22200000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (8, 100, N'19000000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (8, 200, N'29000000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (9, 100, N'16000000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (9, 200, N'26000000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (10, 100, N'16800000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (10, 200, N'26800000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (11, 100, N'10300000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (11, 200, N'20300000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (12, 100, N'16200000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (12, 200, N'26200000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (13, 100, N'15900000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (13, 200, N'25900000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (14, 100, N'13100000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (14, 200, N'23100000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (15, 100, N'12300000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (15, 200, N'22300000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (16, 100, N'15200000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (16, 200, N'25200000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (17, 100, N'13600000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (17, 200, N'23600000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (18, 100, N'11200000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (18, 200, N'21200000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (19, 100, N'11100000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (19, 200, N'21100000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (20, 100, N'15200000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (20, 200, N'25200000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (21, 100, N'11300000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (21, 200, N'21300000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (22, 100, N'12700000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (22, 200, N'22700000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (23, 100, N'18700000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (23, 200, N'28700000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (24, 100, N'10300000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (24, 200, N'20300000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (25, 100, N'12000000  ')
INSERT [dbo].[TANG] ([Tang], [DienTich], [Gia]) VALUES (25, 200, N'22000000  ')
ALTER TABLE [dbo].[CHITIETHOPDONG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOPDONG_HOPDONG] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HOPDONG] ([MaHD])
GO
ALTER TABLE [dbo].[CHITIETHOPDONG] CHECK CONSTRAINT [FK_CHITIETHOPDONG_HOPDONG]
GO
ALTER TABLE [dbo].[CHITIETHOPDONG]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOPDONG_PHONG] FOREIGN KEY([MaPHG])
REFERENCES [dbo].[PHONG] ([MaPHG])
GO
ALTER TABLE [dbo].[CHITIETHOPDONG] CHECK CONSTRAINT [FK_CHITIETHOPDONG_PHONG]
GO
ALTER TABLE [dbo].[CONGTY]  WITH CHECK ADD  CONSTRAINT [FK_CONGTY_HOPDONG] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HOPDONG] ([MaHD])
GO
ALTER TABLE [dbo].[CONGTY] CHECK CONSTRAINT [FK_CONGTY_HOPDONG]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHANVIEN_CONGTY] FOREIGN KEY([MaCongTy])
REFERENCES [dbo].[CONGTY] ([MaCongTy])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_CONGTY]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHANVIEN_PHONG] FOREIGN KEY([MaPHG])
REFERENCES [dbo].[PHONG] ([MaPHG])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_PHONG]
GO
ALTER TABLE [dbo].[PHIEUGIAHAN]  WITH CHECK ADD  CONSTRAINT [FK_PHIEUGIAHAN_CHITIETHOPDONG] FOREIGN KEY([MaHD], [MaPHG])
REFERENCES [dbo].[CHITIETHOPDONG] ([MaHD], [MaPHG])
GO
ALTER TABLE [dbo].[PHIEUGIAHAN] CHECK CONSTRAINT [FK_PHIEUGIAHAN_CHITIETHOPDONG]
GO
ALTER TABLE [dbo].[PHONG]  WITH CHECK ADD  CONSTRAINT [FK_PHONG_TANG] FOREIGN KEY([Tang], [DienTich])
REFERENCES [dbo].[TANG] ([Tang], [DienTich])
GO
ALTER TABLE [dbo].[PHONG] CHECK CONSTRAINT [FK_PHONG_TANG]
GO
