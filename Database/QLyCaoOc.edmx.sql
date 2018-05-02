


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

insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (1, 'Marna Tupman', 'Charles Delea', '490-118-5583', 112);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (2, 'Debi Daniel', 'Darin Trainer', '757-942-3707', 17);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (3, 'Aharon Warlowe', 'Shandee Gateshill', '284-871-6762', 173);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (4, 'Zollie Vynall', 'Lou Worg', '223-881-6293', 32);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (5, 'Adair Grimmolby', 'Merry Costall', '678-453-1532', 82);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (6, 'Maura Campos', 'Rusty Kiddell', '601-839-1862', 13);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (7, 'Tiertza Sweatland', 'Charmian Arnholtz', '964-938-4039', 34);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (8, 'Finley Keep', 'Matelda Corbin', '540-195-9778', 187);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (9, 'Gabey Badcock', 'Augustus Surr', '917-744-7575', 83);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (10, 'Giles Ogden', 'Juan Laidlaw', '259-333-0141', 160);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (11, 'Rosalind McKeney', 'Sherie Sidlow', '770-830-0203', 167);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (12, 'Estevan Bascomb', 'Hermia Yaldren', '223-311-9416', 150);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (13, 'Fidelia Halgarth', 'Davis Newvill', '462-266-3865', 155);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (14, 'Rochester Barhems', 'Sansone Durran', '231-999-0634', 175);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (15, 'Son Revance', 'Maddie Adamthwaite', '225-569-1962', 179);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (16, 'Cacilia Cattow', 'Kerrill Puttick', '147-556-5658', 156);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (17, 'Kellyann Wardhough', 'Valencia O''Flynn', '534-659-2938', 15);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (18, 'Borden Hruska', 'Bernita Bamlet', '270-248-5522', 15);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (19, 'Reinald Hawton', 'Ricky Karby', '454-742-7545', 158);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (20, 'Nyssa Burbridge', 'Henrik Dimmer', '331-622-8247', 40);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (21, 'Jennee Beel', 'Alberik Pedgrift', '995-138-7271', 130);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (22, 'Emmery Scothorn', 'Dugald Halshaw', '918-295-3514', 179);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (23, 'Kirk Grinyakin', 'Danielle Daniells', '147-575-1081', 194);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (24, 'Jemie MacCafferky', 'Sidonia Howitt', '540-489-0510', 129);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (25, 'Bab Moulson', 'Chance Proschek', '470-534-1157', 11);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (26, 'Grace Panting', 'Anderson Girling', '377-700-9258', 101);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (27, 'Gray Goeff', 'Ferdy Blakebrough', '107-984-2988', 57);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (28, 'Guthrey Knight', 'Gwendolyn Vlasov', '402-125-6511', 97);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (29, 'Gelya Walter', 'Brant Gorman', '466-306-5839', 159);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (30, 'Cullan Leeson', 'Kerry McCrow', '841-145-1690', 108);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (31, 'Belinda Gullivent', 'Benjamin Kerkham', '899-698-0408', 137);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (32, 'Margo Itzkovwitch', 'Veradis Kobsch', '676-206-4754', 48);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (33, 'Anthony Moseley', 'Bibi Osborne', '612-484-9125', 174);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (34, 'Basilius Tassell', 'Billy Ruggiero', '460-931-1783', 42);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (35, 'Skipp Cecere', 'Saunderson Pittson', '197-486-5125', 54);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (36, 'Odella Quiney', 'Celine Burnand', '692-389-9060', 137);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (37, 'Iseabal Moubray', 'Aubrey Nottingham', '532-365-1535', 192);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (38, 'Guenna Girdlestone', 'Jemie Gale', '258-946-6065', 21);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (39, 'Helsa Peppin', 'Townsend Spellesy', '405-427-2396', 175);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (40, 'King Bibb', 'Anabel Ughelli', '978-622-1232', 111);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (41, 'Hershel Castells', 'Danyette Groomebridge', '666-206-6295', 8);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (42, 'Jerome Pfeuffer', 'Gustavo Vittori', '176-198-6462', 180);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (43, 'Geno Arnopp', 'Wilek Burde', '577-644-4057', 75);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (44, 'Laraine Bake', 'Brien Fullilove', '656-140-3386', 117);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (45, 'Dave Shatliff', 'Beret Prier', '167-223-9793', 39);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (46, 'Stepha Tuffs', 'Hershel Khomin', '629-978-9480', 72);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (47, 'Patti MacConnel', 'Xymenes Cornely', '772-341-7065', 101);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (48, 'Jo ann Storre', 'Cristi Woffinden', '648-291-3235', 183);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (49, 'Dinnie Shilburne', 'Marlyn Dewhurst', '649-494-0656', 16);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (50, 'Mechelle Idell', 'Raddie Gilby', '339-437-7425', 134);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (51, 'Hester Bayman', 'Randall Shoebridge', '988-783-2505', 2);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (52, 'Palmer Matias', 'Caro Lawty', '825-756-7486', 97);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (53, 'Susann Hursthouse', 'Giles Colthurst', '827-958-4895', 73);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (54, 'Mendel Anand', 'Clarine Hincks', '952-230-9241', 154);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (55, 'Cherey Duny', 'Egor Dorton', '724-952-7380', 88);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (56, 'Kelcy Babcock', 'Theodoric Duffy', '839-842-3536', 66);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (57, 'Chanda Cuttell', 'Stu MacElane', '943-765-0153', 97);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (58, 'Allsun Curnow', 'Vick Claque', '895-723-4324', 28);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (59, 'Xerxes McTrustam', 'Curran Lawless', '461-722-6792', 195);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (60, 'Saxe Hatfull', 'Stormie Yantsurev', '820-706-1604', 72);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (61, 'Joyann Yeates', 'Darrell Copner', '247-726-3435', 11);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (62, 'Inna Baker', 'Maurene Cadore', '512-201-2790', 59);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (63, 'Elana Ablett', 'Demetra Scales', '292-362-1782', 186);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (64, 'Latisha Spain', 'Muriel Ajsik', '574-991-5968', 99);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (65, 'Boycie Kindle', 'Florrie Penson', '495-165-8817', 136);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (66, 'Linette Bramstom', 'Angelique O''Nion', '254-943-8715', 128);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (67, 'Grady Slator', 'Syd Piotrowski', '139-481-8512', 3);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (68, 'Sapphire Nanninini', 'Dougy Studeart', '474-556-7858', 123);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (69, 'Nicholas Zanneli', 'Shirlee Cavozzi', '912-896-2335', 118);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (70, 'Ignazio Glede', 'Arte Souch', '597-162-5073', 79);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (71, 'Maurizia Belbin', 'Janey Birdsall', '299-850-2805', 115);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (72, 'Eddie Aujouanet', 'Jaclyn Charity', '225-118-1441', 57);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (73, 'Annadiane Infantino', 'Christean Aldcorn', '927-938-5905', 129);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (74, 'Sharon Suston', 'Clerissa Trembey', '727-247-3705', 140);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (75, 'Jarrod Bleackly', 'Klara Humby', '228-147-4164', 88);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (76, 'Corey Leathes', 'Alwyn Bamling', '153-355-4175', 191);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (77, 'Eugenius Giral', 'Danny Pollen', '450-545-4986', 57);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (78, 'Papageno Frisel', 'Kelila Helmke', '795-886-4790', 72);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (79, 'Marya Wingeat', 'Sherwin Karpets', '553-711-2069', 170);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (80, 'Pamella Schimek', 'Nancy Physick', '604-476-8035', 106);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (81, 'Walsh Chimienti', 'Lynde Brisbane', '659-226-4227', 15);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (82, 'Karla Tremontana', 'Faustina Scammell', '329-764-1639', 36);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (83, 'Anjanette Hierro', 'Zorina Rashleigh', '502-917-5333', 12);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (84, 'Milo Sizey', 'Cass Brimfield', '323-482-7260', 20);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (85, 'Jerrine Leek', 'Nadya Laurentin', '847-117-6195', 9);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (86, 'Friedrich Livings', 'Hadley Rosberg', '991-430-3874', 18);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (87, 'Barclay Isaacs', 'Daphene Hudspeth', '101-909-6499', 68);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (88, 'Jecho Klimshuk', 'Imogene McRae', '483-590-5180', 74);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (89, 'Tadeo Goggan', 'Kinny Gurry', '592-301-4202', 143);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (90, 'Farlie Fishwick', 'Shanta Pittway', '971-198-6079', 121);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (91, 'Cordelie Halcro', 'Kimball Couchman', '446-875-6578', 145);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (92, 'Wyatan Jirik', 'Sargent Hawlgarth', '247-834-5711', 30);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (93, 'Mord Downton', 'Wang Broadbridge', '512-547-5135', 80);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (94, 'Ilyse Crosscombe', 'Kaye Tompkiss', '605-333-7354', 43);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (95, 'Rosella Woolway', 'Vonny Burgot', '149-244-0238', 173);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (96, 'Elliot Faherty', 'Nessi Husk', '472-804-8578', 119);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (97, 'Barry Bartolozzi', 'Ayn Beckhurst', '488-205-8983', 27);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (98, 'Jackie Petit', 'Filippo Stockell', '912-344-5859', 67);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (99, 'Art Ramstead', 'Marc Gimson', '473-578-9985', 52);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (100, 'Quintana Dron', 'Ailis Ovize', '165-170-8024', 101);


