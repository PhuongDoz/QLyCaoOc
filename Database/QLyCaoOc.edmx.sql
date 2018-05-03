


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
    [MaCongTy] varchar(5)  NOT NULL,
    [MaPHG] varchar(5)  NOT NULL
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
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (1, '9/26/2017', '7383267');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (2, '1/22/2018', '5128297');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (3, '6/10/2017', '9149344');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (4, '10/2/2017', '8547269');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (5, '7/29/2017', '6457242');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (6, '3/11/2018', '9623476');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (7, '1/5/2018', '7496757');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (8, '2/27/2018', '7639965');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (9, '8/30/2017', '7394350');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (10, '4/28/2017', '8357795');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (11, '3/15/2018', '5437500');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (12, '7/15/2017', '6172717');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (13, '11/11/2017', '7610223');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (14, '12/18/2017', '7844954');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (15, '10/2/2017', '8054232');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (16, '5/30/2017', '9357662');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (17, '12/4/2017', '8921325');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (18, '2/6/2018', '6716629');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (19, '6/24/2017', '5915555');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (20, '2/28/2018', '8166924');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (21, '12/26/2017', '7807001');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (22, '4/12/2018', '9503829');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (23, '10/3/2017', '8587163');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (24, '11/9/2017', '5141675');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (25, '6/4/2017', '7296717');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (26, '9/27/2017', '6333947');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (27, '2/5/2018', '6988375');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (28, '5/26/2017', '8221743');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (29, '5/10/2017', '7000758');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (30, '8/28/2017', '6399788');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (31, '3/31/2018', '8908365');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (32, '10/3/2017', '8801472');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (33, '6/22/2017', '5151072');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (34, '8/11/2017', '6702634');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (35, '6/19/2017', '6267162');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (36, '4/30/2017', '8726814');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (37, '5/3/2017', '5667481');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (38, '1/11/2018', '6638744');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (39, '7/3/2017', '6344049');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (40, '2/7/2018', '9888174');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (41, '8/31/2017', '6066238');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (42, '8/17/2017', '6848378');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (43, '8/23/2017', '6300680');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (44, '1/4/2018', '7668064');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (45, '6/11/2017', '5649930');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (46, '8/15/2017', '7606221');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (47, '9/27/2017', '7358394');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (48, '4/27/2017', '7158418');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (49, '4/6/2018', '8770932');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (50, '3/6/2018', '8815796');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (51, '8/30/2017', '8689770');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (52, '12/15/2017', '9787080');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (53, '6/7/2017', '8967783');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (54, '3/14/2018', '5541415');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (55, '7/23/2017', '5934262');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (56, '8/14/2017', '8136271');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (57, '12/2/2017', '8733801');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (58, '7/7/2017', '8255141');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (59, '12/27/2017', '5220259');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (60, '4/1/2018', '6191447');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (61, '1/5/2018', '7167248');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (62, '10/1/2017', '7963193');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (63, '12/24/2017', '8459373');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (64, '10/6/2017', '5631092');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (65, '11/6/2017', '8970117');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (66, '2/25/2018', '6651107');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (67, '11/26/2017', '8670398');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (68, '5/22/2017', '5094951');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (69, '2/10/2018', '7300117');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (70, '7/14/2017', '5346225');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (71, '11/11/2017', '9517979');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (72, '12/27/2017', '5746145');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (73, '2/18/2018', '5907681');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (74, '6/30/2017', '9636093');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (75, '7/3/2017', '6021874');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (76, '2/23/2018', '7140246');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (77, '8/22/2017', '7149797');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (78, '4/28/2017', '8030709');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (79, '6/17/2017', '5574691');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (80, '7/20/2017', '8188580');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (81, '4/19/2018', '8892886');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (82, '2/19/2018', '5654856');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (83, '10/18/2017', '8032948');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (84, '10/14/2017', '5025579');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (85, '1/18/2018', '9819620');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (86, '6/21/2017', '7024977');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (87, '9/7/2017', '8646797');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (88, '8/15/2017', '7660221');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (89, '11/27/2017', '9336927');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (90, '5/27/2017', '6090088');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (91, '3/6/2018', '5963277');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (92, '2/6/2018', '9801722');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (93, '1/21/2018', '6349917');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (94, '11/27/2017', '8485960');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (95, '3/2/2018', '8721418');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (96, '9/16/2017', '7460923');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (97, '7/7/2017', '9774860');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (98, '6/4/2017', '7426290');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (99, '6/9/2017', '6966349');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (100, '1/27/2018', '8069365');

