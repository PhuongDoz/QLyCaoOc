


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
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (101, '3/16/2018', '5661759');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (102, '11/14/2017', '8445977');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (103, '4/9/2018', '8512247');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (104, '9/13/2017', '7074460');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (105, '9/2/2017', '7412963');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (106, '2/21/2018', '5222056');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (107, '1/16/2018', '6897027');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (108, '4/4/2018', '7671298');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (109, '3/19/2018', '7155302');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (110, '7/14/2017', '7354722');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (111, '4/19/2018', '8403917');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (112, '1/29/2018', '8611541');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (113, '11/3/2017', '6313528');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (114, '6/30/2017', '9823968');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (115, '9/9/2017', '5762092');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (116, '4/13/2018', '8535765');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (117, '3/26/2018', '7823568');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (118, '3/9/2018', '8600954');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (119, '5/18/2017', '9473159');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (120, '11/25/2017', '5699791');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (121, '3/24/2018', '5636896');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (122, '12/23/2017', '9372144');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (123, '7/18/2017', '9964564');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (124, '8/28/2017', '6126784');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (125, '1/22/2018', '7934876');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (126, '8/15/2017', '6238864');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (127, '1/3/2018', '8579048');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (128, '10/23/2017', '9015489');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (129, '8/6/2017', '6768194');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (130, '2/4/2018', '5015152');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (131, '4/5/2018', '7018607');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (132, '10/13/2017', '9755833');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (133, '10/2/2017', '6358954');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (134, '2/4/2018', '5938303');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (135, '8/6/2017', '7803266');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (136, '11/19/2017', '5593088');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (137, '8/15/2017', '7491612');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (138, '1/21/2018', '9106650');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (139, '11/4/2017', '8319192');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (140, '8/31/2017', '9526929');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (141, '1/24/2018', '7275319');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (142, '5/24/2017', '5786675');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (143, '3/27/2018', '8685586');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (144, '10/6/2017', '9224446');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (145, '9/26/2017', '7908051');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (146, '9/13/2017', '5610969');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (147, '5/13/2017', '6730748');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (148, '7/29/2017', '5796388');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (149, '5/12/2017', '7066139');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (150, '7/14/2017', '6803412');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (151, '3/28/2018', '6139174');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (152, '7/18/2017', '8762353');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (153, '8/18/2017', '5273684');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (154, '6/17/2017', '9786732');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (155, '4/19/2018', '9993048');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (156, '9/27/2017', '7581227');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (157, '5/14/2017', '5242706');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (158, '12/7/2017', '7532719');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (159, '6/28/2017', '5944836');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (160, '12/3/2017', '7894110');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (161, '7/30/2017', '9624069');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (162, '6/17/2017', '7279855');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (163, '10/26/2017', '5187188');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (164, '5/13/2017', '8407371');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (165, '12/13/2017', '6787472');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (166, '1/29/2018', '8143220');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (167, '11/18/2017', '9698267');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (168, '7/28/2017', '7189550');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (169, '5/3/2017', '8440249');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (170, '1/14/2018', '8266666');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (171, '4/4/2018', '7088200');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (172, '8/5/2017', '7351713');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (173, '6/14/2017', '5210037');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (174, '12/8/2017', '9529445');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (175, '11/22/2017', '5924964');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (176, '8/17/2017', '9364826');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (177, '8/5/2017', '5395099');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (178, '10/20/2017', '9022134');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (179, '8/16/2017', '8082532');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (180, '8/4/2017', '7200510');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (181, '7/11/2017', '8302134');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (182, '2/5/2018', '5898475');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (183, '1/14/2018', '6484028');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (184, '9/11/2017', '8504448');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (185, '8/11/2017', '7354343');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (186, '5/17/2017', '8704855');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (187, '12/10/2017', '6553349');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (188, '8/28/2017', '8715455');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (189, '11/20/2017', '8567379');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (190, '6/25/2017', '6033662');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (191, '2/19/2018', '7712856');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (192, '5/6/2017', '7658364');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (193, '8/18/2017', '5640044');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (194, '10/27/2017', '5458878');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (195, '9/2/2017', '8460370');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (196, '1/8/2018', '7883426');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (197, '11/4/2017', '9357432');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (198, '4/29/2017', '9183065');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (199, '5/11/2017', '7370646');
insert into HOPDONG (MaHD, NgayLap, TienCoc) values (200, '9/6/2017', '8627216');

--Insert table TANG
insert into TANG (Tang, DienTich, Gia) values (1, 113, '18287597');
insert into TANG (Tang, DienTich, Gia) values (2, 168, '15889041');
insert into TANG (Tang, DienTich, Gia) values (3, 105, '11126262');
insert into TANG (Tang, DienTich, Gia) values (4, 113, '10334383');
insert into TANG (Tang, DienTich, Gia) values (5, 122, '19483507');
insert into TANG (Tang, DienTich, Gia) values (6, 126, '13463476');
insert into TANG (Tang, DienTich, Gia) values (7, 148, '12299875');
insert into TANG (Tang, DienTich, Gia) values (8, 154, '19020699');
insert into TANG (Tang, DienTich, Gia) values (9, 181, '16080426');
insert into TANG (Tang, DienTich, Gia) values (10, 154, '16852778');
insert into TANG (Tang, DienTich, Gia) values (11, 134, '10348930');
insert into TANG (Tang, DienTich, Gia) values (12, 134, '16244305');
insert into TANG (Tang, DienTich, Gia) values (13, 151, '15939715');
insert into TANG (Tang, DienTich, Gia) values (14, 200, '13135254');
insert into TANG (Tang, DienTich, Gia) values (15, 150, '12341184');
insert into TANG (Tang, DienTich, Gia) values (16, 181, '15286795');
insert into TANG (Tang, DienTich, Gia) values (17, 119, '13653576');
insert into TANG (Tang, DienTich, Gia) values (18, 160, '11296808');
insert into TANG (Tang, DienTich, Gia) values (19, 122, '11136010');
insert into TANG (Tang, DienTich, Gia) values (20, 141, '15276245');
insert into TANG (Tang, DienTich, Gia) values (21, 170, '11317252');
insert into TANG (Tang, DienTich, Gia) values (22, 184, '12723526');
insert into TANG (Tang, DienTich, Gia) values (23, 199, '18744314');
insert into TANG (Tang, DienTich, Gia) values (24, 181, '10381174');
insert into TANG (Tang, DienTich, Gia) values (25, 200, '12074810');
insert into TANG (Tang, DienTich, Gia) values (26, 107, '12402300');
insert into TANG (Tang, DienTich, Gia) values (27, 107, '12334437');
insert into TANG (Tang, DienTich, Gia) values (28, 126, '15522918');
insert into TANG (Tang, DienTich, Gia) values (29, 133, '14979523');
insert into TANG (Tang, DienTich, Gia) values (30, 178, '14281085');
insert into TANG (Tang, DienTich, Gia) values (31, 182, '13508064');
insert into TANG (Tang, DienTich, Gia) values (32, 193, '14840252');
insert into TANG (Tang, DienTich, Gia) values (33, 177, '14288734');
insert into TANG (Tang, DienTich, Gia) values (34, 117, '18272361');
insert into TANG (Tang, DienTich, Gia) values (35, 151, '11849390');
insert into TANG (Tang, DienTich, Gia) values (36, 127, '17831874');
insert into TANG (Tang, DienTich, Gia) values (37, 193, '13367470');
insert into TANG (Tang, DienTich, Gia) values (38, 183, '12349284');
insert into TANG (Tang, DienTich, Gia) values (39, 149, '14598230');
insert into TANG (Tang, DienTich, Gia) values (40, 168, '16962577');
insert into TANG (Tang, DienTich, Gia) values (41, 143, '11870578');
insert into TANG (Tang, DienTich, Gia) values (42, 197, '15435843');
insert into TANG (Tang, DienTich, Gia) values (43, 191, '18192603');
insert into TANG (Tang, DienTich, Gia) values (44, 146, '10499416');
insert into TANG (Tang, DienTich, Gia) values (45, 170, '10651760');
insert into TANG (Tang, DienTich, Gia) values (46, 122, '11491804');
insert into TANG (Tang, DienTich, Gia) values (47, 196, '11468260');
insert into TANG (Tang, DienTich, Gia) values (48, 119, '12423988');
insert into TANG (Tang, DienTich, Gia) values (49, 134, '11186847');
insert into TANG (Tang, DienTich, Gia) values (50, 180, '18497325');