-- Insert table NHANVIEN
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (1, 'Gwyneth Le Sarr', 'Ricky De Mitris', '380-161-6618', 46, 183);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (2, 'Perry Fox', 'Flossie Kirkby', '135-978-2730', 126, 106);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (3, 'Tanya Bocke', 'Anne-marie McLleese', '775-683-1544', 141, 195);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (4, 'Jean Dahmke', 'Benjy Lawrenson', '451-925-4222', 16, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (5, 'Silvano Undrill', 'Ulrika Ferrulli', '372-530-5507', 8, 119);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (6, 'Clara Lidgey', 'Cherey Depper', '333-513-1098', 42, 39);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (7, 'Evvy Abbott', 'Alister Styan', '657-612-9294', 42, 98);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (8, 'Barbi Padly', 'Vail MacMeekan', '968-374-0989', 36, 20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (9, 'Kearney Druce', 'Richard Jonczyk', '646-132-3718', 51, 96);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (10, 'Karil Andrichak', 'Amble Sandom', '740-979-6594', 125, 61);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (11, 'Teddy Leathe', 'Darill Pimer', '673-376-9169', 149, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (12, 'Eda Slides', 'Kimmie Hullin', '940-673-9411', 64, 180);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (13, 'Rafa McGibbon', 'Sibyl Graver', '811-109-5332', 167, 173);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (14, 'Noland Faragan', 'Doris Giacobilio', '620-883-2809', 109, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (15, 'Colman Sepey', 'Mike Vinall', '122-778-8631', 46, 190);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (16, 'Othilie MacFarlan', 'Reid Pixton', '251-206-1358', 95, 122);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (17, 'Monique Probbin', 'Jodie Dahlgren', '917-711-5358', 27, 35);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (18, 'Shermy Booeln', 'Tarrance Christiensen', '582-671-8255', 152, 192);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (19, 'Caprice Ivanyushkin', 'Grete Bramont', '996-664-1447', 184, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (20, 'Gareth Gravenor', 'Anatol Utton', '529-770-8965', 179, 146);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (21, 'Lanae Raffin', 'Aurthur MacKaig', '544-318-7772', 112, 34);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (22, 'Nataline Lenney', 'Enrichetta Keelinge', '196-927-1815', 68, 113);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (23, 'Isidor Hartropp', 'Windy Whitty', '612-238-8020', 175, 96);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (24, 'Rock Haughey', 'Shay Crinkley', '297-528-0247', 173, 184);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (25, 'Dory Eastlake', 'Clarinda Eliet', '515-896-5955', 124, 110);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (26, 'Kaja Fardon', 'Maurine Goodding', '995-646-5782', 77, 145);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (27, 'Porter Stebles', 'Mikol Piller', '699-201-6611', 146, 102);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (28, 'Phillipe BURWIN', 'Spense Churchman', '641-383-3327', 92, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (29, 'Millie Grouvel', 'Robina Atcock', '284-530-5327', 127, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (30, 'Alleyn Chomley', 'Christophorus Bester', '104-496-2834', 12, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (31, 'Leonora Pearn', 'Stephanie Halbeard', '275-498-9156', 96, 179);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (32, 'Saloma Brislane', 'Meg Lynock', '929-746-6806', 12, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (33, 'Susana Halfacre', 'Michele Clague', '939-299-0149', 87, 156);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (34, 'Bertina Pettendrich', 'Anson Bly', '379-297-0709', 27, 119);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (35, 'Karita Klimschak', 'Blakeley Meneo', '999-356-8212', 77, 124);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (36, 'Darius Haythorn', 'Winslow Worledge', '254-653-5205', 159, 143);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (37, 'Bronson Mallalieu', 'Marwin Pickersail', '285-426-5132', 90, 178);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (38, 'Hart Clewlow', 'Orion Abramowitz', '659-596-1076', 113, 80);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (39, 'Glen Fahrenbacher', 'Marie-jeanne Abramowsky', '955-494-6148', 6, 79);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (40, 'Katinka Maylam', 'Allyce Butner', '137-153-6490', 73, 101);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (41, 'Clemmy Penticost', 'Archaimbaud Hurche', '746-940-0133', 183, 33);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (42, 'Gill Hattiff', 'Vanda Stood', '260-312-2586', 111, 101);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (43, 'Cristie Iston', 'Hewie Gilhool', '988-469-9106', 173, 49);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (44, 'Asher Adderley', 'Lucia Gouge', '869-262-6921', 170, 119);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (45, 'Mufi Dix', 'Padgett Shutte', '874-829-0195', 56, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (46, 'Selina Shewery', 'Robin Northcott', '384-275-6763', 179, 161);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (47, 'Markos Camlin', 'Gabe Starkey', '258-341-8619', 127, 181);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (48, 'Kendall Ryal', 'Caleb Zellner', '290-642-2575', 69, 49);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (49, 'Jerrine Neads', 'Hatty Throughton', '886-259-4419', 4, 137);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (50, 'Lev Coskerry', 'Percival Allix', '514-427-6652', 173, 159);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (51, 'Fidelio Toombs', 'Cassondra Kinvig', '574-216-2862', 171, 100);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (52, 'Gunther Dougher', 'Kleon Yaakov', '895-439-1258', 32, 22);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (53, 'Felipe Slowly', 'Jeanelle Weedenburg', '346-103-0956', 14, 124);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (54, 'Manuel Rain', 'Bronny Sulland', '392-323-4914', 75, 33);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (55, 'Min Morris', 'Gabrila Tidmarsh', '666-345-8054', 119, 36);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (56, 'Kristo Poupard', 'Ly Seide', '878-622-4044', 11, 25);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (57, 'Damian Banner', 'Honey Gownge', '983-688-1773', 67, 130);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (58, 'Prudence Hardstaff', 'Clemmie Payn', '459-440-9500', 133, 199);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (59, 'Otis Brumhead', 'Chaunce Bannell', '423-161-4664', 43, 132);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (60, 'Dusty Wind', 'Lani Woodger', '428-302-0980', 165, 75);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (61, 'Izaak Matushevich', 'Ashlee Berntsson', '794-880-7658', 153, 25);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (62, 'Amalea Shayler', 'Bryna Murra', '949-321-6835', 18, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (63, 'Kalindi Jenney', 'Mehetabel Bulger', '633-326-3317', 57, 67);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (64, 'Ashia Wesker', 'Leonore McCorrie', '388-540-0238', 26, 193);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (65, 'Raoul Bearns', 'Mignon Pawlik', '676-320-5049', 60, 75);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (66, 'Gardener Webburn', 'Ede Vanyatin', '779-847-3969', 195, 171);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (67, 'Lee Rama', 'Harrie Lapish', '417-800-7810', 186, 104);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (68, 'Nonnah Lytlle', 'Abigael Etuck', '995-774-7955', 137, 57);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (69, 'Aylmar Stinchcombe', 'Clarisse Ghioni', '104-399-0211', 138, 57);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (70, 'Hilda Patman', 'Virginia Milmore', '216-580-2992', 146, 2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (71, 'Corinna Henstone', 'Pennie Dockwray', '276-144-9579', 96, 140);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (72, 'Turner Orans', 'Sigfried Slee', '375-992-2294', 152, 3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (73, 'Ansell Nesey', 'Rosemonde Pervoe', '736-591-7664', 95, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (74, 'Mahalia Bricket', 'Eb Junkison', '576-712-1985', 11, 142);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (75, 'Meade Leyden', 'Dedra Krzyzowski', '839-155-7687', 118, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (76, 'Walther Mathet', 'Elia Seville', '724-113-8263', 157, 131);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (77, 'Murray Oakman', 'Jori Deinhardt', '929-724-1175', 33, 113);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (78, 'Callean Renwick', 'Codi McKeating', '707-621-2485', 134, 141);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (79, 'Tracee Ormes', 'Danny Edghinn', '578-668-4033', 45, 141);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (80, 'Murdoch Panniers', 'Hashim Bogges', '446-873-5450', 19, 151);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (81, 'Laurianne Sammut', 'Alena Valenti', '672-205-1944', 5, 99);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (82, 'Malchy Clancy', 'Elmo Jeste', '695-569-7353', 4, 183);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (83, 'Abbey Karpol', 'Suzanne Gorges', '587-408-8734', 103, 180);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (84, 'Frasier Brickett', 'Dewie Zeal', '324-557-6596', 193, 144);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (85, 'Al Angeli', 'Bevvy Fluck', '562-622-3247', 31, 76);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (86, 'Mickie Mushawe', 'Joyous Fuzzens', '795-744-3142', 134, 161);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (87, 'Yalonda Lewer', 'Lamont Cromett', '925-819-8892', 88, 46);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (88, 'Yovonnda Durram', 'Brent Aitken', '486-486-5641', 93, 89);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (89, 'Zahara Gindghill', 'Adriane Aimson', '377-243-8645', 109, 129);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (90, 'Harmonie Rivett', 'Burtie Beurich', '149-606-8978', 24, 154);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (91, 'Hinze Moughtin', 'Myca Bockin', '702-884-9941', 95, 97);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (92, 'Liuka Savatier', 'Rorke McClory', '412-708-0254', 155, 54);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (93, 'Rossy Ossipenko', 'Stephie Gueste', '492-176-1063', 149, 197);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (94, 'Rois Shemmans', 'Florella Abramovicz', '914-840-7733', 22, 178);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (95, 'Pace Boost', 'Pepillo Cantillon', '712-409-4192', 2, 151);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (96, 'Myrle Dresche', 'Nadeen Newarte', '304-528-1576', 46, 87);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (97, 'Luciano Westhoff', 'Dulciana Hess', '792-970-9766', 194, 52);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (98, 'Cherey Alten', 'Jaime Reynold', '889-762-8995', 62, 193);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (99, 'Philippine Winterbotham', 'Myrtle Wilson', '566-895-8845', 176, 88);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (100, 'Farris Vasiltsov', 'Rivkah Brailsford', '169-833-2070', 24, 182);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (101, 'Morgana Ornils', 'Trumann Tinker', '333-685-4764', 102, 93);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (102, 'Iseabal Qualtro', 'Emerson Shanks', '272-195-3820', 8, 19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (103, 'Charisse Everson', 'Rosalinde Strettell', '544-254-4138', 30, 119);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (104, 'Elladine Geke', 'Leela Glowacha', '773-488-7347', 22, 134);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (105, 'Erna Godley', 'Sidoney Skirvin', '136-691-4910', 192, 102);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (106, 'Althea Havoc', 'Gabriele Winger', '255-145-2476', 37, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (107, 'Victoria Avrahamof', 'Quincy Royste', '115-554-5405', 63, 160);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (108, 'Ali Dockrill', 'Hailee Quilligan', '220-246-0352', 43, 48);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (109, 'Karrah Craigmile', 'Luther Ilett', '280-307-5083', 130, 67);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (110, 'Elroy Cabena', 'Lizabeth Dannett', '381-914-2466', 31, 170);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (111, 'Jameson Chudleigh', 'Con Riditch', '824-870-3344', 185, 175);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (112, 'Datha Barbara', 'Izak Areles', '689-834-1848', 115, 50);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (113, 'Kinnie Kruszelnicki', 'Arlan Sutherns', '785-632-2852', 124, 123);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (114, 'Mathe Ivel', 'Edithe Sallowaye', '194-402-6400', 100, 76);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (115, 'Sullivan Beining', 'Tynan Girhard', '182-298-7621', 176, 164);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (116, 'Elita Muffin', 'Rob Mott', '130-688-0849', 27, 36);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (117, 'Keary Castro', 'Zonnya Leindecker', '185-294-1088', 125, 68);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (118, 'Emmott Aldcorn', 'Bobbe Guitt', '466-403-2599', 120, 50);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (119, 'Concordia Lamborn', 'Consuelo Littleover', '181-605-8048', 200, 137);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (120, 'Joshuah Doige', 'Philly Sreenan', '879-975-1813', 37, 49);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (121, 'Bret Lorek', 'Matti Cass', '489-853-3108', 199, 132);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (122, 'Pascal Haukey', 'Leena Stainson', '955-354-5745', 155, 26);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (123, 'Peadar Jonas', 'Dale Dacke', '562-407-2819', 139, 158);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (124, 'Mark Glawsop', 'Homere Austing', '297-219-2271', 134, 119);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (125, 'Tommy Testo', 'Shannen Cryer', '476-263-6044', 181, 66);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (126, 'Mari Hacking', 'Phillie Portman', '530-804-6557', 191, 171);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (127, 'Myca Kemetz', 'Jana Kenion', '742-488-4202', 191, 48);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (128, 'Claudius Colam', 'Lazar Dash', '333-877-6219', 139, 55);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (129, 'Nicolais Twidle', 'Maddie Cowpland', '623-322-5899', 18, 126);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (130, 'Ferdinand Glynne', 'Gabbi Nicholson', '700-233-9491', 198, 183);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (131, 'Angela Pascoe', 'Jeremiah Tabbernor', '208-210-1671', 83, 75);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (132, 'Oberon Thowes', 'Dacey Glazzard', '338-799-0890', 192, 133);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (133, 'Tucker Preto', 'Marta Siddeley', '952-990-1836', 45, 60);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (134, 'Lauri Castanos', 'Marilin Silcock', '220-814-6640', 96, 133);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (135, 'Opalina Keeri', 'Shandeigh Seage', '468-638-4563', 102, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (136, 'Fionna Saltern', 'Orella Brosh', '219-113-5189', 94, 76);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (137, 'Ronnie Barthorpe', 'Jo ann Egdal', '470-381-6584', 193, 168);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (138, 'Ewen Goodsell', 'Shandee Gilburt', '569-670-5896', 101, 11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (139, 'Heidie Confait', 'Rouvin Peachman', '877-777-9262', 61, 56);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (140, 'Erma Feldfisher', 'Yoko Sahnow', '798-398-1980', 186, 169);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (141, 'Yoshi Trodler', 'Roman Bewly', '393-954-8524', 93, 161);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (142, 'Alix Gulvin', 'Vanda Gostage', '321-323-7552', 168, 90);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (143, 'Biron Mulkerrins', 'Murvyn Andrioni', '515-898-7881', 69, 174);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (144, 'Selia Huckle', 'Shanda Cownden', '616-369-6577', 170, 151);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (145, 'Buck Burkill', 'Zelda Edards', '121-121-0858', 21, 42);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (146, 'Skippy Radclyffe', 'Alejoa Kitchiner', '529-257-4069', 59, 184);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (147, 'Elsie Briers', 'Chantalle Merrigans', '910-648-7891', 68, 178);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (148, 'Ernesto Buntin', 'Alvin Pinniger', '366-936-1848', 56, 71);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (149, 'Krispin Dunning', 'Torry Sickamore', '560-601-2689', 163, 168);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (150, 'Kynthia Loveridge', 'Ennis MacBey', '518-455-5520', 168, 81);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (151, 'Caddric Sandells', 'Tarrance Danielot', '351-179-2341', 154, 46);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (152, 'Jelene Fennelow', 'Julita Drysdall', '649-354-4363', 4, 77);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (153, 'Delphine Kinnear', 'Leroi Toward', '338-856-3418', 139, 115);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (154, 'Boris Beelby', 'Germaine Paslow', '273-132-9613', 21, 73);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (155, 'Abdel Stanlock', 'Lion Rauprich', '485-591-7836', 156, 101);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (156, 'Fianna Tomaselli', 'Art Hazelton', '222-361-4542', 191, 106);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (157, 'Tisha Lowle', 'Paquito Izhaky', '661-540-1362', 42, 181);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (158, 'Luke Norvill', 'Darcy Aldwich', '763-593-1061', 184, 186);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (159, 'Ora Pattinson', 'Connie Brimble', '595-533-4716', 88, 132);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (160, 'Enoch Reedshaw', 'Gregory Salaman', '973-687-4397', 111, 42);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (161, 'Read Strutz', 'Brander MacColgan', '391-795-0073', 180, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (162, 'Anna-diana Ricart', 'Riley Wigfield', '546-719-3569', 135, 183);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (163, 'Gretta Ralph', 'Norry Caulliere', '644-337-0626', 72, 118);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (164, 'Colly Braams', 'Matt Frounks', '770-590-7696', 57, 105);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (165, 'Albina Cholmondeley', 'Rozelle Tucsell', '124-242-0922', 97, 66);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (166, 'Iona Barge', 'Minda Nairns', '800-626-0821', 73, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (167, 'Joshua Feavers', 'Doria Dodshun', '373-755-7027', 195, 165);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (168, 'Joyce Kenwin', 'Alix Gaisford', '596-562-5498', 23, 155);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (169, 'Dasie Dinwoodie', 'Emile Sposito', '135-248-0208', 106, 149);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (170, 'Mercy Nilges', 'Patton Petracchi', '445-519-9501', 92, 170);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (171, 'Domini Avrasin', 'Ardith Rushmer', '701-943-3452', 193, 99);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (172, 'Ingaborg Biasotti', 'La verne Hannigane', '532-932-7497', 189, 194);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (173, 'Annalise Townsend', 'Hanna McQuarrie', '707-250-5255', 91, 97);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (174, 'Roscoe Frier', 'Gabriele Donativo', '107-598-7003', 17, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (175, 'Staford Scotson', 'Lavinie Brenard', '275-175-4312', 91, 62);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (176, 'Josie Neising', 'Merill Tatham', '795-371-7604', 133, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (177, 'Joanne Chidwick', 'Bartlet Brennand', '311-150-6913', 63, 19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (178, 'Madonna Annwyl', 'Mable Dainty', '157-929-1149', 141, 107);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (179, 'Val A''Barrow', 'Gilli de Clerk', '491-857-1354', 171, 184);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (180, 'Valina Tomsa', 'Marianne Demangeon', '907-565-0430', 69, 27);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (181, 'Rockie Dewes', 'Margery MacGraith', '850-272-9232', 24, 122);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (182, 'Stephana Effemy', 'Kent Plaunch', '949-413-1669', 159, 83);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (183, 'Al Sperwell', 'Bianca Leaton', '642-458-2216', 61, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (184, 'Armstrong Wagenen', 'Lissa Exley', '106-868-0744', 89, 193);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (185, 'Hussein Florio', 'Ilse Burleigh', '103-540-9129', 44, 159);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (186, 'Iormina Huyge', 'Pavel Langrick', '975-968-2325', 90, 63);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (187, 'Guido Martignon', 'Almire Dudderidge', '714-530-9880', 45, 106);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (188, 'Melany Pettett', 'Saul Steffan', '941-828-1550', 192, 195);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (189, 'Stoddard Avrashin', 'Brandea Umbert', '609-267-8814', 191, 190);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (190, 'Seumas Danick', 'Sunny Sacaze', '203-494-5770', 10, 58);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (191, 'Carmon Cartmael', 'Jerri Withams', '192-404-1222', 125, 59);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (192, 'Tabby Infante', 'Harlene Boyford', '215-594-6155', 60, 9);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (193, 'Ravid Rapin', 'Jethro Massie', '884-564-5846', 16, 142);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (194, 'Latrina Powys', 'Bertrand Birks', '291-775-4598', 185, 60);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (195, 'Adi Kinghorn', 'Merill Gallanders', '122-738-9084', 34, 182);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (196, 'Raynell Pitt', 'Kiley Ordidge', '120-656-0271', 8, 51);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (197, 'Anjela Morrissey', 'Gun Jebb', '688-528-6188', 131, 101);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (198, 'Priscilla Hollyer', 'Neall Dowears', '776-714-9925', 109, 72);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (199, 'Jamill Hanfrey', 'Reade Quinsee', '328-300-6746', 17, 171);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (200, 'Francisca Bamell', 'Buddy Betser', '768-108-8884', 72, 185);


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