--Insert table TANG
insert into TANG (Tang, DienTich, Gia) values (1, 100, '18287597');
insert into TANG (Tang, DienTich, Gia) values (2, 100, '15889041');
insert into TANG (Tang, DienTich, Gia) values (3, 100, '11126262');
insert into TANG (Tang, DienTich, Gia) values (4, 100, '10334383');
insert into TANG (Tang, DienTich, Gia) values (5, 100, '19483507');
insert into TANG (Tang, DienTich, Gia) values (6, 100, '13463476');
insert into TANG (Tang, DienTich, Gia) values (7, 100, '12299875');
insert into TANG (Tang, DienTich, Gia) values (8, 100, '19020699');
insert into TANG (Tang, DienTich, Gia) values (9, 100, '16080426');
insert into TANG (Tang, DienTich, Gia) values (10, 100, '16852778');
insert into TANG (Tang, DienTich, Gia) values (11, 100, '10348930');
insert into TANG (Tang, DienTich, Gia) values (12, 100, '16244305');
insert into TANG (Tang, DienTich, Gia) values (13, 100, '15939715');
insert into TANG (Tang, DienTich, Gia) values (14, 100, '13135254');
insert into TANG (Tang, DienTich, Gia) values (15, 100, '12341184');
insert into TANG (Tang, DienTich, Gia) values (16, 100, '15286795');
insert into TANG (Tang, DienTich, Gia) values (17, 100, '13653576');
insert into TANG (Tang, DienTich, Gia) values (18, 100, '11296808');
insert into TANG (Tang, DienTich, Gia) values (19, 100, '11136010');
insert into TANG (Tang, DienTich, Gia) values (20, 100, '15276245');
insert into TANG (Tang, DienTich, Gia) values (21, 100, '11317252');
insert into TANG (Tang, DienTich, Gia) values (22, 100, '12723526');
insert into TANG (Tang, DienTich, Gia) values (23, 100, '18744314');
insert into TANG (Tang, DienTich, Gia) values (24, 100, '10381174');
insert into TANG (Tang, DienTich, Gia) values (25, 100, '12074810');
insert into TANG (Tang, DienTich, Gia) values (1, 200, '28287597');
insert into TANG (Tang, DienTich, Gia) values (2, 200, '25889041');
insert into TANG (Tang, DienTich, Gia) values (3, 200, '21126262');
insert into TANG (Tang, DienTich, Gia) values (4, 200, '20334383');
insert into TANG (Tang, DienTich, Gia) values (5, 200, '29483507');
insert into TANG (Tang, DienTich, Gia) values (6, 200, '23463476');
insert into TANG (Tang, DienTich, Gia) values (7, 200, '22299875');
insert into TANG (Tang, DienTich, Gia) values (8, 200, '29020699');
insert into TANG (Tang, DienTich, Gia) values (9, 200, '26080426');
insert into TANG (Tang, DienTich, Gia) values (10, 200, '26852778');
insert into TANG (Tang, DienTich, Gia) values (11, 200, '20348930');
insert into TANG (Tang, DienTich, Gia) values (12, 200, '26244305');
insert into TANG (Tang, DienTich, Gia) values (13, 200, '25939715');
insert into TANG (Tang, DienTich, Gia) values (14, 200, '23135254');
insert into TANG (Tang, DienTich, Gia) values (15, 200, '22341184');
insert into TANG (Tang, DienTich, Gia) values (16, 200, '25286795');
insert into TANG (Tang, DienTich, Gia) values (17, 200, '23653576');
insert into TANG (Tang, DienTich, Gia) values (18, 200, '21296808');
insert into TANG (Tang, DienTich, Gia) values (19, 200, '21136010');
insert into TANG (Tang, DienTich, Gia) values (20, 200, '25276245');
insert into TANG (Tang, DienTich, Gia) values (21, 200, '21317252');
insert into TANG (Tang, DienTich, Gia) values (22, 200, '22723526');
insert into TANG (Tang, DienTich, Gia) values (23, 200, '28744314');
insert into TANG (Tang, DienTich, Gia) values (24, 200, '20381174');
insert into TANG (Tang, DienTich, Gia) values (25, 200, '22074810');