-- Insert table PHONG
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (1, 'Gar Cullerne', 35, 124);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (2, 'Sharon Duplan', 22, 167);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (3, 'Rona Aitkenhead', 49, 185);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (4, 'Opaline Scudders', 47, 122);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (5, 'Zaccaria Ledgley', 37, 174);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (6, 'Basilius Mussalli', 44, 126);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (7, 'Ibrahim Defraine', 29, 174);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (8, 'Allis Geeve', 13, 137);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (9, 'Casandra Gobourn', 23, 108);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (10, 'Mathilda Chomicz', 8, 192);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (11, 'Mari Domesday', 26, 197);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (12, 'Adan Clorley', 2, 138);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (13, 'Ileane Piesing', 4, 158);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (14, 'Dulsea Jirousek', 1, 152);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (15, 'Wolfie Plaid', 29, 188);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (16, 'Upton Skinley', 15, 170);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (17, 'Sacha Schettini', 33, 131);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (18, 'Rennie Hewlings', 30, 147);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (19, 'Roselin Twycross', 42, 178);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (20, 'Gawen Cunnane', 13, 152);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (21, 'Janella Haliburton', 28, 149);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (22, 'Kimbell Camois', 48, 129);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (23, 'Linell Lince', 44, 193);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (24, 'Louie Bibey', 6, 121);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (25, 'Angelia Byforth', 44, 181);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (26, 'Deeyn O''Flynn', 49, 147);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (27, 'Bonnie Golds', 2, 140);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (28, 'Armin Petrasch', 31, 140);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (29, 'Ingrid Voules', 41, 129);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (30, 'Thatcher Wendover', 47, 120);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (31, 'Erminia Bracknell', 9, 159);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (32, 'Sarene Allworthy', 19, 157);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (33, 'Reyna Gill', 7, 160);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (34, 'Frederique O''Regan', 25, 169);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (35, 'Abagail Ramberg', 36, 145);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (36, 'Emmet Botting', 8, 198);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (37, 'Anastasia Fairnie', 11, 132);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (38, 'Papageno Tresise', 25, 160);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (39, 'Aarika Axup', 40, 164);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (40, 'Honey Ledingham', 36, 159);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (41, 'Luigi Duckett', 16, 184);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (42, 'Helen-elizabeth Aughton', 49, 183);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (43, 'Corliss Malzard', 17, 110);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (44, 'Davis Maitland', 23, 145);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (45, 'Rozanna Sange', 10, 150);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (46, 'Ibby Alden', 20, 148);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (47, 'Latashia Chattoe', 43, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (48, 'Orion Jerke', 50, 155);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (49, 'Murry Aspinal', 5, 122);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (50, 'Winifield Kendred', 3, 132);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (51, 'Wilhelmine Yorston', 22, 192);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (52, 'Jillayne Cossentine', 22, 145);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (53, 'Earvin Jakovijevic', 10, 145);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (54, 'Bernetta Erlam', 11, 175);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (55, 'Ingrim Gilder', 5, 179);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (56, 'Quintin Simnett', 12, 149);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (57, 'Sue Pigford', 8, 192);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (58, 'Goldie Boyce', 44, 144);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (59, 'Donny Reddin', 14, 194);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (60, 'Clareta Richten', 42, 119);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (61, 'Thornton Duffil', 10, 195);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (62, 'Melisa Symondson', 36, 171);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (63, 'Letti O''Carran', 37, 146);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (64, 'Jeniece Cunradi', 44, 128);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (65, 'Cully Jenckes', 7, 118);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (66, 'Almeda Clyburn', 20, 121);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (67, 'Humfrey Halmkin', 30, 131);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (68, 'Jen Bilbery', 1, 114);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (69, 'Giovanna Nijs', 22, 152);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (70, 'Sheridan Lyle', 14, 113);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (71, 'Tara Fenemore', 48, 109);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (72, 'Dar Borchardt', 49, 188);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (73, 'Kori Pringle', 35, 103);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (74, 'Riley Carsberg', 30, 103);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (75, 'Chaddy Gull', 25, 147);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (76, 'Tommie Kilalea', 25, 172);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (77, 'Joelly Baldree', 50, 166);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (78, 'Darcy Coopman', 16, 183);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (79, 'Emmey Bucklan', 11, 178);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (80, 'Ulick Supple', 15, 101);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (81, 'Jolene Childs', 40, 141);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (82, 'Edmon Cockhill', 27, 176);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (83, 'Mahalia Davey', 37, 130);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (84, 'Salomon Dobby', 25, 109);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (85, 'Clevie Hammill', 37, 115);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (86, 'Brien Greene', 6, 122);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (87, 'Domingo Bennison', 30, 175);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (88, 'Berk Skill', 28, 128);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (89, 'Donal Gruszczak', 32, 115);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (90, 'Miriam Lighterness', 8, 126);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (91, 'Pammi Helsby', 14, 169);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (92, 'Nicola McTrustey', 24, 125);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (93, 'Jo Hymers', 23, 106);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (94, 'Ancell Gauld', 41, 127);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (95, 'Danell Paynter', 3, 147);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (96, 'Valaria Stebbins', 37, 155);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (97, 'Sadie Bond', 46, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (98, 'Doro Janc', 31, 178);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (99, 'Stephannie Diamond', 46, 130);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (100, 'Dyana Taberer', 38, 162);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (101, 'Alisa Duval', 40, 106);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (102, 'Danie Suthren', 27, 152);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (103, 'Chadd De Filippis', 30, 174);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (104, 'Betsy Neumann', 44, 126);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (105, 'Vincents Cyples', 28, 109);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (106, 'Daile Taunton.', 14, 170);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (107, 'Fae Blum', 21, 134);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (108, 'Martica Ripley', 6, 194);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (109, 'Waylen Van Halen', 13, 125);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (110, 'Dilly Master', 2, 126);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (111, 'Molli Camplin', 40, 103);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (112, 'Jacintha Storey', 30, 141);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (113, 'Mara Tuffell', 46, 149);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (114, 'Eadmund Pally', 13, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (115, 'Kaitlin Rickards', 19, 112);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (116, 'Ann-marie Guidetti', 20, 179);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (117, 'Farah Matten', 42, 148);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (118, 'Mickie Van der Krui', 4, 153);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (119, 'Danna Lydster', 42, 195);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (120, 'Cecile Lohering', 49, 155);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (121, 'Sharia Boswell', 47, 174);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (122, 'Harri Gidney', 50, 130);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (123, 'Adena Aslin', 44, 196);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (124, 'William Fatharly', 20, 178);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (125, 'Doris Pagan', 2, 105);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (126, 'Hunter Branch', 18, 199);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (127, 'Gianni Lawful', 9, 126);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (128, 'Nicoli Olyunin', 47, 109);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (129, 'Ameline Keady', 7, 107);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (130, 'Carey Swinnard', 8, 107);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (131, 'Dianemarie Cayette', 40, 181);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (132, 'Vern Showalter', 21, 100);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (133, 'Dierdre Le Claire', 5, 113);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (134, 'Cora Freschi', 1, 124);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (135, 'Silvan Paike', 39, 129);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (136, 'Clea Raddish', 46, 171);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (137, 'Katrine Pinnock', 5, 171);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (138, 'Seumas Patrickson', 4, 124);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (139, 'Lamont Plimmer', 19, 189);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (140, 'Meggi Pollen', 47, 174);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (141, 'Findley Saunier', 25, 109);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (142, 'Kristo Bovingdon', 12, 185);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (143, 'Natalina Manson', 21, 168);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (144, 'Georgiana Turbat', 3, 158);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (145, 'Kristofor Kaye', 27, 162);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (146, 'Tobe Speares', 18, 170);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (147, 'Jemmy Marsham', 50, 137);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (148, 'Cristy Gudgen', 7, 181);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (149, 'Bernardine Hellwing', 37, 111);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (150, 'Gabriello Tupman', 38, 199);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (151, 'Allene Roadknight', 47, 157);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (152, 'Christen de Quesne', 31, 172);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (153, 'D''arcy Boles', 13, 170);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (154, 'Shayne Jurick', 14, 143);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (155, 'Ronni Inkle', 39, 145);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (156, 'Shela Spinella', 41, 162);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (157, 'Babbie Folbige', 21, 151);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (158, 'Henka Charity', 22, 116);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (159, 'Jonis Mennell', 27, 162);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (160, 'Paco Klimko', 48, 102);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (161, 'Alex Mackstead', 5, 111);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (162, 'Del Frazier', 50, 105);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (163, 'Seymour Towndrow', 23, 188);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (164, 'Riobard Egdale', 21, 194);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (165, 'Katuscha Duro', 37, 153);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (166, 'Armand Vannini', 19, 132);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (167, 'Kirby Cluderay', 9, 124);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (168, 'Andee Lovekin', 3, 114);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (169, 'Louella Kenafaque', 16, 157);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (170, 'Bellina Pinor', 25, 180);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (171, 'Corrie Avraham', 32, 139);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (172, 'Purcell Ponsford', 24, 170);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (173, 'Erie O''Loghlen', 7, 106);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (174, 'Avis Waller-Bridge', 2, 131);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (175, 'Angus Bricklebank', 7, 187);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (176, 'Kittie Jemison', 42, 194);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (177, 'Sabrina Kyne', 21, 108);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (178, 'Cedric Falla', 30, 135);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (179, 'Brig Gartside', 8, 158);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (180, 'Daisi Vinick', 40, 168);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (181, 'Jodie Wardhaw', 16, 149);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (182, 'Elie Bradlaugh', 11, 119);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (183, 'Matthus Madigan', 29, 193);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (184, 'Hatti Conahy', 5, 193);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (185, 'Gabriellia Kingsland', 7, 188);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (186, 'Barn Utteridge', 22, 200);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (187, 'Olav Kmietsch', 29, 163);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (188, 'Jermain Renard', 47, 166);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (189, 'Tobias M''cowis', 17, 133);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (190, 'Arlyne Polfer', 20, 148);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (191, 'Rebecka Cominello', 1, 108);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (192, 'Winnah Pettipher', 37, 142);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (193, 'Hildy Grayshan', 2, 144);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (194, 'Holmes Bisterfeld', 20, 145);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (195, 'Agata Littleover', 7, 181);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (196, 'Florry Degnen', 13, 165);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (197, 'Janos Serginson', 50, 189);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (198, 'Denny Simenel', 30, 119);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (199, 'Ezequiel McVey', 15, 135);
insert into PHONG (MaPHG, TenPHG, Tang, DienTich) values (200, 'Nikolai Vinson', 18, 116);

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
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (101, 'Malena Blew', 'Demetrius Don', '227-470-7498', 175);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (102, 'Niel Tours', 'Derward Dilks', '681-676-3025', 70);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (103, 'Pat Orvis', 'Osmund Dalligan', '787-240-7812', 29);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (104, 'Nataline Chatwin', 'Kahaleel Wix', '219-232-4156', 128);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (105, 'Ozzy Ashbee', 'Angus O''Ruane', '454-325-5715', 103);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (106, 'Simonette Kenton', 'Ketti Jepperson', '216-826-3601', 87);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (107, 'Ola Dow', 'Pippa Quinane', '934-821-5620', 24);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (108, 'Wandis Redgrove', 'Zorina Ivanenkov', '940-226-3025', 177);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (109, 'Tildi Bonick', 'Romona Grisley', '601-157-1212', 170);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (110, 'Bastien Klaffs', 'Jarrett Queste', '922-346-8296', 169);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (111, 'Rudiger Drake', 'Rog Capstick', '991-619-8158', 33);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (112, 'Tove Raittie', 'Cordy Loyley', '720-194-0412', 168);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (113, 'Lida Izatson', 'Freda Wilkisson', '638-675-6560', 97);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (114, 'Mychal Huson', 'Fay Dawney', '903-748-5334', 17);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (115, 'Lincoln Newiss', 'Nadya Sappson', '718-743-4285', 10);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (116, 'Dale Duffell', 'Fara Allflatt', '487-733-6527', 101);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (117, 'Marlow Epinay', 'Cassondra Littrick', '191-478-5920', 41);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (118, 'Townie Dyerson', 'Sigismundo Broadbere', '274-761-7243', 32);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (119, 'Anastassia Drury', 'Brittan Boath', '549-527-8146', 185);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (120, 'Gaynor Skakunas', 'Angelle Corriea', '153-800-3494', 113);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (121, 'Nicki Preuvost', 'Darrin Slaten', '715-177-3154', 15);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (122, 'Robert Dugald', 'Libbi Gorvin', '375-795-9084', 65);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (123, 'Bear Wysome', 'Dietrich Shiers', '316-905-6405', 187);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (124, 'Marget Dieton', 'Lorry Bleything', '869-693-7146', 39);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (125, 'Shanie Wescott', 'Juliann Boswood', '350-779-5792', 120);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (126, 'Andria Eddolls', 'Thornton Wisdish', '361-191-2626', 116);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (127, 'Brockie Birdwistle', 'Andie Paxman', '423-829-6298', 168);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (128, 'Bobina Adamczewski', 'Kyle Clash', '641-253-6059', 131);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (129, 'Sollie Codron', 'Britt Pavlenkov', '576-379-3776', 169);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (130, 'Farlee Neilus', 'Celestyna Outhwaite', '657-991-3121', 162);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (131, 'Anitra MacInerney', 'Danella Waliszewski', '566-951-6705', 53);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (132, 'Sari Tedman', 'Minna Cawdron', '294-660-5765', 193);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (133, 'Quint Suffe', 'Ursa Saunt', '283-787-4186', 124);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (134, 'Guillema Baine', 'Alfonso Kupec', '243-765-6709', 165);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (135, 'Bren Luparti', 'Catarina Swinford', '729-867-7085', 151);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (136, 'Sidoney Whittock', 'Brantley Jarvie', '123-795-2991', 149);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (137, 'Cherri Deluce', 'Friedrich Smither', '313-966-7306', 109);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (138, 'Zacharia Waind', 'Chet Woods', '897-807-4257', 61);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (139, 'Alfonse Curston', 'Matthus Hampshaw', '533-343-0568', 122);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (140, 'Tobiah Marquand', 'Martainn Gerhartz', '729-137-3229', 72);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (141, 'Alister Mahody', 'Aggy Dyers', '286-642-8177', 122);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (142, 'Barney Barkshire', 'Denver MacNeilage', '721-870-8508', 20);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (143, 'Claudie Ashard', 'Eric Budik', '385-260-2334', 102);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (144, 'Annamaria Aslie', 'Nat Hawney', '494-826-7818', 175);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (145, 'Burke Slora', 'Desiri Lindl', '926-534-8074', 98);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (146, 'Kristan Wiszniewski', 'Yard O''Glessane', '279-458-4468', 65);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (147, 'Gamaliel Lenden', 'Idette Gallegos', '976-845-4304', 59);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (148, 'Elke Girke', 'Cullen Messent', '711-766-3050', 144);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (149, 'Rowan Guyan', 'Tom Gallamore', '205-283-5884', 132);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (150, 'Giorgi Burghill', 'Floyd Sutcliffe', '834-669-1211', 15);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (151, 'Ricky Astie', 'Jerome Ilive', '532-840-3411', 168);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (152, 'Katharyn Pepineaux', 'Maryjo Meadway', '535-567-7673', 95);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (153, 'Gearard Ribchester', 'Hildy Arnason', '435-541-7852', 83);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (154, 'Krystal Adaway', 'Waldemar McAughtrie', '139-193-4423', 138);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (155, 'Mareah Manville', 'Livvy Skells', '294-539-3078', 107);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (156, 'Dorree Pawelek', 'Brinn Fearfull', '462-306-6462', 176);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (157, 'Lamond Dows', 'Chlo Bestman', '475-844-9265', 68);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (158, 'Munroe Pearch', 'Hobie Kingman', '364-869-1403', 130);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (159, 'Benita Norrey', 'Kerwinn Shears', '440-206-8667', 148);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (160, 'Lorelle Yitzovitz', 'Veriee Crean', '233-321-4369', 104);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (161, 'Nickolas Whiteland', 'Christie Iacopini', '678-185-8364', 94);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (162, 'Andros Gelderd', 'Jamey Nockalls', '218-437-3397', 104);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (163, 'Tobiah Logsdail', 'Viola McKinley', '125-883-2702', 107);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (164, 'Barr Sparsholt', 'Ame Cronkshaw', '837-396-1939', 22);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (165, 'Barbra Dallander', 'Gracia Borzoni', '650-743-0993', 125);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (166, 'Briney Slayton', 'Timmy Gofton', '701-717-4010', 167);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (167, 'Jeana Hamm', 'Andrea Dooher', '633-484-8998', 31);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (168, 'Koo Hearson', 'Cathrine Boughey', '237-752-6384', 96);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (169, 'Rosaline Stopforth', 'Karel Sievewright', '820-787-9411', 183);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (170, 'Astrid Hartmann', 'Elnar Lenihan', '348-183-3441', 99);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (171, 'Beryl Buncom', 'Batsheva Kausche', '421-229-6227', 26);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (172, 'Addie Jerzak', 'Mercedes Parkman', '907-164-2358', 181);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (173, 'Dermot Balazs', 'Corby Fairbrother', '111-145-2727', 21);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (174, 'Seamus Cartin', 'Hannis Ruecastle', '392-212-4428', 171);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (175, 'Ania Bollam', 'Daloris Gransden', '762-530-6157', 24);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (176, 'Lenci Sterre', 'Noach Penhallurick', '648-478-2356', 11);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (177, 'Kenny Faires', 'Beale Holyard', '910-360-1120', 67);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (178, 'Bendick Fawlks', 'Bernardina Peacey', '920-269-5008', 132);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (179, 'Chev Adamovitz', 'Darren Self', '956-473-5640', 48);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (180, 'Terrie Fibben', 'Rube Buckle', '808-737-3108', 57);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (181, 'Bertie Treswell', 'Stearne Duffield', '242-963-6940', 120);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (182, 'Lisha Nestle', 'Joanna Petheridge', '922-831-7527', 34);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (183, 'Daryl Lucock', 'Cullan Edler', '363-462-4781', 121);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (184, 'Aidan Demangeot', 'Deena Henzer', '997-797-6987', 136);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (185, 'Nissa McCurlye', 'Sabra Mordey', '127-218-6178', 5);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (186, 'Stefanie Tabor', 'Keene Wrankmore', '999-497-7139', 197);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (187, 'Madalyn Harvie', 'Hanson Jovic', '982-635-3520', 19);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (188, 'Zebedee Musgrave', 'Zea Meach', '217-697-0918', 122);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (189, 'Den Ethridge', 'George Fairy', '543-251-8430', 5);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (190, 'Reggie Aimson', 'Rosemarie Gadeaux', '547-784-1669', 117);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (191, 'Ralina Batte', 'Valina Turley', '930-327-9024', 3);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (192, 'Corey Wrightem', 'Dicky Oty', '883-127-4813', 48);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (193, 'Lancelot Shemilt', 'Kenn Berrane', '726-785-9351', 87);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (194, 'Vinny Klauer', 'Mirilla Reims', '672-142-9248', 33);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (195, 'Dudley Brion', 'Jobyna Gaspar', '467-224-7916', 97);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (196, 'Orlan Starzaker', 'Charlene Bollands', '982-631-9717', 61);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (197, 'Donavon Maultby', 'Whittaker Kyles', '122-501-9740', 180);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (198, 'Jeniffer Wallbrook', 'Corrie Stuchburie', '683-402-2480', 42);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (199, 'Janaye Levane', 'Sarita Breheny', '664-912-9931', 81);
insert into CONGTY (MaCongTy, TenCT, DiaChiCT, SDT, MaHD) values (200, 'Gerik Mc Gee', 'Drucill Backshill', '484-354-0441', 16);

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
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (201, 'Sauveur Rands', 'Clari Narey', '719-165-5866', 182, 182);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (202, 'Wenonah Pantin', 'Haywood Mulrean', '469-714-8526', 131, 125);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (203, 'Baily Rajchert', 'Lotti Swanne', '557-151-1306', 116, 89);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (204, 'Lenna Kegg', 'Aggi Bleasby', '627-788-9154', 38, 25);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (205, 'Vilhelmina Childers', 'Aubert Kearney', '125-611-3649', 64, 3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (206, 'Nydia Duckworth', 'Patin Foyster', '861-674-2066', 198, 62);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (207, 'Estrella Ibbitt', 'Lindsay Graham', '383-916-8974', 181, 83);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (208, 'Jase Turrill', 'Tobye Filimore', '319-229-4820', 129, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (209, 'Fraze Hannaford', 'Alwin Leeves', '172-747-3703', 94, 158);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (210, 'Lyn Dikes', 'Sissie Fishpoole', '855-294-8845', 134, 85);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (211, 'Franz Scutts', 'Rudiger Caren', '796-469-9972', 40, 34);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (212, 'Bunny Double', 'Gaspar Habgood', '679-429-1786', 171, 76);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (213, 'Hinda Player', 'Abey Booeln', '658-597-6283', 75, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (214, 'Trudi Fishbourne', 'Milka Cozby', '829-962-4158', 51, 182);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (215, 'Keefer Arbon', 'Angelina Samples', '912-321-7269', 146, 50);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (216, 'Emalee Carlyon', 'Horst Pittendreigh', '953-135-8314', 177, 54);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (217, 'Phillida Flancinbaum', 'Avis Lantry', '609-223-1526', 56, 181);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (218, 'Winnie Moncaster', 'Heddi Hynd', '911-735-1434', 143, 52);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (219, 'Alexandro Stairs', 'Nobie Lorentzen', '785-126-8322', 48, 59);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (220, 'Clemmie Hainey`', 'Ellerey Hasling', '961-450-7101', 7, 129);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (221, 'Meredith Wormleighton', 'Dianne Ambler', '349-846-1034', 56, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (222, 'Neile Issacof', 'Matthus Rubinshtein', '534-153-1336', 104, 2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (223, 'Ansel Van Hault', 'Dasie Guerri', '956-881-7550', 110, 89);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (224, 'Reeta Riddel', 'Robin Horsburgh', '434-496-4111', 127, 29);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (225, 'Donalt Ribbens', 'Layton Medendorp', '966-545-4713', 196, 100);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (226, 'Leroy Cosin', 'Bordy Beebee', '809-501-7053', 71, 56);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (227, 'Hedvig Dodwell', 'Maureene Flawith', '979-371-8948', 101, 2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (228, 'Arielle Record', 'Pauli Patsall', '310-290-7304', 84, 170);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (229, 'Shari Kobierra', 'Miguelita Gomer', '784-638-9649', 27, 69);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (230, 'Silvanus Tacker', 'Wilmer Elnor', '665-681-6372', 2, 128);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (231, 'Doroteya Krzyzaniak', 'Peadar Kitson', '615-968-4694', 196, 123);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (232, 'Reade Teasdale-Markie', 'Gualterio McNeilley', '209-479-2242', 91, 178);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (233, 'Giavani Gentry', 'Kaylee Windress', '214-348-4758', 97, 142);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (234, 'Shepard Labba', 'Ardella De Castri', '314-919-1166', 181, 94);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (235, 'Cindie Tembey', 'Fidelia Beccera', '952-120-1540', 102, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (236, 'Samson Emmison', 'Gabriel Twitchett', '606-521-2139', 193, 41);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (237, 'Helenelizabeth Jedrachowicz', 'Giavani Gandey', '823-784-7815', 155, 49);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (238, 'Gisela Gill', 'Adrienne Hazley', '289-558-8688', 189, 60);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (239, 'Adaline Bagguley', 'Codee Dionisii', '218-835-0498', 42, 199);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (240, 'Brittaney Attfield', 'Barris Opdenorth', '908-274-3660', 117, 71);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (241, 'Maggee Winson', 'Moshe Plaskett', '905-372-8022', 149, 199);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (242, 'Shelagh Balls', 'Benyamin Edington', '789-383-3582', 120, 188);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (243, 'Ira Bettinson', 'Ailyn Daber', '393-789-7070', 93, 125);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (244, 'Krisha Yair', 'Marcile Sinclar', '804-830-7909', 166, 36);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (245, 'Wallis Ferebee', 'Herbert Springle', '211-633-2908', 68, 84);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (246, 'Randi Redsall', 'Henka Currier', '147-592-0111', 195, 84);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (247, 'Eada Hulatt', 'Rickie Gulleford', '892-486-3442', 42, 163);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (248, 'Glendon Barefoot', 'Konstanze Crabtree', '364-579-9946', 186, 113);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (249, 'Giacinta Stitwell', 'Jordanna Huffa', '504-261-5521', 70, 52);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (250, 'Keene Zimmerman', 'Marianne Andreutti', '423-470-9119', 44, 193);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (251, 'Perry Hacker', 'Pedro Stallan', '158-237-0354', 61, 100);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (252, 'Carlene Iohananof', 'Arlette Rallin', '376-657-4278', 149, 179);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (253, 'Jesselyn Wykey', 'Faina Juares', '502-911-3531', 12, 146);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (254, 'Michaelina Rojahn', 'Leda Zupa', '893-902-6865', 2, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (255, 'Nickie O''Hannigan', 'Edythe Robberts', '170-208-4212', 115, 164);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (256, 'Carlene Gilvear', 'Karylin Piel', '803-888-3525', 99, 95);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (257, 'Curr Simonnot', 'Davidde Falla', '887-865-8979', 144, 118);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (258, 'Scarlet Geill', 'Duke Acors', '642-556-3614', 78, 146);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (259, 'Valeda Culter', 'Hank Domokos', '161-826-7645', 13, 37);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (260, 'Idalina Syvret', 'Orin Galiero', '535-912-4345', 176, 3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (261, 'Charity Tidridge', 'Dion Dawkins', '399-514-7615', 129, 40);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (262, 'Luigi Dzenisenka', 'Pattie Pybworth', '425-159-3820', 9, 128);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (263, 'Easter Sabbatier', 'Darcie Chooter', '395-946-9853', 170, 74);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (264, 'Gawen Hampson', 'Tremain Byfford', '266-863-6266', 2, 25);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (265, 'Lilla Donnelly', 'Dalli Dumsday', '541-443-8999', 57, 19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (266, 'Alasdair Killby', 'Hobart Jahan', '791-809-3476', 64, 66);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (267, 'Frank Piatkowski', 'Peggie McKane', '904-293-5500', 148, 105);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (268, 'Conroy Calder', 'Doloritas Brislawn', '886-323-8474', 26, 38);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (269, 'Evin Brinson', 'Pearle Sutherley', '401-602-7933', 37, 186);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (270, 'Margot Karolyi', 'Rasla Frede', '744-286-3021', 101, 168);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (271, 'Hiram D''Aeth', 'Sidonnie Fearnehough', '588-524-7584', 22, 70);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (272, 'Cosimo Adams', 'Sarine Siflet', '809-982-4885', 122, 172);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (273, 'Gunter Pelham', 'Tynan Cypler', '367-465-0097', 133, 175);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (274, 'Meggy Buglar', 'Ronalda Breydin', '845-322-2212', 195, 129);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (275, 'Maryanne Audas', 'Hedvig Calderon', '408-452-5986', 194, 71);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (276, 'Dasya Eglin', 'Elmer Seywood', '735-946-0469', 34, 178);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (277, 'Durant Kiellor', 'Jacquie Burston', '768-377-3129', 101, 46);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (278, 'Marice Gemnett', 'Padraig Relfe', '885-109-4445', 174, 178);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (279, 'Rebbecca Fines', 'Alexi Dunkirk', '306-427-6968', 47, 38);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (280, 'Coop Jansie', 'Brandi Conquer', '917-269-2911', 189, 156);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (281, 'Rorke Marsland', 'Kittie Faragan', '862-131-4841', 37, 115);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (282, 'Lynelle Bolger', 'Gerhardine Brussels', '707-990-5156', 76, 144);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (283, 'Burch Paler', 'Chrystal Frankton', '647-329-9621', 15, 178);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (284, 'Skylar Fumagallo', 'Francesco Biggans', '343-590-4536', 133, 45);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (285, 'Mireille Ancliffe', 'Hilton Brownfield', '229-953-0274', 105, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (286, 'Rudy Norman', 'Amalie Meighan', '945-969-4660', 104, 180);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (287, 'Torey Chilcott', 'Beverlie Pfeffel', '483-977-7798', 133, 85);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (288, 'Vin MacLure', 'Maxie Gaydon', '380-552-3668', 86, 164);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (289, 'Benedetto Geekin', 'Rockie Sporton', '835-759-4919', 197, 122);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (290, 'Sheelagh Conrard', 'Gustavo Heatherington', '863-861-1962', 88, 175);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (291, 'Bobbi Pastor', 'Maureene Proschke', '965-347-1133', 35, 108);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (292, 'Thorpe Suscens', 'Abeu Dingley', '617-847-2487', 57, 129);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (293, 'Kin Kempster', 'Pooh Colgrave', '149-667-8630', 87, 192);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (294, 'Roley McAvin', 'Liesa Drage', '505-168-7378', 1, 152);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (295, 'Clarice Brewin', 'Luciano Perrycost', '884-445-7543', 153, 179);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (296, 'Kimbra Yakolev', 'Federica Frood', '557-796-7615', 69, 3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (297, 'Korry Lasty', 'Aluin Selbie', '721-599-1658', 61, 84);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (298, 'Anastasie Bamell', 'Cyndia Holdforth', '909-233-9810', 29, 107);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (299, 'Shea Pendall', 'Kikelia Tickner', '867-859-9317', 89, 59);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (300, 'Aryn Macartney', 'Erica Bathurst', '843-954-9939', 69, 51);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (301, 'Stanislas Berens', 'Molli Twelftree', '900-455-0872', 102, 181);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (302, 'Annecorinne Ardron', 'Amye Curthoys', '729-298-6378', 97, 176);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (303, 'Wilmar Inderwick', 'Sharron Wellum', '615-338-6985', 151, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (304, 'Wilfrid Beric', 'Tiphani Huguenet', '699-440-9405', 127, 136);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (305, 'Jolie Gilvear', 'Kristina Gainsbury', '302-446-3261', 58, 92);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (306, 'Austin L''Amie', 'Jilly Gouldstone', '391-322-1546', 130, 61);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (307, 'Jolynn Holston', 'Rafaela Alfonsetto', '624-415-8290', 165, 151);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (308, 'Marve Yurkevich', 'Pete Thackray', '875-621-7225', 177, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (309, 'Ethel Gulley', 'Alanna Farnorth', '680-275-5410', 172, 54);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (310, 'Emmie Hickford', 'Micky Gomar', '703-586-9341', 18, 121);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (311, 'Lacie Codrington', 'Konstance Braunter', '698-874-8418', 150, 79);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (312, 'Adorne Waleworke', 'Alasteir Cowdrey', '396-257-1521', 99, 154);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (313, 'Reuben Curry', 'Clareta Orritt', '171-962-4616', 101, 46);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (314, 'Phylys Sworne', 'Emogene Trye', '592-240-1213', 117, 188);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (315, 'Ardis Ciobutaru', 'Zondra Smallpeice', '422-468-5781', 81, 159);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (316, 'Tove Corrin', 'Mikey Stourton', '111-124-3120', 21, 81);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (317, 'Vinson Street', 'Gardy Saban', '688-166-1862', 5, 43);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (318, 'Myrtia Harnetty', 'Letitia Hasker', '383-414-3487', 72, 36);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (319, 'Kathryn Labbe', 'Claudio Vasyatkin', '406-670-6652', 97, 14);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (320, 'Karlens Keirle', 'Drucill Dannatt', '257-937-0251', 178, 91);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (321, 'Batsheva Gatty', 'Ashly Kuhne', '141-754-2245', 38, 73);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (322, 'Violet Boylin', 'Marta Petrolli', '317-112-7951', 69, 54);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (323, 'Scott Fittes', 'Abel Jedras', '981-668-7416', 125, 158);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (324, 'Roby Haggie', 'Odey Pusill', '997-174-0042', 42, 39);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (325, 'Ezechiel Revan', 'Ethe Toghill', '907-795-9945', 164, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (326, 'Cullie Dowrey', 'Peyton Tebbe', '318-830-4555', 64, 147);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (327, 'Babette Andraud', 'Vere Eastman', '188-463-4038', 98, 154);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (328, 'Gianna Coonan', 'Nefen Baldree', '427-520-7648', 117, 135);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (329, 'Bertha Cleal', 'Verena Spellard', '852-850-6060', 48, 25);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (330, 'Horatius Langforth', 'Modesty Neilus', '230-735-1427', 193, 200);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (331, 'Thane Alaway', 'Josephina Barbier', '149-563-0662', 182, 197);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (332, 'Gilberta Gothliff', 'Wilburt Ranscombe', '225-529-5253', 60, 136);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (333, 'Whitby Goodley', 'Jena Greenhall', '886-279-9047', 192, 192);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (334, 'Hannis Spellsworth', 'Pearla Boteman', '161-361-3276', 81, 154);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (335, 'Randie Guidetti', 'Jeniffer Hanby', '300-667-1410', 129, 175);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (336, 'Maxwell Terrelly', 'Wendeline Waddilow', '114-438-0807', 193, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (337, 'Alicea Penhalurick', 'Lester McGillreich', '124-727-9299', 174, 11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (338, 'Hestia Barlace', 'Harrietta Reace', '775-605-0937', 124, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (339, 'Viviene Pennycock', 'Flint Mathivat', '874-918-4630', 141, 123);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (340, 'Pearl Toffaloni', 'Desiri Speedy', '185-789-7869', 67, 127);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (341, 'Jacquelyn Kennagh', 'Christa Gent', '983-442-2643', 30, 99);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (342, 'Dacey Ritchie', 'Andreas Ernshaw', '666-992-2693', 105, 94);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (343, 'Winna Hein', 'Alley Brocks', '828-121-3256', 33, 39);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (344, 'Brittney Van Eeden', 'Ky Duffield', '795-652-0741', 181, 113);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (345, 'Erminia Mahony', 'Riordan Foote', '999-875-4644', 115, 183);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (346, 'Nat Teasey', 'Millard Skiggs', '870-796-3574', 145, 157);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (347, 'Rosemaria Nunn', 'Kendrick Wharin', '824-369-0419', 128, 120);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (348, 'Chelsy Harfleet', 'Gus Beddard', '543-117-9518', 57, 129);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (349, 'Gerrard Massard', 'Sully Abrahamian', '417-331-4349', 197, 99);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (350, 'Jethro Brandom', 'Marthe Gillow', '101-359-7126', 37, 192);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (351, 'Reube Brewitt', 'Sharla Crasford', '386-606-3726', 41, 188);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (352, 'Lyndell Tovey', 'Isidoro Punyer', '365-359-0744', 115, 151);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (353, 'Hyacintha Dytham', 'Pippy Ganderton', '330-797-4277', 119, 70);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (354, 'Gisele Ventris', 'Amil Kendrick', '156-913-8513', 105, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (355, 'Jessica Pinkstone', 'Kaja Kilmister', '585-524-5739', 75, 51);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (356, 'Willyt Matokhnin', 'Wenda Phinnessy', '968-734-1654', 92, 37);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (357, 'Gwynne Coey', 'Isabelita Bene', '392-376-5490', 115, 193);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (358, 'Conrad Constantine', 'Thekla Cicerone', '859-129-0169', 194, 174);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (359, 'Neale Eadie', 'Bianca Yeskov', '759-446-3120', 118, 152);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (360, 'Palmer Staig', 'Brynne Pina', '801-369-2094', 119, 179);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (361, 'Kile Buesden', 'Lorelle Stollenwerck', '536-660-1835', 189, 104);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (362, 'Sonny Cherry', 'Hyacinth Alldread', '811-746-6280', 86, 68);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (363, 'Averell Bebis', 'Meriel Yegorovnin', '554-886-7623', 175, 90);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (364, 'Cammi Littlechild', 'Dun Gaishson', '454-263-4673', 148, 170);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (365, 'Erminie Pates', 'Raffarty Adamiak', '197-159-6969', 149, 159);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (366, 'Zaria McGuinley', 'Ikey Christofe', '483-196-2702', 141, 161);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (367, 'Madeleine Trayling', 'Kerby Wellings', '711-450-8296', 108, 200);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (368, 'Jacinda Lettsom', 'Charla Broe', '572-683-6053', 77, 18);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (369, 'Rania Frisel', 'Kass Pedro', '280-795-5688', 96, 150);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (370, 'Israel Fareweather', 'Celinda Gaitone', '605-369-0493', 40, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (371, 'Kevan Broschke', 'Zackariah Ashbrook', '735-989-5928', 75, 178);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (372, 'Eda Alvis', 'Marena Soots', '859-734-3745', 41, 86);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (373, 'Lemmy Renshall', 'Fey Brantl', '792-306-9609', 81, 11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (374, 'Giustina Bell', 'Sutherlan McCracken', '610-975-9317', 137, 139);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (375, 'Gardiner Barajaz', 'Bobbee Devonald', '328-672-8491', 149, 22);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (376, 'Deidre Hyde-Chambers', 'Janessa Elix', '624-246-4284', 61, 30);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (377, 'Hunt Pitherick', 'Margarita Ludlem', '833-781-6777', 105, 92);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (378, 'Danika Noteyoung', 'Burtie Gommowe', '321-927-2164', 61, 150);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (379, 'Peirce Hesbrook', 'Raynard Dormer', '984-279-6566', 106, 33);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (380, 'Florencia Gaylard', 'Marjy McRitchie', '329-993-8961', 86, 28);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (381, 'Ahmad Linbohm', 'Jenelle Jacob', '264-248-5164', 30, 51);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (382, 'Oona Dugget', 'Morey Kidner', '144-689-3610', 158, 44);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (383, 'Edlin McMeekin', 'Gabriello Koeppke', '115-106-2143', 48, 72);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (384, 'Joell Darco', 'Ertha Quirke', '741-764-9729', 57, 160);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (385, 'Stanislaus Solley', 'Stepha Wife', '202-329-6036', 127, 93);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (386, 'Garrick Reeder', 'Kinsley McCool', '789-822-3938', 47, 162);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (387, 'Carin Mearns', 'Alexis Boner', '359-522-6021', 9, 57);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (388, 'Muffin Kaliszewski', 'Caterina Maryon', '454-469-3510', 145, 128);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (389, 'Sharai Nisot', 'Drusy Simonel', '382-553-3851', 64, 34);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (390, 'Arlina Lipmann', 'Chloette Catherick', '540-441-9146', 47, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (391, 'Gene Halfacre', 'Cati Dangerfield', '198-355-4348', 145, 145);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (392, 'Michaela Robrose', 'Sibby Bome', '944-845-2473', 17, 155);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (393, 'Carolan Tollit', 'Hilary Gipp', '926-657-7380', 74, 195);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (394, 'Lilah Lowe', 'Hew Treherne', '136-483-6846', 196, 47);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (395, 'Petr Bunkle', 'Osborn Jebb', '602-242-1084', 91, 198);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (396, 'Cloris Duddridge', 'Lemuel Poone', '353-503-8690', 31, 198);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (397, 'Frannie Gavriel', 'Myca Embling', '445-584-6970', 149, 130);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (398, 'Tedi Bidwell', 'Mirelle Butler', '782-707-6705', 95, 198);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (399, 'Monro Jurzyk', 'Hendrick Lowndsborough', '623-579-2550', 122, 171);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (400, 'Vidovik Sole', 'Abagael Tills', '948-237-1496', 62, 48);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (401, 'Kassie Georgot', 'Nikaniki McCerery', '173-425-9793', 156, 191);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (402, 'Lazaro Courtois', 'Haywood Calderon', '718-982-7337', 44, 67);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (403, 'Dulcia Eglaise', 'Hendrick Cottisford', '566-260-2892', 68, 54);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (404, 'Hamnet Fiddy', 'Lea Tunnadine', '142-193-2601', 108, 124);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (405, 'Alis Spinney', 'Amaleta Maynard', '612-556-5845', 46, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (406, 'Amelita Blazej', 'Lilllie Lodeke', '909-365-8662', 126, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (407, 'Klemens Downie', 'Misha Bartram', '835-119-0855', 93, 69);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (408, 'Hillier Darque', 'Caresse Berthot', '572-691-4041', 39, 153);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (409, 'Philly Reinard', 'Corene Lamble', '919-268-3293', 86, 71);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (410, 'Margaretha Bener', 'Odie Atger', '339-695-6235', 57, 69);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (411, 'Noah Rubinfajn', 'Justin Broady', '791-686-6744', 18, 194);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (412, 'Waiter Brauninger', 'Heywood Weins', '445-630-2556', 82, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (413, 'Danie Dowman', 'Sandor Scatcher', '387-668-3655', 72, 123);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (414, 'Dido Seleway', 'Jude Kersey', '253-801-1665', 39, 182);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (415, 'Sunny Royden', 'Fredi Deport', '365-647-8913', 107, 44);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (416, 'Galven Cadigan', 'Gunther Leng', '434-840-2499', 62, 61);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (417, 'Filide Fairlem', 'Dex Chotty', '334-476-8247', 52, 135);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (418, 'Page Killingback', 'Sven Barnfather', '172-749-0827', 10, 156);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (419, 'Micheline Elfleet', 'Palm Raulstone', '352-105-1625', 78, 109);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (420, 'Prentice Pegg', 'Mischa Bonallick', '903-530-1942', 72, 2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (421, 'Lynsey Roderigo', 'Patrizius Frankling', '304-319-7421', 89, 41);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (422, 'Irwin McBain', 'Ricky Duley', '259-881-1290', 8, 195);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (423, 'Jake Pippin', 'Fay Colvine', '535-264-0811', 52, 153);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (424, 'Harlen Risely', 'Husain Boothman', '515-317-4817', 97, 81);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (425, 'Dean Eilers', 'Kirsteni Phelips', '555-968-9989', 7, 21);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (426, 'Naomi Lismer', 'Carey Meffin', '374-923-5299', 181, 54);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (427, 'Armando Jardine', 'Gerrie Snepp', '228-283-1812', 128, 195);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (428, 'Rudolfo Dennerley', 'Doretta Beech', '532-184-8677', 113, 60);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (429, 'Doug Hearne', 'Eartha Sex', '543-219-9043', 109, 199);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (430, 'Milena Nesfield', 'Winifield Hendrichs', '251-677-8177', 105, 88);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (431, 'Cyrillus Hurn', 'Vonni Berrisford', '471-303-6664', 14, 63);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (432, 'Giana Ferguson', 'Laurette Skirlin', '120-721-8122', 2, 54);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (433, 'Crystal Rickesies', 'Beverley Jenteau', '751-451-9022', 42, 70);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (434, 'Vevay Fennelly', 'Walsh Filippucci', '207-750-1123', 91, 164);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (435, 'Kimble Hatrey', 'Mei Dupre', '264-510-8879', 95, 91);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (436, 'Abagail Cheltnam', 'Charles Ainger', '487-982-9303', 134, 7);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (437, 'Olga McInally', 'Kathryne Yetts', '762-194-5748', 69, 108);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (438, 'Brit O''Concannon', 'Harrison Foard', '197-369-5284', 4, 184);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (439, 'Chryste Bailie', 'Esta Cordy', '926-387-9868', 168, 118);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (440, 'Legra Sidry', 'Chico Mea', '682-409-3342', 13, 176);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (441, 'Otis Pringley', 'Bernita Latey', '889-399-7331', 72, 46);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (442, 'Frayda Shawyers', 'Margalo Wessel', '517-737-5855', 100, 103);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (443, 'Frayda McKimmey', 'Dilan Nolleau', '163-242-2139', 90, 133);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (444, 'Pierrette Trowl', 'Jaimie Cossentine', '244-326-2325', 77, 139);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (445, 'Galven Mitchinson', 'Elsi Jambrozek', '317-351-9675', 16, 135);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (446, 'Zackariah Fordham', 'Marsha Feirn', '498-259-9662', 173, 22);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (447, 'Alexandra Lamacraft', 'Kayla McHale', '302-541-9223', 19, 96);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (448, 'Estel Livezey', 'Taber Rameaux', '185-148-4961', 1, 11);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (449, 'Artie Witcomb', 'Dorthea Wincott', '602-119-0846', 163, 183);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (450, 'Borg Gossage', 'Theodor Henningham', '249-692-1066', 64, 95);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (451, 'Esta Kubicek', 'Willette Medwell', '543-529-3380', 141, 138);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (452, 'Kelwin Whitfield', 'Rebeca Aspel', '595-244-9848', 11, 36);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (453, 'Earle McDonagh', 'Davide Ranshaw', '126-235-5997', 38, 130);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (454, 'Artie Tesoe', 'Roscoe Cottier', '688-247-3371', 88, 89);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (455, 'Erda Setchfield', 'Ashlie Paaso', '764-545-0771', 65, 34);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (456, 'Gaston Pilmer', 'Maury Graeser', '994-167-5057', 70, 84);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (457, 'Ivor Shelsher', 'Adelice Ivett', '957-879-6074', 126, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (458, 'Timofei Starkings', 'Stirling Gutridge', '819-728-9151', 81, 158);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (459, 'Molli Leppingwell', 'Alair Huthart', '404-340-0305', 153, 100);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (460, 'Krispin Eddicott', 'Gabriella Johanssen', '761-176-9206', 118, 115);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (461, 'Sal Meaddowcroft', 'Tessy Fyndon', '616-659-4400', 139, 110);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (462, 'Vanny O'' Mara', 'Norby Duffet', '658-888-2544', 1, 188);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (463, 'Humfrey Strase', 'Merla Tregona', '514-385-4427', 37, 84);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (464, 'Anna-diane Tournay', 'Jody Corton', '882-677-8840', 7, 187);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (465, 'Ladonna Hadingham', 'Hilarius Albasini', '700-332-8110', 133, 129);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (466, 'Gussy Mossop', 'Orel Beasley', '493-289-5489', 111, 188);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (467, 'Collete Steen', 'Claudetta Kincade', '950-872-7780', 46, 163);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (468, 'Jared Guerriero', 'Astrix Brislen', '352-400-0376', 190, 136);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (469, 'Yank Kaye', 'Channa Lampart', '695-114-4244', 102, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (470, 'Logan Welds', 'Tobiah Scotchmur', '540-330-8339', 166, 184);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (471, 'Teddi Leeke', 'Gwynne Macallam', '319-865-6788', 152, 47);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (472, 'Aurea Sibbering', 'Cary Toombes', '807-528-3168', 16, 154);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (473, 'Raddy Lorenzo', 'Brett Delacroix', '326-502-9053', 83, 140);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (474, 'Essy Kaaskooper', 'Britney Shalcros', '545-562-7334', 73, 43);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (475, 'Yancy Statham', 'Xena McIlenna', '508-303-3730', 142, 148);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (476, 'Britta Fenner', 'Amberly Emer', '286-763-8555', 108, 48);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (477, 'Shell Leades', 'Mic Featherbie', '511-289-1041', 56, 144);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (478, 'Terry Raiker', 'Jesselyn Pessler', '310-337-9365', 141, 19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (479, 'Brook Kolczynski', 'Liz Klich', '438-682-6418', 80, 33);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (480, 'Devi Petz', 'Yevette Stobo', '171-728-6804', 91, 10);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (481, 'Gabriella Hendrick', 'Alene Bootherstone', '537-138-3841', 31, 75);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (482, 'Benton Dodle', 'Saloma Piscopiello', '585-943-3669', 130, 194);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (483, 'Abbe Temprell', 'Jodee Wilcocks', '875-548-2391', 75, 144);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (484, 'Fabiano Geldeard', 'Dell Tomas', '261-409-3848', 163, 198);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (485, 'Town McNelis', 'Tybi Patifield', '375-480-7776', 174, 185);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (486, 'Elianore Mion', 'Abbie Collumbell', '853-366-3355', 102, 157);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (487, 'Edwin Cross', 'Mignonne Scrine', '921-149-3046', 15, 121);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (488, 'Trey Gorry', 'Caterina Willows', '559-150-8546', 119, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (489, 'Tarrance Cathcart', 'Asia Jaquemar', '422-895-8690', 193, 65);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (490, 'Nelly Hughlin', 'Jori Rummings', '460-896-4277', 109, 1);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (491, 'Melloney Letertre', 'Paul Sante', '314-522-7167', 87, 181);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (492, 'Kirsti Abriani', 'Darin Berget', '786-726-7912', 80, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (493, 'Calhoun Marsden', 'Vivienne Huchot', '143-259-4489', 143, 157);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (494, 'Catharina Thor', 'Ange Greschke', '122-156-4805', 48, 128);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (495, 'Stormi Dashkovich', 'Krystyna Burgoine', '647-449-0980', 178, 38);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (496, 'Arlyn Handrick', 'Rozanne Letten', '756-419-8736', 170, 49);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (497, 'Denis Jellybrand', 'Nerita Piatto', '169-447-4447', 175, 60);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (498, 'Kylie Goodson', 'Gilly Maslen', '784-677-4966', 197, 135);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (499, 'Artur Mathelin', 'Britte Dulen', '128-905-1470', 79, 147);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (500, 'Birdie Laurens', 'Ruddie Canceller', '743-547-3127', 60, 67);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (501, 'Clarine Stendell', 'Yasmin Bendell', '110-630-8795', 172, 86);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (502, 'Randolph Caslane', 'Teddie Lebarree', '876-877-0237', 37, 96);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (503, 'Aldrich Dell Casa', 'Kirstyn Capnor', '605-525-0351', 192, 75);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (504, 'Kort Flanders', 'Pincas Trenbey', '508-851-8942', 176, 19);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (505, 'Poul Sowthcote', 'Wallace Levinge', '772-593-2053', 165, 193);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (506, 'Tammy Orneblow', 'Juliane Spreull', '605-559-7883', 55, 71);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (507, 'Jewelle Baggiani', 'Vasilis Birdwistle', '804-990-4674', 188, 143);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (508, 'Donielle Facey', 'Mabelle Hainning', '533-908-8661', 134, 31);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (509, 'Eli Lere', 'Shina Szreter', '709-781-1377', 183, 78);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (510, 'Gannon Lowell', 'Selle Caughey', '487-890-1209', 154, 195);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (511, 'Rawley Tousy', 'Giustino Cowie', '835-178-8937', 105, 44);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (512, 'Alessandra Mayhead', 'Janot McKinlay', '650-379-3804', 171, 87);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (513, 'Corbet Whiterod', 'Trumann Clyne', '530-246-8255', 8, 87);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (514, 'Mabel Geach', 'Gill Skoyles', '695-249-3607', 161, 185);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (515, 'Amabelle Ritmeyer', 'Trey Fludder', '110-985-4945', 165, 110);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (516, 'Zia Huttley', 'Terence Davidson', '125-620-9960', 84, 188);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (517, 'Gusta Pawson', 'Derry Leban', '630-538-8678', 120, 161);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (518, 'Ginger Dossetter', 'Joceline Camilio', '401-952-3596', 171, 125);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (519, 'Mallory Yanin', 'Kori Bussons', '509-706-7786', 100, 154);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (520, 'Liesa Itzkovwitch', 'Rafaellle Baldelli', '717-844-3123', 154, 23);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (521, 'Virgilio Lineen', 'Scarface Casassa', '957-415-6965', 53, 44);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (522, 'Giraud Pennetti', 'Frederique Arlet', '838-728-1640', 168, 28);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (523, 'Raquel Gheraldi', 'El Voce', '817-434-4799', 76, 118);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (524, 'Kean Bensusan', 'Xever Belfit', '537-842-3050', 76, 71);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (525, 'Elvira Fishpond', 'Monroe Hernik', '947-888-8217', 46, 114);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (526, 'Pancho Jansey', 'Moore Rustadge', '773-640-9328', 159, 129);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (527, 'Weber Gooderham', 'Aurea Espadas', '805-331-6708', 127, 48);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (528, 'Nina Sobtka', 'Aguste Zanassi', '667-390-1691', 54, 125);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (529, 'Gilli Dalston', 'Katti McKenna', '372-364-1789', 8, 116);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (530, 'Amble Ruffler', 'Adrian Maydwell', '637-163-5722', 137, 112);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (531, 'Thoma Nairns', 'Alair Marzelo', '349-929-0397', 68, 66);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (532, 'Yankee O''Corrin', 'Raoul Loadsman', '991-832-9407', 39, 13);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (533, 'Osmund Borrett', 'Elonore Binton', '521-450-0120', 1, 87);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (534, 'Gardy Tingey', 'Cris Abrami', '804-702-6997', 136, 97);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (535, 'George Laurenty', 'Nikos Klaessen', '399-314-6917', 133, 3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (536, 'Sarge Pittford', 'Herrick Tibb', '713-399-0466', 96, 117);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (537, 'Candi Elis', 'Sascha Lenahan', '348-126-5555', 80, 91);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (538, 'Monroe Newe', 'Donna Jepp', '349-507-9181', 127, 30);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (539, 'Jana Rawlin', 'Shannon Cakebread', '419-366-2134', 158, 109);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (540, 'Sallee Balsellie', 'Emily Paterno', '823-446-1319', 149, 193);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (541, 'Farrel Khosa', 'Dennie Huff', '361-160-7837', 18, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (542, 'Braden Pilley', 'Bryon Rizzo', '497-255-6261', 199, 120);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (543, 'Laurianne Dunbobin', 'Sonnie Sapson', '584-300-0550', 47, 29);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (544, 'Neill Joscelyne', 'Letisha Domney', '850-856-0044', 124, 120);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (545, 'Trudey McCallion', 'Aristotle Brose', '112-870-0452', 193, 127);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (546, 'Colby Arrigo', 'Niles Lowten', '204-259-9748', 38, 174);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (547, 'Astra Suthren', 'Isiahi Wodham', '472-799-5286', 198, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (548, 'Jocelyne Sunley', 'Jerrine Sarra', '649-186-9546', 84, 140);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (549, 'Marguerite Boller', 'Alick Ambage', '388-669-9284', 172, 116);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (550, 'Shellysheldon Dewdeny', 'Peyton Gartside', '522-785-6294', 171, 167);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (551, 'Shirley Cubbit', 'Arny Oldis', '433-425-8088', 11, 176);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (552, 'Jermaine Shallo', 'Van Astupenas', '789-186-3496', 21, 139);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (553, 'Modesty Lampet', 'Lauretta Antonikov', '343-128-0963', 128, 127);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (554, 'Alexandre Cisson', 'Desmond Lovart', '383-790-1397', 26, 77);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (555, 'Hulda Finnemore', 'Verene Wand', '779-358-1664', 92, 134);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (556, 'Zackariah Newrick', 'Deb Tabart', '509-348-7129', 196, 131);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (557, 'Babbette Fogarty', 'Amata Stubbeley', '597-198-6935', 8, 136);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (558, 'Rosy Webberley', 'Breena Bason', '617-663-6285', 79, 38);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (559, 'Mame Rosenstock', 'Truman Riveles', '801-247-8064', 187, 136);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (560, 'Cchaddie Schaumaker', 'Dal McGhie', '114-440-4289', 109, 176);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (561, 'Sissy Sawney', 'Loralee Gabe', '821-707-0795', 131, 42);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (562, 'Fonzie Granham', 'Janessa Grayshan', '790-533-1134', 187, 175);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (563, 'Ronnie Billings', 'Maurizia Blaszkiewicz', '878-200-7076', 199, 147);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (564, 'Selina Hallin', 'Justino Romeril', '642-519-5284', 165, 2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (565, 'Cathyleen Kilbane', 'Elizabeth Siggens', '984-500-3663', 127, 101);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (566, 'Christos Varrow', 'Susann Eliot', '259-402-1687', 197, 51);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (567, 'Emmye Vivien', 'Ann-marie Bownes', '332-533-3239', 71, 25);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (568, 'Yorke Galiero', 'Evvy Realy', '816-469-8243', 81, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (569, 'Wilhelmine Pennazzi', 'Ripley Ensor', '515-658-9682', 128, 177);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (570, 'Ronda Osmint', 'William McCrohon', '396-879-7645', 92, 147);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (571, 'Dan Del Castello', 'Gerta Tomasian', '233-304-9727', 83, 113);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (572, 'Jabez Morena', 'Hermann Dyster', '789-729-0320', 37, 126);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (573, 'Lenore Dan', 'Easter Digman', '732-233-3138', 3, 84);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (574, 'Corrie Pitman', 'Bennie Gerritzen', '310-760-0716', 51, 24);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (575, 'Shelby Tiptaft', 'Nikoletta Robey', '412-279-5636', 65, 84);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (576, 'Aaron Ough', 'Raquela Golson', '284-456-9015', 69, 89);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (577, 'Dillie O''Cleary', 'Pauline Hilland', '642-913-0414', 28, 166);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (578, 'Tedman Mollett', 'Janey Kuhl', '980-661-7381', 183, 99);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (579, 'Quintin Ritchard', 'Liuka Simmell', '528-770-1019', 12, 200);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (580, 'Goldy De la croix', 'Olia Davitt', '880-530-7571', 187, 173);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (581, 'Fabe Hulett', 'Hewe Borley', '828-336-7323', 60, 126);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (582, 'Iorgos Philipot', 'Alfonse Losty', '987-308-1386', 74, 161);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (583, 'Byran Tenny', 'Daune Covell', '152-248-0839', 64, 185);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (584, 'Vitia Croizier', 'Coreen Pikhno', '195-518-4954', 148, 67);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (585, 'Nadiya Skullet', 'Madelle Baddam', '372-506-9099', 155, 139);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (586, 'Bert Dunnion', 'Alvis Livezley', '353-553-0226', 75, 187);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (587, 'Cristie Vinten', 'Leo Feben', '963-395-1305', 134, 114);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (588, 'Bruce Impleton', 'Fred Denys', '180-407-0005', 132, 110);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (589, 'Cissiee Glisane', 'Thurston Bynold', '250-566-0777', 61, 145);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (590, 'Vasily McFadin', 'Carmelle Braycotton', '816-680-6173', 10, 160);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (591, 'Tremayne Morando', 'Ramonda Samms', '231-301-2295', 191, 172);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (592, 'Mindy Dilkes', 'Avis Pearcey', '851-555-7031', 124, 42);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (593, 'Fee Garrood', 'Joleen Barry', '240-785-1305', 132, 185);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (594, 'Derward Legate', 'Galina Clackson', '481-933-3637', 124, 88);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (595, 'Hamish Goalley', 'Glen Bendig', '480-520-8933', 15, 39);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (596, 'Lezley Bootherstone', 'Sheri Harvey', '818-270-5706', 126, 131);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (597, 'Irwinn Basnett', 'Ashton Robarts', '391-662-7288', 73, 109);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (598, 'Barbabas Soames', 'Shirlene De Gouy', '522-275-5862', 68, 93);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (599, 'Jozef Vodden', 'Arlene Neno', '258-206-2806', 156, 62);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (600, 'Martino Leibold', 'Sayres Mountney', '528-819-6864', 90, 62);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (601, 'Rollins Crookston', 'Gregorio Barber', '183-520-2062', 59, 63);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (602, 'Foss Macallam', 'Prescott Storror', '814-326-5050', 75, 139);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (603, 'Allayne Ech', 'Hewie Mitie', '159-861-1394', 7, 43);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (604, 'Duffy Stanborough', 'Andris Koppelmann', '191-741-6244', 102, 118);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (605, 'Sutton Asch', 'Thorndike Ausher', '530-768-3848', 85, 96);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (606, 'Piper Lyfield', 'Webster Blanshard', '776-489-7333', 38, 102);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (607, 'Jemmie Kenderdine', 'Ramsey Patershall', '913-666-7405', 83, 138);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (608, 'Esmeralda Flaubert', 'Cecelia Prudham', '115-259-9066', 128, 142);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (609, 'Marya Culross', 'Farra Linley', '527-408-0109', 190, 188);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (610, 'Madalena Jacquest', 'Othilia Tomadoni', '988-650-0376', 20, 147);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (611, 'Codi Bowerbank', 'Katharine Proger', '671-894-6939', 23, 32);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (612, 'Tim Lainge', 'Shandeigh Durante', '276-417-1326', 141, 138);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (613, 'Luigi Rippen', 'Ilyssa Southcomb', '440-730-4783', 181, 172);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (614, 'Karolina Hartless', 'Klement Murrey', '943-680-3228', 125, 54);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (615, 'Florence Colten', 'Caldwell Gravenell', '602-714-5192', 152, 61);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (616, 'Druci Starkie', 'Twila Jiroutka', '493-633-7135', 187, 73);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (617, 'Jeanie Mongeot', 'Katerina Tsar', '491-470-5007', 88, 25);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (618, 'Marena Raitt', 'Jedediah Bold', '731-218-2808', 124, 64);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (619, 'Dolf Bonsale', 'Eldridge Lambdin', '823-902-9629', 1, 58);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (620, 'Storm Ghirigori', 'Wendye Rickaert', '305-957-6995', 3, 146);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (621, 'Cathy Sarge', 'Patrica Jonson', '814-241-3487', 16, 97);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (622, 'Paola Heers', 'Christalle Lyndon', '739-513-2011', 85, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (623, 'Bari Smaridge', 'Corine Van Arsdall', '106-166-8079', 10, 158);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (624, 'Broddie Clendening', 'Chaim Bluck', '610-350-7158', 196, 91);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (625, 'Goldi Buss', 'Petronille Feige', '543-749-9846', 33, 64);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (626, 'Latisha Scardifield', 'Towny Fell', '613-160-7031', 127, 107);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (627, 'Julie Salaman', 'Adina Lacer', '309-864-8265', 23, 167);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (628, 'Mariam Dowyer', 'Andras Mateu', '649-777-5735', 88, 102);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (629, 'Moe Ferris', 'Catha Sarginson', '864-469-6279', 7, 188);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (630, 'Sutton McGahy', 'Zsazsa Rozalski', '459-308-6613', 185, 143);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (631, 'Giustina Killigrew', 'Ema Measor', '879-160-0512', 11, 21);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (632, 'Deny Keenlyside', 'Herminia Pabst', '947-155-8368', 75, 149);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (633, 'Marmaduke Yashaev', 'Nellie Urlich', '172-288-2941', 61, 92);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (634, 'Anet Hearne', 'Thea Balasini', '405-657-8366', 60, 188);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (635, 'Syd Dimitriades', 'Mace Hand', '611-515-3355', 90, 200);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (636, 'Sherman Haxley', 'Franciskus Flanne', '747-736-6857', 165, 5);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (637, 'Hashim Bartusek', 'Emmy Stokey', '147-270-9308', 66, 105);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (638, 'Collette Trencher', 'Fredelia Henrie', '466-967-1470', 97, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (639, 'Casey Ellerker', 'Brunhilde O''Donovan', '742-932-4069', 8, 185);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (640, 'Juanita Gavan', 'Stuart Hassett', '578-940-6183', 21, 112);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (641, 'Adolphus Vasishchev', 'Vinnie Blandamere', '698-494-8596', 138, 143);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (642, 'May Chilcott', 'Fee Murrum', '587-131-7104', 78, 20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (643, 'Eran Loveland', 'Ewell Burdon', '965-365-0917', 160, 113);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (644, 'Kienan Carnie', 'Keri Hadlington', '753-155-3810', 185, 197);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (645, 'Rina Bytheway', 'Tara Wildey', '777-820-6212', 158, 71);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (646, 'Parker Matskevich', 'Parnell Farnill', '393-242-1557', 121, 92);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (647, 'Ranique Brussels', 'Jannelle Phippen', '719-197-6833', 53, 45);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (648, 'Penelope Witt', 'Aleda Thor', '562-351-0873', 192, 184);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (649, 'Bernardo Huckerbe', 'Birgitta Gurry', '292-771-9750', 92, 78);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (650, 'Olia Petraitis', 'Malvina Patty', '241-163-9681', 87, 195);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (651, 'Bert Alonso', 'Ruperto Cominello', '185-939-7374', 52, 27);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (652, 'Devondra Durrad', 'Terrill Mallison', '881-837-2200', 138, 38);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (653, 'Dorry Clampton', 'Aubree Newall', '883-682-5281', 53, 58);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (654, 'Dalston Knee', 'Rolph Smeall', '358-671-4896', 9, 88);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (655, 'Dalia Ivashin', 'Merrielle Charters', '528-402-1243', 147, 144);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (656, 'Verla Gerbl', 'Christalle Mallall', '647-651-5277', 2, 94);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (657, 'Wye O''Dennehy', 'Bendite Giovannacc@i', '394-322-9920', 6, 168);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (658, 'Dorie MacGahy', 'Erroll Djokic', '125-105-2876', 52, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (659, 'Bronny Woodrooffe', 'Selie Springate', '865-421-0210', 10, 30);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (660, 'Fin Blei', 'Tina Vidineev', '185-450-4296', 4, 38);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (661, 'Tannie Grissett', 'Francesco Jeandel', '486-425-8141', 113, 120);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (662, 'Sosanna Kowal', 'Arlette Sucre', '899-895-5683', 146, 140);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (663, 'Mabelle Nesfield', 'Bambi Castagne', '459-983-2026', 68, 139);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (664, 'Netta Farnsworth', 'Raddy Downey', '462-270-2838', 15, 167);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (665, 'Marylee Clews', 'Ignatius Champion', '118-159-2145', 149, 172);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (666, 'Terry Simonel', 'Filberte Matteau', '479-267-1844', 188, 3);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (667, 'Sharity Macquire', 'Randi Scogin', '875-469-7430', 98, 121);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (668, 'Frasco Itzakson', 'Sallee enzley', '940-860-7035', 146, 85);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (669, 'Milzie Willshaw', 'Tisha Pocknell', '941-484-9716', 77, 149);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (670, 'Joeann Woodfine', 'Maxwell Ivanets', '627-499-3517', 11, 58);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (671, 'Laurie Sharpus', 'Bendicty Faunch', '392-568-0018', 25, 32);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (672, 'Gavrielle Sodo', 'Doretta Arnason', '504-390-5627', 88, 151);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (673, 'Opal Newns', 'Gertie Targetter', '139-366-1795', 178, 20);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (674, 'Torrie Toyne', 'Thorsten Caberas', '895-709-6737', 11, 69);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (675, 'Jemie Duffie', 'Dorice Vauter', '813-767-5592', 85, 90);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (676, 'Jaime Gwillim', 'Olimpia Caitlin', '393-834-0818', 106, 78);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (677, 'Fionnula Dhennin', 'Chaunce Snelgrove', '210-924-4877', 165, 163);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (678, 'Rory Salthouse', 'Dallon Shurmer', '605-861-2119', 165, 183);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (679, 'Keefer Deport', 'Horace Ferson', '382-858-9691', 106, 34);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (680, 'Morgan Kingzet', 'Gerhardt Skinley', '547-212-0523', 116, 72);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (681, 'Innis Ramme', 'Nate Orrin', '730-825-5602', 86, 39);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (682, 'Jean Death', 'Oralla Gundry', '658-876-0024', 74, 98);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (683, 'Debor Hurburt', 'Danya Sire', '369-614-8366', 22, 129);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (684, 'Lorianne Hukin', 'Malvina Shreeves', '652-186-0729', 167, 143);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (685, 'Abbot Stables', 'Guillema Hastwell', '576-191-8143', 137, 192);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (686, 'Ali Duckers', 'Elita Calafate', '204-454-6465', 162, 151);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (687, 'Sherrie Castiblanco', 'Weylin Pollicott', '598-774-7796', 182, 17);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (688, 'Sanson Shakle', 'Jerrome Lighten', '106-537-5148', 168, 67);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (689, 'Dorey Yaldren', 'Blane Lipson', '856-383-4096', 176, 127);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (690, 'Free Trude', 'Gerald Fishby', '788-850-1161', 9, 15);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (691, 'Nataniel Pilipets', 'Amalle Ossenna', '464-992-5209', 7, 72);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (692, 'Mira Edgar', 'Angelita Rump', '703-744-7837', 102, 165);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (693, 'Cassius Josiah', 'Opal Brazear', '449-787-0071', 133, 88);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (694, 'Halsey Lovegrove', 'Dexter Clausen', '848-942-4053', 174, 178);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (695, 'Biddy Biasi', 'Victoir Clemens', '868-170-0143', 174, 171);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (696, 'Kessia Pfeffle', 'Raphaela Fantini', '712-491-6035', 161, 91);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (697, 'Sofia Whitear', 'Jordain Kelly', '605-820-1242', 26, 166);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (698, 'Berenice Oloshin', 'Lian Jowling', '898-199-6983', 60, 111);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (699, 'Dare Maffeo', 'Sylvester Vedeshkin', '419-925-6511', 32, 89);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (700, 'Tamqrah Ary', 'Minna Thrush', '232-257-7209', 3, 152);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (701, 'Deane Whillock', 'Thaxter Commucci', '719-935-6074', 80, 78);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (702, 'Tiphanie Spears', 'Julina Aleshintsev', '865-500-0912', 48, 198);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (703, 'Bernadine Pitrollo', 'Sara-ann Kleinschmidt', '586-568-6230', 5, 27);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (704, 'Harbert Michie', 'Annette Lockery', '192-128-9205', 172, 89);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (705, 'Saw Scobbie', 'Reid Philipot', '680-711-1467', 55, 138);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (706, 'Rodolph Earlam', 'Pavia Dabner', '346-170-0572', 111, 153);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (707, 'Kristine Laytham', 'Adelind Lind', '190-451-1210', 198, 100);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (708, 'Reggis Dyerson', 'Tobin Scoterbosh', '650-371-3991', 68, 40);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (709, 'Erda Diloway', 'Sheri Swayland', '400-683-1233', 163, 39);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (710, 'Tadd Culvey', 'Derick Rooze', '702-521-9301', 157, 117);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (711, 'Allina Sarjeant', 'Veronika Drabble', '794-123-2115', 28, 190);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (712, 'Kris Castagneri', 'Wilt Plowman', '317-325-3667', 198, 74);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (713, 'Alene Najafian', 'Ashby Kemmis', '213-534-8391', 5, 47);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (714, 'Amanda Killiam', 'Clemmy Danks', '731-654-3567', 110, 141);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (715, 'Mirabelle Grunwald', 'Glenn Brislawn', '401-590-5601', 12, 135);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (716, 'Marlin Madgwick', 'Ruthanne Egiloff', '581-723-5782', 21, 78);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (717, 'Beauregard Hamshar', 'Cassandre Penwell', '559-969-0357', 114, 123);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (718, 'Corey Mibourne', 'Caitrin Earthfield', '231-253-6455', 160, 42);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (719, 'Virgil Ginglell', 'Archibald Courtes', '460-113-7435', 100, 56);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (720, 'Claudian Wallbutton', 'Zaccaria Veryan', '510-577-0807', 27, 113);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (721, 'Earlie Hale', 'Maybelle Mc Gee', '901-785-3748', 71, 105);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (722, 'Rolph Drissell', 'Barton Tebboth', '927-835-9940', 99, 133);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (723, 'Gwenni Gradon', 'Orland Wolffers', '253-961-4857', 105, 169);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (724, 'Livvy Briant', 'Dav Stanaway', '582-385-1884', 25, 12);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (725, 'Maurene Francis', 'Saudra Sygroves', '565-693-6989', 24, 137);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (726, 'Eldridge Hamil', 'Calvin Shubotham', '919-202-6602', 55, 76);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (727, 'Eugenio McAllister', 'Brod Kalisch', '330-516-3036', 168, 88);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (728, 'Ainslee Fuentez', 'Urbanus Harnott', '545-764-3539', 92, 195);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (729, 'Simeon Haggerwood', 'Jere Housego', '216-958-3474', 155, 67);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (730, 'Celinda Measom', 'Brod Shatliffe', '359-882-2564', 199, 51);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (731, 'Charita Southerden', 'Den Dally', '501-623-4985', 119, 139);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (732, 'Tilly Rousby', 'Myrta Cardis', '125-974-9332', 9, 106);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (733, 'Desmond Woolen', 'Fancie Jozefczak', '521-310-7489', 30, 107);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (734, 'Ellswerth Nucciotti', 'Teodor Joint', '844-702-8017', 192, 50);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (735, 'Ofella Hammerson', 'Jeniffer Tooze', '785-568-5000', 75, 46);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (736, 'Bord Shackell', 'Nancie Illingworth', '638-432-4981', 28, 39);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (737, 'Kylen Cartan', 'Micheline Oganian', '133-544-9811', 7, 163);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (738, 'Stillmann Le Barr', 'Milli Mayman', '549-554-3835', 59, 70);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (739, 'Gerard Doyland', 'Cole Le Galle', '421-943-6634', 191, 76);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (740, 'Janina Terne', 'Renate Cordeiro', '667-730-0361', 85, 37);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (741, 'Maximilian Songist', 'Oralee McGarvey', '160-497-3199', 19, 4);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (742, 'Egor Sheppey', 'Catriona Doidge', '973-326-4003', 17, 53);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (743, 'Bobette Flintiff', 'Drusy McIlhatton', '617-923-3980', 67, 186);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (744, 'Joly Iacopetti', 'Willy Mintoft', '573-104-9947', 185, 23);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (745, 'Emmett Kleinhaus', 'Shalom Edginton', '393-869-6756', 77, 176);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (746, 'Sibbie Trowsdale', 'Billie Reitenbach', '997-865-3318', 50, 149);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (747, 'Jamima Annand', 'Ericka Readhead', '866-774-1744', 185, 131);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (748, 'Nat Munnion', 'Philippe Couchman', '822-597-8664', 92, 95);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (749, 'Quintina Billanie', 'Ulberto Geistmann', '790-181-0430', 141, 178);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (750, 'Clotilda Haldon', 'Son Tidman', '945-117-2239', 120, 93);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (751, 'Phillipp Benham', 'Lemmy Brislan', '647-203-1031', 59, 140);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (752, 'Vilma Coult', 'Mayne Johanssen', '360-316-7903', 104, 60);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (753, 'Georgie Jarvis', 'Karlotta Cutbush', '848-666-3943', 40, 90);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (754, 'Aubine Huckfield', 'Roderic Edinboro', '255-872-7913', 74, 93);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (755, 'Sigvard Danaher', 'Mona Aspray', '117-922-9395', 4, 183);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (756, 'Abra Phillippo', 'Silas Haliburton', '989-379-7727', 52, 92);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (757, 'Amerigo Lindeberg', 'Dwain Trenbey', '367-917-0799', 195, 196);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (758, 'Alvy Ridoutt', 'Genevieve McKirton', '665-761-3145', 104, 65);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (759, 'Rocky Ramsdale', 'Giordano Marchington', '729-703-1938', 175, 179);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (760, 'Blane Childes', 'Gunilla Fessler', '474-639-8321', 129, 128);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (761, 'Elihu Sawford', 'Claiborn Rock', '664-391-6697', 71, 184);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (762, 'Kale Caplis', 'Dionis Borzone', '731-368-9658', 131, 16);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (763, 'Worth Deftie', 'Jamal Coney', '208-168-5180', 128, 153);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (764, 'Godard Mattsson', 'Xylina Wooder', '193-835-8933', 25, 2);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (765, 'Sabra Notti', 'Mauricio Polino', '358-868-4067', 60, 130);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (766, 'Corrie Hurn', 'Dov Scrine', '889-755-9297', 54, 172);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (767, 'Melinda Berston', 'Jacinda Scolding', '481-670-2157', 186, 180);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (768, 'Glynda Bowley', 'Berny Timbs', '697-553-1844', 30, 67);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (769, 'Everard Wainer', 'Noby Ratnage', '384-693-9632', 106, 59);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (770, 'Emeline Annion', 'Blithe Phidgin', '124-126-5910', 160, 83);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (771, 'Hillary Bims', 'Derick Mattecot', '500-972-9412', 62, 46);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (772, 'Blondy MacAloren', 'Anderea Yurtsev', '255-543-4336', 160, 149);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (773, 'Jerrie Cavey', 'Luigi Carlile', '856-790-3905', 64, 27);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (774, 'Felicdad Luety', 'Carree Ricardou', '771-953-1482', 6, 22);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (775, 'Wald Okenfold', 'Herc Kumar', '744-457-5660', 82, 100);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (776, 'Barret Banisch', 'Glenine Picton', '987-627-0752', 118, 158);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (777, 'Kennith Seaborn', 'Daniella Carnoghan', '601-590-5397', 41, 86);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (778, 'Dee dee Keen', 'Dillie Grahamslaw', '909-170-7240', 184, 49);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (779, 'Burt Barg', 'Howie Ferby', '156-956-6109', 107, 165);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (780, 'Erastus Sisley', 'Alica Pottes', '850-892-1729', 38, 124);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (781, 'Savina Lagde', 'Jewel Feather', '822-175-3315', 89, 66);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (782, 'Janey Corneil', 'Hadrian de Mendoza', '202-524-8375', 5, 21);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (783, 'Suzann Szymonowicz', 'Marlowe Licence', '799-815-3737', 55, 22);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (784, 'Kathryne Carsberg', 'Quinta Varty', '356-326-4944', 128, 6);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (785, 'Ciel Marsden', 'Farleigh Sauniere', '356-466-2612', 146, 57);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (786, 'Ketti Uff', 'Jewelle Persey', '496-752-3210', 30, 25);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (787, 'Teddy McCrum', 'Jarvis Blewmen', '513-715-2456', 103, 98);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (788, 'Tiphanie Leebetter', 'Ian Northrop', '670-850-9107', 58, 119);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (789, 'Bo Philipsson', 'Mitzi Annatt', '609-717-2660', 63, 44);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (790, 'Barrie McGlaud', 'Bell Barmadier', '763-992-6061', 114, 90);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (791, 'Ryann Bibb', 'Joyce Winny', '495-645-5262', 55, 140);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (792, 'Georgena Orrin', 'Lexis Dunthorn', '460-171-7555', 99, 129);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (793, 'Stephani O''Leahy', 'Liam Dufour', '779-813-9123', 43, 75);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (794, 'Obadias Dibdin', 'Nissy Hargreves', '415-916-9222', 13, 168);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (795, 'Godfree O''Sheeryne', 'Sileas Denington', '684-148-4702', 173, 103);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (796, 'Miguela Skahill', 'Lorri Wartonby', '179-427-3788', 30, 8);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (797, 'Lenee Gyorffy', 'Erik Bonder', '622-130-3301', 37, 38);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (798, 'Isac Haken', 'Caresa Zanazzi', '812-838-5217', 58, 135);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (799, 'Brunhilda Bercevelo', 'Danice Stirgess', '754-317-7875', 34, 77);
insert into NHANVIEN (MaNV, TenNV, DiaChiNV, SDTNV, MaCongTy, MaPHG) values (800, 'Paige Pettican', 'Bentley Clashe', '192-717-3437', 3, 76);

--Insert table CHITIETHOPDONG

insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (190, 178, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (193, 64, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (139, 21, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (35, 159, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (54, 61, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (91, 182, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (119, 180, 23);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (158, 31, 7);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (146, 18, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (175, 131, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (197, 47, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (195, 65, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (1, 152, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (49, 195, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (71, 156, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (23, 95, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (179, 80, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (49, 38, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (43, 140, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (13, 191, 23);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (97, 50, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (84, 82, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (183, 149, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (187, 193, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (179, 23, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (159, 16, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (16, 2, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (170, 82, 23);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (181, 69, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (161, 49, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (169, 100, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (83, 194, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (76, 175, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (27, 62, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (106, 8, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (11, 162, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (28, 23, 7);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (152, 70, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (40, 190, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (124, 156, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (144, 116, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (84, 160, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (158, 102, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (60, 151, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (191, 135, 23);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (139, 158, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (174, 17, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (73, 61, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (70, 161, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (147, 24, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (27, 80, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (120, 65, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (81, 120, 7);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (182, 113, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (143, 89, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (76, 159, 8);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (7, 82, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (84, 181, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (111, 109, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (48, 178, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (67, 167, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (84, 54, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (127, 27, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (21, 180, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (30, 105, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (121, 15, 23);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (156, 76, 8);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (107, 3, 7);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (180, 63, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (182, 137, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (171, 67, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (77, 44, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (127, 148, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (142, 64, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (73, 156, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (153, 170, 12);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (87, 70, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (178, 189, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (72, 12, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (107, 139, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (90, 130, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (167, 146, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (65, 24, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (191, 75, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (135, 28, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (16, 194, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (54, 63, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (9, 111, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (172, 177, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (42, 166, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (67, 115, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (14, 77, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (175, 178, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (176, 41, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (25, 193, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (86, 32, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (48, 97, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (72, 67, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (177, 90, 7);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (107, 46, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (72, 3, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (167, 194, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (170, 27, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (48, 196, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (106, 126, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (11, 113, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (112, 76, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (142, 188, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (177, 181, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (112, 52, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (193, 72, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (154, 187, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (53, 123, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (114, 14, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (51, 48, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (37, 113, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (130, 118, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (163, 126, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (62, 174, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (42, 77, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (118, 15, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (110, 54, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (189, 160, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (125, 189, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (14, 125, 6);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (168, 54, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (115, 94, 23);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (123, 135, 23);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (33, 53, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (7, 49, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (87, 119, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (170, 146, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (153, 67, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (147, 86, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (52, 147, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (168, 2, 8);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (119, 139, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (140, 111, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (20, 67, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (78, 137, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (26, 3, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (113, 164, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (28, 29, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (38, 166, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (97, 1, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (187, 37, 8);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (120, 1, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (48, 54, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (104, 42, 8);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (33, 85, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (45, 12, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (146, 152, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (198, 61, 23);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (187, 60, 23);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (99, 6, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (114, 167, 8);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (124, 71, 18);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (161, 91, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (42, 14, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (170, 44, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (62, 191, 7);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (174, 36, 13);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (130, 104, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (61, 73, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (162, 8, 8);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (84, 134, 22);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (93, 132, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (97, 81, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (40, 161, 9);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (41, 118, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (90, 156, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (109, 101, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (54, 1, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (93, 183, 10);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (4, 87, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (185, 45, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (35, 9, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (6, 132, 7);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (53, 172, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (166, 89, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (71, 41, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (190, 135, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (114, 116, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (84, 16, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (130, 52, 24);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (117, 30, 7);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (5, 60, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (14, 72, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (88, 123, 23);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (119, 154, 11);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (65, 163, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (171, 128, 17);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (100, 99, 15);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (13, 10, 14);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (123, 45, 16);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (78, 74, 20);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (168, 11, 23);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (100, 32, 21);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (185, 30, 19);
insert into CHITIETHOPDONG (MaHD, MaPHG, ThoiGianThue) values (47, 92, 15);

