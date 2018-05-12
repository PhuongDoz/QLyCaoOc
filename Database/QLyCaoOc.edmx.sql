


use master
go

if exists(select * from sysdatabases where name='QLCAOOC')
	drop database QLCAOOC
go
USE [master]
GO

CREATE DATABASE [QLCAOOC] 
go
USE [QLCAOOC];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CHITIETHOPDONG_HOPDONG]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CHITIETHOPDONG] DROP CONSTRAINT [FK_CHITIETHOPDONG_HOPDONG];
GO
IF OBJECT_ID(N'[dbo].[FK_CHITIETHOPDONG_PHONG]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CHITIETHOPDONG] DROP CONSTRAINT [FK_CHITIETHOPDONG_PHONG];
GO
IF OBJECT_ID(N'[dbo].[FK_CONGTY_HOPDONG]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CONGTY] DROP CONSTRAINT [FK_CONGTY_HOPDONG];
GO
IF OBJECT_ID(N'[dbo].[FK_NHANVIEN_CONGTY]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NHANVIEN] DROP CONSTRAINT [FK_NHANVIEN_CONGTY];
GO
IF OBJECT_ID(N'[dbo].[FK_NHANVIEN_PHONG]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[NHANVIEN] DROP CONSTRAINT [FK_NHANVIEN_PHONG];
GO
IF OBJECT_ID(N'[dbo].[FK_PHIEUGIAHAN_CHITIETHOPDONG]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PHIEUGIAHAN] DROP CONSTRAINT [FK_PHIEUGIAHAN_CHITIETHOPDONG];
GO
IF OBJECT_ID(N'[dbo].[FK_PHONG_TANG]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PHONG] DROP CONSTRAINT [FK_PHONG_TANG];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[CHITIETHOPDONG]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CHITIETHOPDONG];
GO
IF OBJECT_ID(N'[dbo].[CONGTY]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CONGTY];
GO
IF OBJECT_ID(N'[dbo].[HOPDONG]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HOPDONG];
GO
IF OBJECT_ID(N'[dbo].[NHANVIEN]', 'U') IS NOT NULL
    DROP TABLE [dbo].[NHANVIEN];
GO
IF OBJECT_ID(N'[dbo].[PHIEUGIAHAN]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PHIEUGIAHAN];
GO
IF OBJECT_ID(N'[dbo].[PHONG]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PHONG];
GO

IF OBJECT_ID(N'[dbo].[TANG]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TANG];
GO
IF OBJECT_ID(N'[dbo].[THAMSO]', 'U') IS NOT NULL
    DROP TABLE [dbo].[THAMSO];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CHITIETHOPDONGs'
CREATE TABLE [dbo].[CHITIETHOPDONG] (
    [MaHD] varchar(5)  NOT NULL,
    [MaPHG] varchar(5)  NOT NULL,
    [ThoiGianThue] int  NULL
);
GO

-- Creating table 'CONGTies'
CREATE TABLE [dbo].[CONGTY] (
    [MaCongTy] varchar(5)  NOT NULL,
    [TenCT] nvarchar(50)  NULL,
    [DiaChiCT] nvarchar(50)  NULL,
    [SDT] nvarchar(12)  NULL,
    [MaHD] varchar(5)  NOT NULL
);
GO

-- Creating table 'HOPDONGs'
CREATE TABLE [dbo].[HOPDONG] (
    [MaHD] varchar(5)  NOT NULL,
    [NgayLap] datetime  NULL,
    [TienCoc] int  NULL
);
GO

-- Creating table 'NHANVIENs'
CREATE TABLE [dbo].[NHANVIEN] (
    [MaNV] varchar(5)  NOT NULL,
    [TenNV] nvarchar(50)  NULL,
    [DiaChiNV] nvarchar(50)  NULL,
    [SDTNV] nvarchar(10)  NULL,
	[HinhAnh] IMAGE NULL,
	[ChucVu] nvarchar(30) NULL,
    [MaCongTy] varchar(5)  NOT NULL,
    [MaPHG] varchar(5)  NOT NULL,
	
);
GO

-- Creating table 'PHIEUGIAHANs'
CREATE TABLE [dbo].[PHIEUGIAHAN] (
    [MaPhieuGiaHan] varchar(5)  NOT NULL,
    [NgayGiaHan] datetime  NULL,
    [NgayHetHan] datetime  NULL,
    [MaHD] varchar(5)  NULL,
    [MaPHG] varchar(5)  NULL
);
GO

-- Creating table 'PHONGs'
CREATE TABLE [dbo].[PHONG] (
    [MaPHG] varchar(5)  NOT NULL,
    [TenPHG] nvarchar(50)  NULL,
    [Tang] int  NOT NULL,
    [DienTich] int  NOT NULL
);
GO




-- Creating table 'TANGs'
CREATE TABLE [dbo].[TANG] (
    [Tang] int  NOT NULL,
    [DienTich] int  NOT NULL,
    [Gia] nchar(10)  NOT NULL
);
GO

-- Creating table 'THAMSOes'
CREATE TABLE [dbo].[THAMSO] (
    [MaTS] varchar(5)  NOT NULL,
    [TenTS] nvarchar(50)  NULL,
    [GiaTriTS] int  NULL
);
GO

-- Creating table 'TAIKHOANs'
CREATE TABLE [dbo].[TAIKHOAN] (
    [MaTK] varchar(5)  NOT NULL,
    [TenDN] varchar(50)  NULL,
    [MatKhau] varchar(30)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MaHD], [MaPHG] in table 'CHITIETHOPDONGs'
ALTER TABLE [dbo].[CHITIETHOPDONG]
ADD CONSTRAINT [PK_CHITIETHOPDONG]
    PRIMARY KEY CLUSTERED ([MaHD], [MaPHG] ASC);
GO

-- Creating primary key on [MaCongTy] in table 'CONGTies'
ALTER TABLE [dbo].[CONGTY]
ADD CONSTRAINT [PK_CONGTY]
    PRIMARY KEY CLUSTERED ([MaCongTy] ASC);
GO

-- Creating primary key on [MaHD] in table 'HOPDONGs'
ALTER TABLE [dbo].[HOPDONG]
ADD CONSTRAINT [PK_HOPDONG]
    PRIMARY KEY CLUSTERED ([MaHD] ASC);
GO

-- Creating primary key on [MaNV] in table 'NHANVIENs'
ALTER TABLE [dbo].[NHANVIEN]
ADD CONSTRAINT [PK_NHANVIEN]
    PRIMARY KEY CLUSTERED ([MaNV] ASC);
GO

-- Creating primary key on [MaPhieuGiaHan] in table 'PHIEUGIAHANs'
ALTER TABLE [dbo].[PHIEUGIAHAN]
ADD CONSTRAINT [PK_PHIEUGIAHAN]
    PRIMARY KEY CLUSTERED ([MaPhieuGiaHan] ASC);
GO

-- Creating primary key on [MaPHG] in table 'PHONGs'
ALTER TABLE [dbo].[PHONG]
ADD CONSTRAINT [PK_PHONG]
    PRIMARY KEY CLUSTERED ([MaPHG] ASC);

GO



-- Creating primary key on [Tang], [DienTich] in table 'TANGs'
ALTER TABLE [dbo].[TANG]
ADD CONSTRAINT [PK_TANG]
    PRIMARY KEY CLUSTERED ([Tang], [DienTich] ASC);
GO

-- Creating primary key on [MaTS] in table 'THAMSOes'
ALTER TABLE [dbo].[THAMSO]
ADD CONSTRAINT [PK_THAMSO]
    PRIMARY KEY CLUSTERED ([MaTS] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MaHD] in table 'CHITIETHOPDONGs'
ALTER TABLE [dbo].[CHITIETHOPDONG]
ADD CONSTRAINT [FK_CHITIETHOPDONG_HOPDONG]
    FOREIGN KEY ([MaHD])
    REFERENCES [dbo].[HOPDONG]
        ([MaHD])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MaPHG] in table 'CHITIETHOPDONGs'
ALTER TABLE [dbo].[CHITIETHOPDONG]
ADD CONSTRAINT [FK_CHITIETHOPDONG_PHONG]
    FOREIGN KEY ([MaPHG])
    REFERENCES [dbo].[PHONG]
        ([MaPHG])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CHITIETHOPDONG_PHONG'
CREATE INDEX [IX_FK_CHITIETHOPDONG_PHONG]
ON [dbo].[CHITIETHOPDONG]
    ([MaPHG]);
GO

-- Creating foreign key on [MaHD], [MaPHG] in table 'PHIEUGIAHANs'
ALTER TABLE [dbo].[PHIEUGIAHAN]
ADD CONSTRAINT [FK_PHIEUGIAHAN_CHITIETHOPDONG]
    FOREIGN KEY ([MaHD], [MaPHG])
    REFERENCES [dbo].[CHITIETHOPDONG]
        ([MaHD], [MaPHG])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PHIEUGIAHAN_CHITIETHOPDONG'
CREATE INDEX [IX_FK_PHIEUGIAHAN_CHITIETHOPDONG]
ON [dbo].[PHIEUGIAHAN]
    ([MaHD], [MaPHG]);
GO

-- Creating foreign key on [MaHD] in table 'CONGTies'
ALTER TABLE [dbo].[CONGTY]
ADD CONSTRAINT [FK_CONGTY_HOPDONG]
    FOREIGN KEY ([MaHD])
    REFERENCES [dbo].[HOPDONG]
        ([MaHD])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CONGTY_HOPDONG'
CREATE INDEX [IX_FK_CONGTY_HOPDONG]
ON [dbo].[CONGTY]
    ([MaHD]);
GO

-- Creating foreign key on [MaCongTy] in table 'NHANVIENs'
ALTER TABLE [dbo].[NHANVIEN]
ADD CONSTRAINT [FK_NHANVIEN_CONGTY]
    FOREIGN KEY ([MaCongTy])
    REFERENCES [dbo].[CONGTY]
        ([MaCongTy])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NHANVIEN_CONGTY'
CREATE INDEX [IX_FK_NHANVIEN_CONGTY]
ON [dbo].[NHANVIEN]
    ([MaCongTy]);
GO

-- Creating foreign key on [MaPHG] in table 'NHANVIENs'
ALTER TABLE [dbo].[NHANVIEN]
ADD CONSTRAINT [FK_NHANVIEN_PHONG]
    FOREIGN KEY ([MaPHG])
    REFERENCES [dbo].[PHONG]
        ([MaPHG])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_NHANVIEN_PHONG'
CREATE INDEX [IX_FK_NHANVIEN_PHONG]
ON [dbo].[NHANVIEN]
    ([MaPHG]);
GO

-- Creating foreign key on [Tang], [DienTich] in table 'PHONGs'
ALTER TABLE [dbo].[PHONG]
ADD CONSTRAINT [FK_PHONG_TANG]
    FOREIGN KEY ([Tang], [DienTich])
    REFERENCES [dbo].[TANG]
        ([Tang], [DienTich])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PHONG_TANG'
CREATE INDEX [IX_FK_PHONG_TANG]
ON [dbo].[PHONG]
    ([Tang], [DienTich]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------

--Insert table HOPDONG
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (1, '9/26/2017', '7300000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (2, '1/22/2018', '5100000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (3, '6/10/2017', '9100000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (4, '10/2/2017', '8500000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (5, '7/29/2017', '6400000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (6, '3/11/2018', '9600000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (7, '1/5/2018', '7400000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (8, '2/27/2018', '7600000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (9, '8/30/2017', '7300000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (10, '4/28/2017', '8300000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (11, '3/15/2018', '5400000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (12, '7/15/2017', '6100000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (13, '11/11/2017', '7600000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (14, '12/18/2017', '7800000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (15, '10/2/2017', '8000000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (16, '5/30/2017', '9300000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (17, '12/4/2017', '8900000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (18, '2/6/2018', '6700000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (19, '6/24/2017', '5900000');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (20, '2/28/2018', '8100000');

--Insert table TANG
insert into TANG (Tang, DienTich, Gia) values (1, 100, '18200000');
insert into TANG (Tang, DienTich, Gia) values (2, 100, '15800000');
insert into TANG (Tang, DienTich, Gia) values (3, 100, '11100000');
insert into TANG (Tang, DienTich, Gia) values (4, 100, '10300000');
insert into TANG (Tang, DienTich, Gia) values (5, 100, '19400000');
insert into TANG (Tang, DienTich, Gia) values (6, 100, '13400000');
insert into TANG (Tang, DienTich, Gia) values (7, 100, '12200000');
insert into TANG (Tang, DienTich, Gia) values (8, 100, '19000000');
insert into TANG (Tang, DienTich, Gia) values (9, 100, '16000000');
insert into TANG (Tang, DienTich, Gia) values (10, 100, '16800000');
insert into TANG (Tang, DienTich, Gia) values (11, 100, '10300000');
insert into TANG (Tang, DienTich, Gia) values (12, 100, '16200000');
insert into TANG (Tang, DienTich, Gia) values (13, 100, '15900000');
insert into TANG (Tang, DienTich, Gia) values (14, 100, '13100000');
insert into TANG (Tang, DienTich, Gia) values (15, 100, '12300000');
insert into TANG (Tang, DienTich, Gia) values (16, 100, '15200000');
insert into TANG (Tang, DienTich, Gia) values (17, 100, '13600000');
insert into TANG (Tang, DienTich, Gia) values (18, 100, '11200000');
insert into TANG (Tang, DienTich, Gia) values (19, 100, '11100000');
insert into TANG (Tang, DienTich, Gia) values (20, 100, '15200000');
insert into TANG (Tang, DienTich, Gia) values (21, 100, '11300000');
insert into TANG (Tang, DienTich, Gia) values (22, 100, '12700000');
insert into TANG (Tang, DienTich, Gia) values (23, 100, '18700000');
insert into TANG (Tang, DienTich, Gia) values (24, 100, '10300000');
insert into TANG (Tang, DienTich, Gia) values (25, 100, '12000000');
insert into TANG (Tang, DienTich, Gia) values (1, 200, '28200000');
insert into TANG (Tang, DienTich, Gia) values (2, 200, '25800000');
insert into TANG (Tang, DienTich, Gia) values (3, 200, '21100000');
insert into TANG (Tang, DienTich, Gia) values (4, 200, '20300000');
insert into TANG (Tang, DienTich, Gia) values (5, 200, '29400000');
insert into TANG (Tang, DienTich, Gia) values (6, 200, '23400000');
insert into TANG (Tang, DienTich, Gia) values (7, 200, '22200000');
insert into TANG (Tang, DienTich, Gia) values (8, 200, '29000000');
insert into TANG (Tang, DienTich, Gia) values (9, 200, '26000000');
insert into TANG (Tang, DienTich, Gia) values (10, 200, '26800000');
insert into TANG (Tang, DienTich, Gia) values (11, 200, '20300000');
insert into TANG (Tang, DienTich, Gia) values (12, 200, '26200000');
insert into TANG (Tang, DienTich, Gia) values (13, 200, '25900000');
insert into TANG (Tang, DienTich, Gia) values (14, 200, '23100000');
insert into TANG (Tang, DienTich, Gia) values (15, 200, '22300000');
insert into TANG (Tang, DienTich, Gia) values (16, 200, '25200000');
insert into TANG (Tang, DienTich, Gia) values (17, 200, '23600000');
insert into TANG (Tang, DienTich, Gia) values (18, 200, '21200000');
insert into TANG (Tang, DienTich, Gia) values (19, 200, '21100000');
insert into TANG (Tang, DienTich, Gia) values (20, 200, '25200000');
insert into TANG (Tang, DienTich, Gia) values (21, 200, '21300000');
insert into TANG (Tang, DienTich, Gia) values (22, 200, '22700000');
insert into TANG (Tang, DienTich, Gia) values (23, 200, '28700000');
insert into TANG (Tang, DienTich, Gia) values (24, 200, '20300000');
insert into TANG (Tang, DienTich, Gia) values (25, 200, '22000000');


-- Insert table PHONG
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (1, '101', 1, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (2, '102', 1, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (3, '103', 1, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (4, '104', 1, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (5, '201', 2, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (6, '202', 2, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (7, '203', 2, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (8, '204', 2, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (9, '301', 3, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (10, '302', 3, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (11, '303', 3, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (12, '304', 3, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (13, '401', 4, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (14, '402', 4, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (15, '403', 4, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (16, '404', 4, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (17, '501', 5, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (18, '502', 5, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (19, '503', 5, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (20, '504', 5, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (21, '601', 6, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (22, '602', 6, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (23, '603', 6, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (24, '604', 6, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (25, '701', 7, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (26, '702', 7, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (27, '703', 7, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (28, '704', 7, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (29, '801', 8, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (30, '802', 8, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (31, '803', 8, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (32, '804', 8, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (33, '901', 9, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (34, '902', 9, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (35, '903', 9, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (36, '904', 9, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (37, '1001', 10, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (38, '1002', 10, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (39, '1003', 10, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (40, '1004', 10, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (41, '1101', 11, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (42, '1102', 11, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (43, '1103', 11, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (44, '1104', 11, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (45, '1201', 12, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (46, '1202', 12, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (47, '1203', 12, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (48, '1204', 12, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (49, '1301', 13, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (50, '1302', 13, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (51, '1303', 13, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (52, '1304', 13, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (53, '1401', 14, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (54, '1402', 14, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (55, '1403', 14, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (56, '1404', 14, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (57, '1501', 15, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (58, '1502', 15, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (59, '1503', 15, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (60, '1504', 15, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (61, '1601', 16, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (62, '1602', 16, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (63, '1603', 16, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (64, '1604', 16, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (65, '1701', 17, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (66, '1702', 17, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (67, '1703', 17, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (68, '1704', 17, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (69, '1801', 18, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (70, '1802', 18, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (71, '1803', 18, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (72, '1804', 18, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (73, '1901',19, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (74, '1902', 19, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (75, '1903', 19, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (76, '1904', 19, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (77, '2001', 20, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (78, '2002', 20, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (79, '2003', 20, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (80, '2004', 20, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (81, '2101', 21, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (82, '2102', 21, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (83, '2103', 21, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (84, '2104', 21, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (85, '2201', 22, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (86, '2202', 22, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (87, '2203', 22, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (88, '2204', 22, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (89, '2301', 23, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (90, '2302', 23, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (91, '2303', 23, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (92, '2304', 23, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (93, '2401', 24, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (94, '2402', 24, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (95, '2403', 24, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (96, '2404', 24,200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (97, '2501', 25, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (98, '2502', 25, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (99, '2503', 25, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (100, '2504', 25, 200);


--insert table CONGTY

insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (1, 'McDONALD', '12 Charles Delea', '490-118-5583', 1);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (2, 'HIGHLANDS Coffee', '54 Darin Trainer', '757-942-3707', 2);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (3, 'STARBUCKS', '98 Shandee Gateshill', '284-871-6762', 3);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (4, 'PHÚC LONG Coffee', '123 Lou Worg', '223-881-6293', 4);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (5, 'THE COFFEE HOUSE', '86 Merry Costall', '678-453-1532', 5);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (6, 'ORIENT SOFTWARE', '45 Rusty Kiddell', '601-839-1862', 6);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (7, 'PIZZA COMPANY', '64 Charmian Arnholtz', '964-938-4039', 7);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (8, 'JOLIE PEE', '75 Matelda Corbin', '540-195-9778', 8);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (9, 'LOTTERIA', '24 Augustus Surr', '917-744-7575', 9);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (10, 'FPT SOFTWARE', '64 Juan Laidlaw', '259-333-0141', 10);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (11, 'GLOBAL CYBERSOFT', '68 Sherie Sidlow', '770-830-0203', 11);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (12, 'HARVEY NASH', '974 Hermia Yaldren', '223-311-9416', 12);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (13, 'FUJINET', '145 Davis Newvill', '462-266-3865', 13);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (14, 'DIGI-TEXX', '156 Sansone Durran', '231-999-0634', 14);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (15, 'KMS TECHNOLOGY', '124 Maddie Adamthwaite', '225-569-1962', 15);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (16, 'TMA SOLUTIONS', '675 Kerrill Puttick', '147-556-5658', 16);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (17, 'MK SMART', '564 Valencia Flynn', '534-659-2938', 17);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (18, 'INTERNATIONAL BUSINESS MACHINE', '325 Bernita Bamlet', '270-248-5522', 18);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (19, 'MICROSOFT COMPANY', '79 Ricky Karby', '454-742-7545', 19);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (20, 'ORACLE', '55 Henrik Dimmer', '331-622-8247', 20);

-- Insert table NHANVIEN
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (1, 'Gwyneth Le Sarr', 'Ricky De Mitris', '3801616618','1.jpg','Giam doc', 1, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (2, 'Perry Fox', 'Flossie Kirkby', '1359782730','','Nhan vien', 1, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (3, 'Tanya Bocke', 'Anne-marie McLleese', '7756831544','','Nhan vien', 1, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (4, 'Jean Dahmke', 'Benjy Lawrenson', '4519254222','','Nhan vien', 1, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (5, 'Silvano Undrill', 'Ulrika Ferrulli', '3725305507','','Nhan vien', 1, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (6, 'Clara Lidgey', 'Cherey Depper', '3335131098','','Nhan vien', 1, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (7, 'Evvy Abbott', 'Alister Styan', '6576129294', '','Nhan vien',1, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (8, 'Barbi Padly', 'Vail MacMeekan', '9683740989','','Nhan vien', 1, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (9, 'Kearney Druce', 'Richard Jonczyk', '6461323718','','Nhan vien', 1,1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (10, 'Karil Andrichak', 'Amble Sandom', '7409796594','','Nhan vien', 1, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (11, 'Teddy Leathe', 'Darill Pimer', '6733769169','2.jpg','Giam doc', 2,2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (12, 'Eda Slides', 'Kimmie Hullin', '9406739411','','Nhan vien',  2,2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (13, 'Rafa McGibbon', 'Sibyl Graver', '8111095332','','Nhan vien',  2,2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (14, 'Noland Faragan', 'Doris Giacobilio', '6208832809','','Nhan vien',  2,2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (15, 'Colman Sepey', 'Mike Vinall', '1227788631','','Nhan vien',  2,2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (16, 'Othilie MacFarlan', 'Reid Pixton', '2512061358', '','Nhan vien',2,2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (17, 'Monique Probbin', 'Jodie Dahlgren', '9177115358','','Nhan vien',  2,2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (18, 'Shermy Booeln', 'Tarrance Christiensen', '5826718255','','Nhan vien',  2,2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (19, 'Caprice Ivanyushkin', 'Grete Bramont', '9966641447','','Nhan vien', 2,2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (20, 'Gareth Gravenor', 'Anatol Utton', '5297708965','','Nhan vien', 2,2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (21, 'Lanae Raffin', 'Aurthur MacKaig', '5443187772','3.jpg','Giam doc', 3,3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (22, 'Nataline Lenney', 'Enrichetta Keelinge', '19691815','','Nhan vien',3,3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (23, 'Isidor Hartropp', 'Windy Whitty', '6122388020','','Nhan vien', 3,3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (24, 'Rock Haughey', 'Shay Crinkley', '2975280247','','Nhan vien',3,3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (25, 'Dory Eastlake', 'Clarinda Eliet', '5158965955','','Nhan vien', 3,3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (26, 'Kaja Fardon', 'Maurine Goodding', '9956465782','','Nhan vien', 3,3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (27, 'Porter Stebles', 'Mikol Piller', '6992016611','','Nhan vien',3,3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (28, 'Phillipe BURWIN', 'Spense Churchman', '6413833327','','Nhan vien', 3,3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (29, 'Millie Grouvel', 'Robina Atcock', '2845305327','','Nhan vien', 3,3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (30, 'Alleyn Chomley', 'Christophorus Bester', '1044962834','','Nhan vien',3,3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (31, 'Leonora Pearn', 'Stephanie Halbeard', '2754989156','4.jpg','Giam doc', 4, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (32, 'Saloma Brislane', 'Meg Lynock', '9297466806','','Nhan vien', 4, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (33, 'Susana Halfacre', 'Michele Clague', '9392990149','','Nhan vien', 4, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (34, 'Bertina Pettendrich', 'Anson Bly', '3792970709','','Nhan vien', 4, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (35, 'Karita Klimschak', 'Blakeley Meneo', '9993568212','','Nhan vien', 4, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (36, 'Darius Haythorn', 'Winslow Worledge', '2546535205','','Nhan vien', 4, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (37, 'Bronson Mallalieu', 'Marwin Pickersail', '2854265132','','Nhan vien', 4, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (38, 'Hart Clewlow', 'Orion Abramowitz', '6595961076','','Nhan vien', 4, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (39, 'Glen Fahrenbacher', 'Marie-jeanne Abramowsky', '9554946148','','Nhan vien', 4, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (40, 'Katinka Maylam', 'Allyce Butner', '1371536490','','Nhan vien', 4, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (41, 'Clemmy Penticost', 'Archaimbaud Hurche', '7469400133','5.jpg','Giam doc', 5, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (42, 'Gill Hattiff', 'Vanda Stood', '2603122586','','Nhan vien', 5, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (43, 'Cristie Iston', 'Hewie Gilhool', '9884699106','','Nhan vien', 5, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (44, 'Asher Adderley', 'Lucia Gouge', '869262921','','Nhan vien', 5, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (45, 'Mufi Dix', 'Padgett Shutte', '8748290195','','Nhan vien', 5, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (46, 'Selina Shewery', 'Robin Northcott', '3842756763','','Nhan vien', 5, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (47, 'Markos Camlin', 'Gabe Starkey', '2583418619','','Nhan vien', 5, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (48, 'Kendall Ryal', 'Caleb Zellner', '2906422575','','Nhan vien', 5, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (49, 'Jerrine Neads', 'Hatty Throughton', '8862594419','','Nhan vien', 5, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (50, 'Lev Coskerry', 'Percival Allix', '5144276652','','Nhan vien', 5, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (51, 'Fidelio Toombs', 'Cassondra Kinvig', '5742162862','6.jpg','Giam doc', 6, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (52, 'Gunther Dougher', 'Kleon Yaakov', '8954391258','','Nhan vien', 6, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (53, 'Felipe Slowly', 'Jeanelle Weedenburg', '3461030956', '','Nhan vien',6, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (54, 'Manuel Rain', 'Bronny Sulland', '3923234914','','Nhan vien', 6, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (55, 'Min Morris', 'Gabrila Tidmarsh', '6663458054','','Nhan vien', 6, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (56, 'Kristo Poupard', 'Ly Seide', '8786224044','','Nhan vien', 6, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (57, 'Damian Banner', 'Honey Gownge', '92351773','','Nhan vien', 6, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (58, 'Prudence Hardstaff', 'Clemmie Payn', '4599500','','Nhan vien', 6, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (59, 'Otis Brumhead', 'Chaunce Bannell', '4231614664','','Nhan vien', 6, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (60, 'Dusty Wind', 'Lani Woodger', '4283020980','','Nhan vien', 6, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (61, 'Izaak Matushevich', 'Ashlee Berntsson', '7948807658','7.jpg','Giam doc', 7,7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (62, 'Amalea Shayler', 'Bryna Murra', '9493216835','','Nhan vien', 7,7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (63, 'Kalindi Jenney', 'Mehetabel Bulger', '6333263317','','Nhan vien', 7,7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (64, 'Ashia Wesker', 'Leonore McCorrie', '3885400238','','Nhan vien', 7,7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (65, 'Raoul Bearns', 'Mignon Pawlik', '6763205049','','Nhan vien', 7,7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (66, 'Gardener Webburn', 'Ede Vanyatin', '7798473969','','Nhan vien', 7,7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (67, 'Lee Rama', 'Harrie Lapish', '4178007810','','Nhan vien', 7,7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (68, 'Nonnah Lytlle', 'Abigael Etuck', '9957747955','','Nhan vien', 7,7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (69, 'Aylmar Stinchcombe', 'Clarisse Ghioni', '1043990211','','Nhan vien', 7,7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (70, 'Hilda Patman', 'Virginia Milmore', '2165802992','','Nhan vien', 7,7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (71, 'Corinna Henstone', 'Pennie Dockwray', '2761449579','8.jpg','Giam doc', 8, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (72, 'Turner Orans', 'Sigfried Slee', '3759922294','','Nhan vien', 8, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (73, 'Ansell Nesey', 'Rosemonde Pervoe', '7365917664','','Nhan vien', 8, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (74, 'Mahalia Bricket', 'Eb Junkison', '5767121985','','Nhan vien', 8, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (75, 'Meade Leyden', 'Dedra Krzyzowski', '8391557687','','Nhan vien', 8, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (76, 'Walther Mathet', 'Elia Seville', '7241138263','','Nhan vien', 8, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (77, 'Murray Oakman', 'Jori Deinhardt', '9297241175','','Nhan vien', 8, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (78, 'Callean Renwick', 'Codi McKeating', '7076212485','','Nhan vien', 8, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (79, 'Tracee Ormes', 'Danny Edghinn', '5786684033','','Nhan vien', 8, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (80, 'Murdoch Panniers', 'Hashim Bogges', '4468735450','','Nhan vien', 8, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (81, 'Laurianne Sammut', 'Alena Valenti', '6722051944','','Giam doc', 9, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (82, 'Malchy Clancy', 'Elmo Jeste', '6955697353','9.jpg','Nhan vien', 9, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (83, 'Abbey Karpol', 'Suzanne Gorges', '5874088734','','Nhan vien', 9, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (84, 'Frasier Brickett', 'Dewie Zeal', '3245576596', '','Nhan vien',9, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (85, 'Al Angeli', 'Bevvy Fluck', '5626223247','','Nhan vien', 9, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (86, 'Mickie Mushawe', 'Joyous Fuzzens', '7957443142','','Nhan vien', 9, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (87, 'Yalonda Lewer', 'Lamont Cromett', '9258198892','','Nhan vien', 9, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (88, 'Yovonnda Durram', 'Brent Aitken', '4864865641','','Nhan vien', 9, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (89, 'Zahara Gindghill', 'Adriane Aimson', '3772438645','','Nhan vien', 9, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (90, 'Harmonie Rivett', 'Burtie Beurich', '1496068978', '','Nhan vien',9, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (91, 'Hinze Moughtin', 'Myca Bockin', '7028849941','10.jpg','Giam doc', 10, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (92, 'Liuka Savatier', 'Rorke McClory', '4127080254','','Nhan vien', 10, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (93, 'Rossy Ossipenko', 'Stephie Gueste', '4921761063','','Nhan vien', 10, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (94, 'Rois Shemmans', 'Florella Abramovicz', '9148407733','','Nhan vien', 10, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (95, 'Pace Boost', 'Pepillo Cantillon', '7124094192','','Nhan vien', 10, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (96, 'Myrle Dresche', 'Nadeen Newarte', '3045281576','','Nhan vien', 10, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (97, 'Luciano Westhoff', 'Dulciana Hess', '7929709766','','Nhan vien', 10, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (98, 'Cherey Alten', 'Jaime Reynold', '8897628995','','Nhan vien', 10, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (99, 'Philippine Winterbotham', 'Myrtle Wilson', '5668958845','','Nhan vien', 10, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (100, 'Farris Vasiltsov', 'Rivkah Brailsford', '1698332070','','Nhan vien', 10, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (101, 'Morgana Ornils', 'Trumann Tinker', '3336854764','11.png','Giam doc', 11,11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (102, 'Iseabal Qualtro', 'Emerson Shanks', '2721953820','','Nhan vien', 11,11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (103, 'Charisse Everson', 'Rosalinde Strettell', '5442544138','','Nhan vien', 11,11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (104, 'Elladine Geke', 'Leela Glowacha', '7734887347','','Nhan vien', 11,11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (105, 'Erna Godley', 'Sidoney Skirvin', '1366914910','','Nhan vien', 11,11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (106, 'Althea Havoc', 'Gabriele Winger', '2551452476','','Nhan vien', 11,11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (107, 'Victoria Avrahamof', 'Quincy Royste', '1155545405','','Nhan vien', 11,11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (108, 'Ali Dockrill', 'Hailee Quilligan', '2202460352','','Nhan vien', 11,11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (109, 'Karrah Craigmile', 'Luther Ilett', '2803075083','','Nhan vien', 11,11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (110, 'Elroy Cabena', 'Lizabeth Dannett', '3819142466','','Nhan vien', 11,11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (111, 'Jameson Chudleigh', 'Con Riditch', '8248703344','','Giam doc', 12, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (112, 'Datha Barbara', 'Izak Areles', '6898341848', '12.jpg','Nhan vien',12, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (113, 'Kinnie Kruszelnicki', 'Arlan Sutherns', '7856322852', '','Nhan vien',12, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (114, 'Mathe Ivel', 'Edithe Sallowaye', '1944026400','','Nhan vien', 12, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (115, 'Sullivan Beining', 'Tynan Girhard', '1822987621','','Nhan vien', 12, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (116, 'Elita Muffin', 'Rob Mott', '1306880849','','Nhan vien', 12, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (117, 'Keary Castro', 'Zonnya Leindecker', '1852941088','','Nhan vien', 12, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (118, 'Emmott Aldcorn', 'Bobbe Guitt', '46032599','','Nhan vien', 12, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (119, 'Concordia Lamborn', 'Consuelo Littleover', '1816058048', '','Nhan vien',12, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (120, 'Joshuah Doige', 'Philly Sreenan', '8799751813', '','Nhan vien',12, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (121, 'Bret Lorek', 'Matti Cass', '4898533108','13.jpg','Giam doc', 13, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (122, 'Pascal Haukey', 'Leena Stainson', '9553545745','','Nhan vien', 13, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (123, 'Peadar Jonas', 'Dale Dacke', '5624072819','','Nhan vien', 13, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (124, 'Mark Glawsop', 'Homere Austing', '2972192271','','Nhan vien', 13, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (125, 'Tommy Testo', 'Shannen Cryer', '4762636044','','Nhan vien', 13, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (126, 'Mari Hacking', 'Phillie Portman', '5308046557','','Nhan vien', 13, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (127, 'Myca Kemetz', 'Jana Kenion', '7424884202','','Nhan vien', 13, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (128, 'Claudius Colam', 'Lazar Dash', '3338776219','','Nhan vien', 13, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (129, 'Nicolais Twidle', 'Maddie Cowpland', '6233225899','','Nhan vien', 13, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (130, 'Ferdinand Glynne', 'Gabbi Nicholson', '7002339491','','Nhan vien', 13, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (131, 'Angela Pascoe', 'Jeremiah Tabbernor', '2082101671','14.jpg','Giam doc', 14, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (132, 'Oberon Thowes', 'Dacey Glazzard', '3387990890','','Nhan vien', 14, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (133, 'Tucker Preto', 'Marta Siddeley', '9529901836','','Nhan vien', 14, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (134, 'Lauri Castanos', 'Marilin Silcock', '220146640','','Nhan vien', 14, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (135, 'Opalina Keeri', 'Shandeigh Seage', '4686384563','','Nhan vien', 14, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (136, 'Fionna Saltern', 'Orella Brosh', '2191135189','','Nhan vien', 14, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (137, 'Ronnie Barthorpe', 'Jo ann Egdal', '4703816584','','Nhan vien', 14, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (138, 'Ewen Goodsell', 'Shandee Gilburt', '5696705896','','Nhan vien', 14, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (139, 'Heidie Confait', 'Rouvin Peachman', '8777779262','','Nhan vien', 14, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (140, 'Erma Feldfisher', 'Yoko Sahnow', '783981980','','Nhan vien', 14, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (141, 'Yoshi Trodler', 'Roman Bewly', '3939548524','15.jpg','Giam doc', 15, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (142, 'Alix Gulvin', 'Vanda Gostage', '3213237552','','Nhan vien', 15, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (143, 'Biron Mulkerrins', 'Murvyn Andrioni', '5158987881','','Nhan vien', 15, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (144, 'Selia Huckle', 'Shanda Cownden', '6163696577', '','Nhan vien',15, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (145, 'Buck Burkill', 'Zelda Edards', '1211210858', '','Nhan vien',15, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (146, 'Skippy Radclyffe', 'Alejoa Kitchiner', '5292574069','','Nhan vien', 15, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (147, 'Elsie Briers', 'Chantalle Merrigans', '9106487891', '','Nhan vien',15, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (148, 'Ernesto Buntin', 'Alvin Pinniger', '3669361848','','Nhan vien', 15, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (149, 'Krispin Dunning', 'Torry Sickamore', '560602689','','Nhan vien', 15, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (150, 'Kynthia Loveridge', 'Ennis MacBey', '5184555520','','Nhan vien', 15, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (151, 'Caddric Sandells', 'Tarrance Danielot', '3511792341','16.jpg','Giam doc', 16, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (152, 'Jelene Fennelow', 'Julita Drysdall', '6493544363','','Nhan vien', 16, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (153, 'Delphine Kinnear', 'Leroi Toward', '3388563418','','Nhan vien', 16, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (154, 'Boris Beelby', 'Germaine Paslow', '2731329613','','Nhan vien', 16, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (155, 'Abdel Stanlock', 'Lion Rauprich', '4855917836','','Nhan vien', 16, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (156, 'Fianna Tomaselli', 'Art Hazelton', '2223614542','','Nhan vien', 16, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (157, 'Tisha Lowle', 'Paquito Izhaky', '6615401362','','Nhan vien', 16, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (158, 'Luke Norvill', 'Darcy Aldwich', '7635931061','','Nhan vien', 16, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (159, 'Ora Pattinson', 'Connie Brimble', '5955334716','','Nhan vien', 16, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (160, 'Enoch Reedshaw', 'Gregory Salaman', '9736874397','','Nhan vien', 16, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (161, 'Read Strutz', 'Brander MacColgan', '3917950073','17.jpg','Giam doc', 17, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (162, 'Anna-diana Ricart', 'Riley Wigfield', '5467193569','','Nhan vien', 17, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (163, 'Gretta Ralph', 'Norry Caulliere', '6443370626','','Nhan vien', 17, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (164, 'Colly Braams', 'Matt Frounks', '7705907696','','Nhan vien', 17, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (165, 'Albina Cholmondeley', 'Rozelle Tucsell', '1242420922', '','Nhan vien',17, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (166, 'Iona Barge', 'Minda Nairns', '8006260821','','Nhan vien', 17, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (167, 'Joshua Feavers', 'Doria Dodshun', '3737557027','','Nhan vien', 17, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (168, 'Joyce Kenwin', 'Alix Gaisford', '5965625498','','Nhan vien', 17, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (169, 'Dasie Dinwoodie', 'Emile Sposito', '1352480208','','Nhan vien', 17, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (170, 'Mercy Nilges', 'Patton Petracchi', '4455199501', '','Nhan vien',17, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (171, 'Domini Avrasin', 'Ardith Rushmer', '7019433452', '18.jpg','Giam doc',18, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (172, 'Ingaborg Biasotti', 'La verne Hannigane', '5329327497', '','Nhan vien',18, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (173, 'Annalise Townsend', 'Hanna McQuarrie', '7072505255','','Nhan vien', 18, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (174, 'Roscoe Frier', 'Gabriele Donativo', '1075987003','','Nhan vien', 18, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (175, 'Staford Scotson', 'Lavinie Brenard', '2751754312','','Nhan vien', 18, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (176, 'Josie Neising', 'Merill Tatham', '7953717604','','Nhan vien', 18, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (177, 'Joanne Chidwick', 'Bartlet Brennand', '3111506913','','Nhan vien', 18, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (178, 'Madonna Annwyl', 'Mable Dainty', '1579291149','','Nhan vien', 18, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (179, 'Val A''Barrow', 'Gilli de Clerk', '4918571354','','Nhan vien', 18, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (180, 'Valina Tomsa', 'Marianne Demangeon', '907650430','','Nhan vien', 18, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (181, 'Rockie Dewes', 'Margery MacGraith', '850729232','19.jpg','Giam doc', 19,19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (182, 'Stephana Effemy', 'Kent Plaunch', '9494131669','','Nhan vien', 19,19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (183, 'Al Sperwell', 'Bianca Leaton', '6424582216','','Nhan vien', 19,19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (184, 'Armstrong Wagenen', 'Lissa Exley', '1068680744','','Nhan vien', 19,19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (185, 'Hussein Florio', 'Ilse Burleigh', '1035409129','','Nhan vien', 19,19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (186, 'Iormina Huyge', 'Pavel Langrick', '9759682325','','Nhan vien', 19,19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (187, 'Guido Martignon', 'Almire Dudderidge', '7145309880','','Nhan vien', 19,19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (188, 'Melany Pettett', 'Saul Steffan', '9418281550','','Nhan vien', 19,19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (189, 'Stoddard Avrashin', 'Brandea Umbert', '60967914','','Nhan vien', 19,19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (190, 'Seumas Danick', 'Sunny Sacaze', '2034945770','','Nhan vien', 19,19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (191, 'Carmon Cartmael', 'Jerri Withams', '1924041222', '20.png','Giam doc', 20,20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (192, 'Tabby Infante', 'Harlene Boyford', '2155946155','','Nhan vien',  20,20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (193, 'Ravid Rapin', 'Jethro Massie', '8845645846','','Nhan vien',  20,20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (194, 'Latrina Powys', 'Bertrand Birks', '2917754598','','Nhan vien',  20,20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (195, 'Adi Kinghorn', 'Merill Gallanders', '1227389084','','Nhan vien',  20,20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (196, 'Raynell Pitt', 'Kiley Ordidge', '1206560271','','Nhan vien',  20,20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (197, 'Anjela Morrissey', 'Gun Jebb', '6885286188','','Nhan vien',  20,20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (198, 'Priscilla Hollyer', 'Neall Dowears', '7767149925','','Nhan vien',  20,20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (199, 'Jamill Hanfrey', 'Reade Quinsee', '3283006746','','Nhan vien',  20,20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV,HinhAnh,ChucVu, MaCongTy, MaPHG) values (200, 'Francisca Bamell', 'Buddy Betser', '7681088884','','Nhan vien', 20,20);


--Insert table CHITIETHOPDONG

insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (1, 1, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (2, 2, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (3, 3, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (4, 4, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (5, 5, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (6, 6, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (7, 7, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (8, 8, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (9, 9, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (10, 10, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (11, 11, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (12, 12, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (13, 13, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (14, 14, 7);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (15, 15, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (16, 16, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (17, 17, 8);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (18, 18, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (19, 19, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (20, 20, 19);