-- Insert table PHONG
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (1, 'Gar Cullerne', 1, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (2, 'Sharon Duplan', 1, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (3, 'Rona Aitkenhead', 1, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (4, 'Opaline Scudders', 1, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (5, 'Zaccaria Ledgley', 2, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (6, 'Basilius Mussalli', 2, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (7, 'Ibrahim Defraine', 2, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (8, 'Allis Geeve', 2, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (9, 'Casandra Gobourn', 3, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (10, 'Mathilda Chomicz', 3, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (11, 'Mari Domesday', 3, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (12, 'Adan Clorley', 3, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (13, 'Ileane Piesing', 4, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (14, 'Dulsea Jirousek', 4, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (15, 'Wolfie Plaid', 4, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (16, 'Upton Skinley', 4, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (17, 'Sacha Schettini', 5, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (18, 'Rennie Hewlings', 5, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (19, 'Roselin Twycross', 5, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (20, 'Gawen Cunnane', 5, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (21, 'Janella Haliburton', 6, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (22, 'Kimbell Camois', 6, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (23, 'Linell Lince', 6, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (24, 'Louie Bibey', 6, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (25, 'Angelia Byforth', 7, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (26, 'Deeyn O''Flynn', 7, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (27, 'Bonnie Golds', 7, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (28, 'Armin Petrasch', 7, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (29, 'Ingrid Voules', 8, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (30, 'Thatcher Wendover', 8, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (31, 'Erminia Bracknell', 8, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (32, 'Sarene Allworthy', 8, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (33, 'Reyna Gill', 9, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (34, 'Frederique O''Regan', 9, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (35, 'Abagail Ramberg', 9, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (36, 'Emmet Botting', 9, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (37, 'Anastasia Fairnie', 10, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (38, 'Papageno Tresise', 10, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (39, 'Aarika Axup', 10, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (40, 'Honey Ledingham', 10, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (41, 'Luigi Duckett', 11, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (42, 'Helen-elizabeth Aughton', 11, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (43, 'Corliss Malzard', 11, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (44, 'Davis Maitland', 11, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (45, 'Rozanna Sange', 12, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (46, 'Ibby Alden', 12, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (47, 'Latashia Chattoe', 12, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (48, 'Orion Jerke', 12, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (49, 'Murry Aspinal', 13, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (50, 'Winifield Kendred', 13, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (51, 'Wilhelmine Yorston', 13, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (52, 'Jillayne Cossentine', 13, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (53, 'Earvin Jakovijevic', 14, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (54, 'Bernetta Erlam', 14, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (55, 'Ingrim Gilder', 14, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (56, 'Quintin Simnett', 14, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (57, 'Sue Pigford', 15, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (58, 'Goldie Boyce', 15, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (59, 'Donny Reddin', 15, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (60, 'Clareta Richten', 15, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (61, 'Thornton Duffil', 16, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (62, 'Melisa Symondson', 16, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (63, 'Letti O''Carran', 16, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (64, 'Jeniece Cunradi', 16, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (65, 'Cully Jenckes', 17, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (66, 'Almeda Clyburn', 17, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (67, 'Humfrey Halmkin', 17, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (68, 'Jen Bilbery', 17, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (69, 'Giovanna Nijs', 18, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (70, 'Sheridan Lyle', 18, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (71, 'Tara Fenemore', 18, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (72, 'Dar Borchardt', 18, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (73, 'Kori Pringle',19, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (74, 'Riley Carsberg', 19, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (75, 'Chaddy Gull', 19, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (76, 'Tommie Kilalea', 19, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (77, 'Joelly Baldree', 20, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (78, 'Darcy Coopman', 20, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (79, 'Emmey Bucklan', 20, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (80, 'Ulick Supple', 20, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (81, 'Jolene Childs', 21, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (82, 'Edmon Cockhill', 21, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (83, 'Mahalia Davey', 21, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (84, 'Salomon Dobby', 21, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (85, 'Clevie Hammill', 22, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (86, 'Brien Greene', 22, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (87, 'Domingo Bennison', 22, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (88, 'Berk Skill', 22, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (89, 'Donal Gruszczak', 23, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (90, 'Miriam Lighterness', 23, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (91, 'Pammi Helsby', 23, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (92, 'Nicola McTrustey', 23, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (93, 'Jo Hymers', 24, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (94, 'Ancell Gauld', 24, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (95, 'Danell Paynter', 24, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (96, 'Valaria Stebbins', 24,200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (97, 'Sadie Bond', 25, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (98, 'Doro Janc', 25, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (99, 'Stephannie Diamond', 25, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (100, 'Dyana Taberer', 25, 200);


--insert table CONGTY

insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (1, 'Marna Tupman', 'Charles Delea', '490-118-5583', 1);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (2, 'Debi Daniel', 'Darin Trainer', '757-942-3707', 2);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (3, 'Aharon Warlowe', 'Shandee Gateshill', '284-871-6762', 3);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (4, 'Zollie Vynall', 'Lou Worg', '223-881-6293', 4);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (5, 'Adair Grimmolby', 'Merry Costall', '678-453-1532', 5);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (6, 'Maura Campos', 'Rusty Kiddell', '601-839-1862', 6);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (7, 'Tiertza Sweatland', 'Charmian Arnholtz', '964-938-4039', 7);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (8, 'Finley Keep', 'Matelda Corbin', '540-195-9778', 8);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (9, 'Gabey Badcock', 'Augustus Surr', '917-744-7575', 9);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (10, 'Giles Ogden', 'Juan Laidlaw', '259-333-0141', 10);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (11, 'Rosalind McKeney', 'Sherie Sidlow', '770-830-0203', 11);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (12, 'Estevan Bascomb', 'Hermia Yaldren', '223-311-9416', 12);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (13, 'Fidelia Halgarth', 'Davis Newvill', '462-266-3865', 13);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (14, 'Rochester Barhems', 'Sansone Durran', '231-999-0634', 14);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (15, 'Son Revance', 'Maddie Adamthwaite', '225-569-1962', 15);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (16, 'Cacilia Cattow', 'Kerrill Puttick', '147-556-5658', 16);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (17, 'Kellyann Wardhough', 'Valencia O''Flynn', '534-659-2938', 17);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (18, 'Borden Hruska', 'Bernita Bamlet', '270-248-5522', 18);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (19, 'Reinald Hawton', 'Ricky Karby', '454-742-7545', 19);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (20, 'Nyssa Burbridge', 'Henrik Dimmer', '331-622-8247', 20);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (21, 'Jennee Beel', 'Alberik Pedgrift', '995-138-7271', 21);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (22, 'Emmery Scothorn', 'Dugald Halshaw', '918-295-3514', 22);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (23, 'Kirk Grinyakin', 'Danielle Daniells', '147-575-1081', 23);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (24, 'Jemie MacCafferky', 'Sidonia Howitt', '540-489-0510', 24);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (25, 'Bab Moulson', 'Chance Proschek', '470-534-1157', 25);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (26, 'Grace Panting', 'Anderson Girling', '377-700-9258', 26);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (27, 'Gray Goeff', 'Ferdy Blakebrough', '107-984-2988', 27);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (28, 'Guthrey Knight', 'Gwendolyn Vlasov', '402-125-6511', 28);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (29, 'Gelya Walter', 'Brant Gorman', '466-306-5839', 29);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (30, 'Cullan Leeson', 'Kerry McCrow', '841-145-1690', 30);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (31, 'Belinda Gullivent', 'Benjamin Kerkham', '899-698-0408', 31);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (32, 'Margo Itzkovwitch', 'Veradis Kobsch', '676-206-4754', 32);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (33, 'Anthony Moseley', 'Bibi Osborne', '612-484-9125', 33);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (34, 'Basilius Tassell', 'Billy Ruggiero', '460-931-1783', 34);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (35, 'Skipp Cecere', 'Saunderson Pittson', '197-486-5125', 35);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (36, 'Odella Quiney', 'Celine Burnand', '692-389-9060', 36);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (37, 'Iseabal Moubray', 'Aubrey Nottingham', '532-365-1535', 37);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (38, 'Guenna Girdlestone', 'Jemie Gale', '258-946-6065', 38);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (39, 'Helsa Peppin', 'Townsend Spellesy', '405-427-2396', 39);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (40, 'King Bibb', 'Anabel Ughelli', '978-622-1232', 40);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (41, 'Hershel Castells', 'Danyette Groomebridge', '666-206-6295', 41);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (42, 'Jerome Pfeuffer', 'Gustavo Vittori', '176-198-6462', 42);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (43, 'Geno Arnopp', 'Wilek Burde', '577-644-4057', 43);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (44, 'Laraine Bake', 'Brien Fullilove', '656-140-3386', 44);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (45, 'Dave Shatliff', 'Beret Prier', '167-223-9793', 45);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (46, 'Stepha Tuffs', 'Hershel Khomin', '629-978-9480', 46);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (47, 'Patti MacConnel', 'Xymenes Cornely', '772-341-7065', 47);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (48, 'Jo ann Storre', 'Cristi Woffinden', '648-291-3235', 48);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (49, 'Dinnie Shilburne', 'Marlyn Dewhurst', '649-494-0656', 49);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (50, 'Mechelle Idell', 'Raddie Gilby', '339-437-7425', 50);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (51, 'Hester Bayman', 'Randall Shoebridge', '988-783-2505', 51);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (52, 'Palmer Matias', 'Caro Lawty', '825-756-7486', 52);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (53, 'Susann Hursthouse', 'Giles Colthurst', '827-958-4895', 53);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (54, 'Mendel Anand', 'Clarine Hincks', '952-230-9241', 54);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (55, 'Cherey Duny', 'Egor Dorton', '724-952-7380', 55);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (56, 'Kelcy Babcock', 'Theodoric Duffy', '839-842-3536', 56);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (57, 'Chanda Cuttell', 'Stu MacElane', '943-765-0153', 57);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (58, 'Allsun Curnow', 'Vick Claque', '895-723-4324', 58);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (59, 'Xerxes McTrustam', 'Curran Lawless', '461-722-6792', 59);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (60, 'Saxe Hatfull', 'Stormie Yantsurev', '820-706-1604', 60);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (61, 'Joyann Yeates', 'Darrell Copner', '247-726-3435', 61);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (62, 'Inna Baker', 'Maurene Cadore', '512-201-2790',62);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (63, 'Elana Ablett', 'Demetra Scales', '292-362-1782', 63);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (64, 'Latisha Spain', 'Muriel Ajsik', '574-991-5968', 64);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (65, 'Boycie Kindle', 'Florrie Penson', '495-165-8817', 65);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (66, 'Linette Bramstom', 'Angelique O''Nion', '254-943-8715', 66);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (67, 'Grady Slator', 'Syd Piotrowski', '139-481-8512', 67);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (68, 'Sapphire Nanninini', 'Dougy Studeart', '474-556-7858', 68);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (69, 'Nicholas Zanneli', 'Shirlee Cavozzi', '912-896-2335', 69);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (70, 'Ignazio Glede', 'Arte Souch', '597-162-5073', 70);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (71, 'Maurizia Belbin', 'Janey Birdsall', '299-850-2805', 71);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (72, 'Eddie Aujouanet', 'Jaclyn Charity', '225-118-1441', 72);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (73, 'Annadiane Infantino', 'Christean Aldcorn', '927-938-5905', 73);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (74, 'Sharon Suston', 'Clerissa Trembey', '727-247-3705', 74);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (75, 'Jarrod Bleackly', 'Klara Humby', '228-147-4164', 75);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (76, 'Corey Leathes', 'Alwyn Bamling', '153-355-4175', 76);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (77, 'Eugenius Giral', 'Danny Pollen', '450-545-4986', 77);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (78, 'Papageno Frisel', 'Kelila Helmke', '795-886-4790', 78);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (79, 'Marya Wingeat', 'Sherwin Karpets', '553-711-2069', 79);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (80, 'Pamella Schimek', 'Nancy Physick', '604-476-8035', 80);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (81, 'Walsh Chimienti', 'Lynde Brisbane', '659-226-4227', 81);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (82, 'Karla Tremontana', 'Faustina Scammell', '329-764-1639', 82);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (83, 'Anjanette Hierro', 'Zorina Rashleigh', '502-917-5333', 83);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (84, 'Milo Sizey', 'Cass Brimfield', '323-482-7260', 84);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (85, 'Jerrine Leek', 'Nadya Laurentin', '847-117-6195', 85);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (86, 'Friedrich Livings', 'Hadley Rosberg', '991-430-3874', 86);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (87, 'Barclay Isaacs', 'Daphene Hudspeth', '101-909-6499', 87);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (88, 'Jecho Klimshuk', 'Imogene McRae', '483-590-5180', 88);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (89, 'Tadeo Goggan', 'Kinny Gurry', '592-301-4202', 89);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (90, 'Farlie Fishwick', 'Shanta Pittway', '971-198-6079', 90);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (91, 'Cordelie Halcro', 'Kimball Couchman', '446-875-6578', 91);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (92, 'Wyatan Jirik', 'Sargent Hawlgarth', '247-834-5711', 92);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (93, 'Mord Downton', 'Wang Broadbridge', '512-547-5135', 93);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (94, 'Ilyse Crosscombe', 'Kaye Tompkiss', '605-333-7354', 94);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (95, 'Rosella Woolway', 'Vonny Burgot', '149-244-0238', 95);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (96, 'Elliot Faherty', 'Nessi Husk', '472-804-8578', 96);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (97, 'Barry Bartolozzi', 'Ayn Beckhurst', '488-205-8983', 97);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (98, 'Jackie Petit', 'Filippo Stockell', '912-344-5859', 98);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (99, 'Art Ramstead', 'Marc Gimson', '473-578-9985', 99);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (100, 'Quintana Dron', 'Ailis Ovize', '165-170-8024', 100);


-- Insert table NHANVIEN
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (1, 'Gwyneth Le Sarr', 'Ricky De Mitris', '3801616618', 1, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (2, 'Perry Fox', 'Flossie Kirkby', '1359782730', 1, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (3, 'Tanya Bocke', 'Anne-marie McLleese', '7756831544', 2, 2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (4, 'Jean Dahmke', 'Benjy Lawrenson', '4519254222', 2, 2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (5, 'Silvano Undrill', 'Ulrika Ferrulli', '3725305507', 3, 3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (6, 'Clara Lidgey', 'Cherey Depper', '3335131098', 3, 3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (7, 'Evvy Abbott', 'Alister Styan', '6576129294', 4, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (8, 'Barbi Padly', 'Vail MacMeekan', '9683740989', 4, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (9, 'Kearney Druce', 'Richard Jonczyk', '6461323718', 5, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (10, 'Karil Andrichak', 'Amble Sandom', '7409796594', 5, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (11, 'Teddy Leathe', 'Darill Pimer', '6733769169', 6, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (12, 'Eda Slides', 'Kimmie Hullin', '9406739411', 6, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (13, 'Rafa McGibbon', 'Sibyl Graver', '8111095332', 7, 7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (14, 'Noland Faragan', 'Doris Giacobilio', '6208832809', 7, 7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (15, 'Colman Sepey', 'Mike Vinall', '1227788631', 8, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (16, 'Othilie MacFarlan', 'Reid Pixton', '2512061358', 8, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (17, 'Monique Probbin', 'Jodie Dahlgren', '9177115358', 9, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (18, 'Shermy Booeln', 'Tarrance Christiensen', '5826718255', 9, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (19, 'Caprice Ivanyushkin', 'Grete Bramont', '9966641447', 10, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (20, 'Gareth Gravenor', 'Anatol Utton', '5297708965', 10, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (21, 'Lanae Raffin', 'Aurthur MacKaig', '5443187772', 11, 11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (22, 'Nataline Lenney', 'Enrichetta Keelinge', '19691815', 11, 11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (23, 'Isidor Hartropp', 'Windy Whitty', '6122388020', 12, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (24, 'Rock Haughey', 'Shay Crinkley', '2975280247', 12, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (25, 'Dory Eastlake', 'Clarinda Eliet', '5158965955', 13, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (26, 'Kaja Fardon', 'Maurine Goodding', '9956465782', 13, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (27, 'Porter Stebles', 'Mikol Piller', '6992016611', 14, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (28, 'Phillipe BURWIN', 'Spense Churchman', '6413833327', 14, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (29, 'Millie Grouvel', 'Robina Atcock', '2845305327', 15, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (30, 'Alleyn Chomley', 'Christophorus Bester', '1044962834', 15, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (31, 'Leonora Pearn', 'Stephanie Halbeard', '2754989156', 16, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (32, 'Saloma Brislane', 'Meg Lynock', '9297466806', 16, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (33, 'Susana Halfacre', 'Michele Clague', '9392990149', 17, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (34, 'Bertina Pettendrich', 'Anson Bly', '3792970709', 17, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (35, 'Karita Klimschak', 'Blakeley Meneo', '9993568212', 18, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (36, 'Darius Haythorn', 'Winslow Worledge', '2546535205', 18, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (37, 'Bronson Mallalieu', 'Marwin Pickersail', '2854265132', 19, 19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (38, 'Hart Clewlow', 'Orion Abramowitz', '6595961076', 19, 19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (39, 'Glen Fahrenbacher', 'Marie-jeanne Abramowsky', '9554946148', 20, 20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (40, 'Katinka Maylam', 'Allyce Butner', '1371536490', 20, 20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (41, 'Clemmy Penticost', 'Archaimbaud Hurche', '7469400133', 21, 21);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (42, 'Gill Hattiff', 'Vanda Stood', '2603122586', 21, 21);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (43, 'Cristie Iston', 'Hewie Gilhool', '9884699106', 22, 22);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (44, 'Asher Adderley', 'Lucia Gouge', '869262921', 22, 22);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (45, 'Mufi Dix', 'Padgett Shutte', '8748290195', 23, 23);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (46, 'Selina Shewery', 'Robin Northcott', '3842756763', 23, 23);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (47, 'Markos Camlin', 'Gabe Starkey', '2583418619', 24, 24);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (48, 'Kendall Ryal', 'Caleb Zellner', '2906422575', 24, 24);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (49, 'Jerrine Neads', 'Hatty Throughton', '8862594419', 25, 25);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (50, 'Lev Coskerry', 'Percival Allix', '5144276652', 25, 25);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (51, 'Fidelio Toombs', 'Cassondra Kinvig', '5742162862', 26, 26);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (52, 'Gunther Dougher', 'Kleon Yaakov', '8954391258', 26, 26);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (53, 'Felipe Slowly', 'Jeanelle Weedenburg', '3461030956', 27, 27);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (54, 'Manuel Rain', 'Bronny Sulland', '3923234914', 27, 27);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (55, 'Min Morris', 'Gabrila Tidmarsh', '6663458054', 28, 28);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (56, 'Kristo Poupard', 'Ly Seide', '8786224044', 28, 28);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (57, 'Damian Banner', 'Honey Gownge', '92351773', 29, 29);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (58, 'Prudence Hardstaff', 'Clemmie Payn', '4599500', 29, 29);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (59, 'Otis Brumhead', 'Chaunce Bannell', '4231614664', 30, 30);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (60, 'Dusty Wind', 'Lani Woodger', '4283020980', 30, 30);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (61, 'Izaak Matushevich', 'Ashlee Berntsson', '7948807658', 31, 31);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (62, 'Amalea Shayler', 'Bryna Murra', '9493216835', 31, 31);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (63, 'Kalindi Jenney', 'Mehetabel Bulger', '6333263317', 32, 32);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (64, 'Ashia Wesker', 'Leonore McCorrie', '3885400238', 32, 32);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (65, 'Raoul Bearns', 'Mignon Pawlik', '6763205049', 33, 33);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (66, 'Gardener Webburn', 'Ede Vanyatin', '7798473969', 33, 33);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (67, 'Lee Rama', 'Harrie Lapish', '4178007810', 34, 34);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (68, 'Nonnah Lytlle', 'Abigael Etuck', '9957747955', 34, 34);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (69, 'Aylmar Stinchcombe', 'Clarisse Ghioni', '1043990211', 35, 35);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (70, 'Hilda Patman', 'Virginia Milmore', '2165802992', 35, 35);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (71, 'Corinna Henstone', 'Pennie Dockwray', '2761449579', 36, 36);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (72, 'Turner Orans', 'Sigfried Slee', '3759922294', 36, 36);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (73, 'Ansell Nesey', 'Rosemonde Pervoe', '7365917664', 37, 37);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (74, 'Mahalia Bricket', 'Eb Junkison', '5767121985', 37, 37);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (75, 'Meade Leyden', 'Dedra Krzyzowski', '8391557687', 38, 38);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (76, 'Walther Mathet', 'Elia Seville', '7241138263', 38, 38);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (77, 'Murray Oakman', 'Jori Deinhardt', '9297241175', 39, 39);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (78, 'Callean Renwick', 'Codi McKeating', '7076212485', 39, 39);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (79, 'Tracee Ormes', 'Danny Edghinn', '5786684033', 40, 40);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (80, 'Murdoch Panniers', 'Hashim Bogges', '4468735450', 40, 40);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (81, 'Laurianne Sammut', 'Alena Valenti', '6722051944', 41, 41);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (82, 'Malchy Clancy', 'Elmo Jeste', '6955697353', 41, 41);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (83, 'Abbey Karpol', 'Suzanne Gorges', '5874088734', 42, 42);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (84, 'Frasier Brickett', 'Dewie Zeal', '3245576596', 42, 42);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (85, 'Al Angeli', 'Bevvy Fluck', '5626223247', 43, 43);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (86, 'Mickie Mushawe', 'Joyous Fuzzens', '7957443142', 43, 43);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (87, 'Yalonda Lewer', 'Lamont Cromett', '9258198892', 44, 44);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (88, 'Yovonnda Durram', 'Brent Aitken', '4864865641', 44, 44);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (89, 'Zahara Gindghill', 'Adriane Aimson', '3772438645', 45, 45);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (90, 'Harmonie Rivett', 'Burtie Beurich', '1496068978', 45, 45);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (91, 'Hinze Moughtin', 'Myca Bockin', '7028849941', 46, 46);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (92, 'Liuka Savatier', 'Rorke McClory', '4127080254', 46, 46);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (93, 'Rossy Ossipenko', 'Stephie Gueste', '4921761063', 47, 47);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (94, 'Rois Shemmans', 'Florella Abramovicz', '9148407733', 47, 47);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (95, 'Pace Boost', 'Pepillo Cantillon', '7124094192', 48, 48);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (96, 'Myrle Dresche', 'Nadeen Newarte', '3045281576', 48, 48);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (97, 'Luciano Westhoff', 'Dulciana Hess', '7929709766', 49, 49);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (98, 'Cherey Alten', 'Jaime Reynold', '8897628995', 49, 49);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (99, 'Philippine Winterbotham', 'Myrtle Wilson', '5668958845', 50, 50);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (100, 'Farris Vasiltsov', 'Rivkah Brailsford', '1698332070', 50, 50);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (101, 'Morgana Ornils', 'Trumann Tinker', '3336854764', 51, 51);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (102, 'Iseabal Qualtro', 'Emerson Shanks', '2721953820', 51, 51);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (103, 'Charisse Everson', 'Rosalinde Strettell', '5442544138', 52, 52);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (104, 'Elladine Geke', 'Leela Glowacha', '7734887347', 52, 52);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (105, 'Erna Godley', 'Sidoney Skirvin', '1366914910', 53, 53);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (106, 'Althea Havoc', 'Gabriele Winger', '2551452476', 53, 53);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (107, 'Victoria Avrahamof', 'Quincy Royste', '1155545405', 54, 54);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (108, 'Ali Dockrill', 'Hailee Quilligan', '2202460352', 54, 54);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (109, 'Karrah Craigmile', 'Luther Ilett', '2803075083', 55, 55);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (110, 'Elroy Cabena', 'Lizabeth Dannett', '3819142466', 55, 55);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (111, 'Jameson Chudleigh', 'Con Riditch', '8248703344', 56, 56);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (112, 'Datha Barbara', 'Izak Areles', '6898341848', 56, 56);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (113, 'Kinnie Kruszelnicki', 'Arlan Sutherns', '7856322852', 57, 57);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (114, 'Mathe Ivel', 'Edithe Sallowaye', '1944026400', 57, 57);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (115, 'Sullivan Beining', 'Tynan Girhard', '1822987621', 58, 58);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (116, 'Elita Muffin', 'Rob Mott', '1306880849', 58, 58);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (117, 'Keary Castro', 'Zonnya Leindecker', '1852941088', 59, 59);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (118, 'Emmott Aldcorn', 'Bobbe Guitt', '46032599', 59, 59);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (119, 'Concordia Lamborn', 'Consuelo Littleover', '1816058048', 60, 60);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (120, 'Joshuah Doige', 'Philly Sreenan', '8799751813', 60, 60);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (121, 'Bret Lorek', 'Matti Cass', '4898533108', 61, 61);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (122, 'Pascal Haukey', 'Leena Stainson', '9553545745', 61, 61);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (123, 'Peadar Jonas', 'Dale Dacke', '5624072819', 62, 62);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (124, 'Mark Glawsop', 'Homere Austing', '2972192271', 62, 62);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (125, 'Tommy Testo', 'Shannen Cryer', '4762636044', 63, 63);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (126, 'Mari Hacking', 'Phillie Portman', '5308046557', 63, 63);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (127, 'Myca Kemetz', 'Jana Kenion', '7424884202', 64, 64);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (128, 'Claudius Colam', 'Lazar Dash', '3338776219', 64, 64);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (129, 'Nicolais Twidle', 'Maddie Cowpland', '6233225899', 65, 65);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (130, 'Ferdinand Glynne', 'Gabbi Nicholson', '7002339491', 65, 65);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (131, 'Angela Pascoe', 'Jeremiah Tabbernor', '2082101671', 66, 66);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (132, 'Oberon Thowes', 'Dacey Glazzard', '3387990890', 66, 66);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (133, 'Tucker Preto', 'Marta Siddeley', '9529901836', 67, 67);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (134, 'Lauri Castanos', 'Marilin Silcock', '220146640', 67, 67);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (135, 'Opalina Keeri', 'Shandeigh Seage', '4686384563', 68, 68);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (136, 'Fionna Saltern', 'Orella Brosh', '2191135189', 68, 68);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (137, 'Ronnie Barthorpe', 'Jo ann Egdal', '4703816584', 69, 69);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (138, 'Ewen Goodsell', 'Shandee Gilburt', '5696705896', 69, 69);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (139, 'Heidie Confait', 'Rouvin Peachman', '8777779262', 70, 70);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (140, 'Erma Feldfisher', 'Yoko Sahnow', '783981980', 70, 70);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (141, 'Yoshi Trodler', 'Roman Bewly', '3939548524', 71, 71);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (142, 'Alix Gulvin', 'Vanda Gostage', '3213237552', 71, 71);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (143, 'Biron Mulkerrins', 'Murvyn Andrioni', '5158987881', 72, 72);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (144, 'Selia Huckle', 'Shanda Cownden', '6163696577', 72, 72);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (145, 'Buck Burkill', 'Zelda Edards', '1211210858', 73, 73);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (146, 'Skippy Radclyffe', 'Alejoa Kitchiner', '5292574069', 73, 73);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (147, 'Elsie Briers', 'Chantalle Merrigans', '9106487891', 74, 74);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (148, 'Ernesto Buntin', 'Alvin Pinniger', '3669361848', 74, 74);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (149, 'Krispin Dunning', 'Torry Sickamore', '560602689', 75, 75);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (150, 'Kynthia Loveridge', 'Ennis MacBey', '5184555520', 75, 75);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (151, 'Caddric Sandells', 'Tarrance Danielot', '3511792341', 76, 76);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (152, 'Jelene Fennelow', 'Julita Drysdall', '6493544363', 76, 76);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (153, 'Delphine Kinnear', 'Leroi Toward', '3388563418', 77, 77);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (154, 'Boris Beelby', 'Germaine Paslow', '2731329613', 77, 77);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (155, 'Abdel Stanlock', 'Lion Rauprich', '4855917836', 78, 78);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (156, 'Fianna Tomaselli', 'Art Hazelton', '2223614542', 78, 78);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (157, 'Tisha Lowle', 'Paquito Izhaky', '6615401362', 79, 79);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (158, 'Luke Norvill', 'Darcy Aldwich', '7635931061', 79, 79);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (159, 'Ora Pattinson', 'Connie Brimble', '5955334716', 80, 80);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (160, 'Enoch Reedshaw', 'Gregory Salaman', '9736874397', 80, 80);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (161, 'Read Strutz', 'Brander MacColgan', '3917950073', 81, 81);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (162, 'Anna-diana Ricart', 'Riley Wigfield', '5467193569', 81, 81);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (163, 'Gretta Ralph', 'Norry Caulliere', '6443370626', 82, 82);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (164, 'Colly Braams', 'Matt Frounks', '7705907696', 82, 82);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (165, 'Albina Cholmondeley', 'Rozelle Tucsell', '1242420922', 83, 83);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (166, 'Iona Barge', 'Minda Nairns', '8006260821', 83, 83);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (167, 'Joshua Feavers', 'Doria Dodshun', '3737557027', 84, 84);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (168, 'Joyce Kenwin', 'Alix Gaisford', '5965625498', 84, 84);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (169, 'Dasie Dinwoodie', 'Emile Sposito', '1352480208', 85, 85);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (170, 'Mercy Nilges', 'Patton Petracchi', '4455199501', 85, 85);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (171, 'Domini Avrasin', 'Ardith Rushmer', '7019433452', 86, 86);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (172, 'Ingaborg Biasotti', 'La verne Hannigane', '5329327497', 86, 86);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (173, 'Annalise Townsend', 'Hanna McQuarrie', '7072505255', 87, 87);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (174, 'Roscoe Frier', 'Gabriele Donativo', '1075987003', 87, 87);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (175, 'Staford Scotson', 'Lavinie Brenard', '2751754312', 88, 88);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (176, 'Josie Neising', 'Merill Tatham', '7953717604', 88, 88);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (177, 'Joanne Chidwick', 'Bartlet Brennand', '3111506913', 89, 89);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (178, 'Madonna Annwyl', 'Mable Dainty', '1579291149', 89, 89);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (179, 'Val A''Barrow', 'Gilli de Clerk', '4918571354', 90, 90);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (180, 'Valina Tomsa', 'Marianne Demangeon', '907650430', 90, 90);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (181, 'Rockie Dewes', 'Margery MacGraith', '850729232', 91, 91);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (182, 'Stephana Effemy', 'Kent Plaunch', '9494131669', 91, 91);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (183, 'Al Sperwell', 'Bianca Leaton', '6424582216', 92, 92);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (184, 'Armstrong Wagenen', 'Lissa Exley', '1068680744', 92, 92);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (185, 'Hussein Florio', 'Ilse Burleigh', '1035409129', 93, 93);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (186, 'Iormina Huyge', 'Pavel Langrick', '9759682325', 93, 93);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (187, 'Guido Martignon', 'Almire Dudderidge', '7145309880', 94, 94);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (188, 'Melany Pettett', 'Saul Steffan', '9418281550', 94, 94);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (189, 'Stoddard Avrashin', 'Brandea Umbert', '60967914', 95, 95);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (190, 'Seumas Danick', 'Sunny Sacaze', '2034945770', 95, 95);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (191, 'Carmon Cartmael', 'Jerri Withams', '1924041222', 96, 96);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (192, 'Tabby Infante', 'Harlene Boyford', '2155946155', 96, 96);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (193, 'Ravid Rapin', 'Jethro Massie', '8845645846', 97, 97);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (194, 'Latrina Powys', 'Bertrand Birks', '2917754598', 97, 97);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (195, 'Adi Kinghorn', 'Merill Gallanders', '1227389084', 98, 98);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (196, 'Raynell Pitt', 'Kiley Ordidge', '1206560271', 98, 98);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (197, 'Anjela Morrissey', 'Gun Jebb', '6885286188', 99, 99);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (198, 'Priscilla Hollyer', 'Neall Dowears', '7767149925', 99, 99);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (199, 'Jamill Hanfrey', 'Reade Quinsee', '3283006746', 100, 100);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (200, 'Francisca Bamell', 'Buddy Betser', '7681088884', 100, 100);


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
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (21, 21, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (22, 22, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (23, 23, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (24, 24, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (25, 25, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (26, 26, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (27, 27, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (28, 28, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (29, 29, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (30, 30, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (31, 31, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (32, 32, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (33, 33, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (34, 34, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (35, 35, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (36, 36, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (37, 37, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (38, 38, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (39, 39, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (40, 40, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (41, 41, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (42, 42, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (43, 43, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (44, 44, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (45, 45, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (46, 46, 7);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (47, 47, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (48, 48, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (49, 49, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (50, 50, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (51, 51, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (52, 52, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (53, 53, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (54, 54, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (55, 55, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (56, 56, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (57, 57, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (58, 58, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (59, 59, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (60, 60, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (61, 61, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (62, 62, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (63, 63, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (64, 64, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (65, 65, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (66, 66, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (67, 67, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (68, 68, 23);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (69, 69, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (70, 70, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (71, 71, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (72, 72, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (73, 73, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (74, 74, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (75, 75, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (76, 76, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (77, 77, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (78, 78, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (79, 79, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (80, 80, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (81, 81, 7);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (82, 82, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (83, 83, 8);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (84, 84, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (85, 85, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (86, 86, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (87, 87, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (88, 88, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (89, 89, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (90, 90, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (91, 91, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (92, 92, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (93, 93, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (94, 94, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (95, 95, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (96, 96, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (97, 97, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (98, 98, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (99, 99, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (100, 100, 23);



