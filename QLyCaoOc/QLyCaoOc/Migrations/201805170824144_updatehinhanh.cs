namespace QLyCaoOc.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class updatehinhanh : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CHITIETHOPDONG",
                c => new
                    {
                        MaHD = c.String(nullable: false, maxLength: 5, unicode: false),
                        MaPHG = c.String(nullable: false, maxLength: 5, unicode: false),
                        ThoiGianThue = c.Int(),
                    })
                .PrimaryKey(t => new { t.MaHD, t.MaPHG })
                .ForeignKey("dbo.HOPDONG", t => t.MaHD)
                .ForeignKey("dbo.PHONG", t => t.MaPHG)
                .Index(t => t.MaHD)
                .Index(t => t.MaPHG);
            
            CreateTable(
                "dbo.HOPDONG",
                c => new
                    {
                        MaHD = c.String(nullable: false, maxLength: 5, unicode: false),
                        NgayLap = c.DateTime(),
                        TienCoc = c.Int(),
                    })
                .PrimaryKey(t => t.MaHD);
            
            CreateTable(
                "dbo.CONGTY",
                c => new
                    {
                        MaCongTy = c.String(nullable: false, maxLength: 5, unicode: false),
                        TenCT = c.String(maxLength: 50),
                        DiaChiCT = c.String(maxLength: 50),
                        SDT = c.String(maxLength: 12),
                        MaHD = c.String(nullable: false, maxLength: 5, unicode: false),
                    })
                .PrimaryKey(t => t.MaCongTy)
                .ForeignKey("dbo.HOPDONG", t => t.MaHD)
                .Index(t => t.MaHD);
            
            CreateTable(
                "dbo.NHANVIEN",
                c => new
                    {
                        MaNV = c.String(nullable: false, maxLength: 5, unicode: false),
                        TenNV = c.String(maxLength: 50),
                        DiaChiNV = c.String(maxLength: 50),
                        SDTNV = c.String(maxLength: 10),
                        HinhAnh = c.String(maxLength: 50, unicode: false),
                        ChucVu = c.String(maxLength: 30),
                        MaCongTy = c.String(nullable: false, maxLength: 5, unicode: false),
                        MaPHG = c.String(nullable: false, maxLength: 5, unicode: false),
                    })
                .PrimaryKey(t => t.MaNV)
                .ForeignKey("dbo.PHONG", t => t.MaPHG)
                .ForeignKey("dbo.CONGTY", t => t.MaCongTy)
                .Index(t => t.MaCongTy)
                .Index(t => t.MaPHG);
            
            CreateTable(
                "dbo.PHONG",
                c => new
                    {
                        MaPHG = c.String(nullable: false, maxLength: 5, unicode: false),
                        TenPHG = c.String(maxLength: 50),
                        Tang = c.Int(nullable: false),
                        DienTich = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.MaPHG)
                .ForeignKey("dbo.TANG", t => new { t.Tang, t.DienTich })
                .Index(t => new { t.Tang, t.DienTich });
            
            CreateTable(
                "dbo.TANG",
                c => new
                    {
                        Tang = c.Int(nullable: false),
                        DienTich = c.Int(nullable: false),
                        Gia = c.String(nullable: false, maxLength: 10, fixedLength: true),
                    })
                .PrimaryKey(t => new { t.Tang, t.DienTich });
            
            CreateTable(
                "dbo.PHIEUGIAHAN",
                c => new
                    {
                        MaPhieuGiaHan = c.String(nullable: false, maxLength: 5, unicode: false),
                        NgayGiaHan = c.DateTime(),
                        NgayHetHan = c.DateTime(),
                        MaHD = c.String(maxLength: 5, unicode: false),
                        MaPHG = c.String(maxLength: 5, unicode: false),
                    })
                .PrimaryKey(t => t.MaPhieuGiaHan)
                .ForeignKey("dbo.CHITIETHOPDONG", t => new { t.MaHD, t.MaPHG })
                .Index(t => new { t.MaHD, t.MaPHG });
            
            CreateTable(
                "dbo.TAIKHOAN",
                c => new
                    {
                        MaTK = c.String(nullable: false, maxLength: 5, unicode: false),
                        TenDN = c.String(maxLength: 50, unicode: false),
                        MatKhau = c.String(maxLength: 30, unicode: false),
                    })
                .PrimaryKey(t => t.MaTK);
            
            CreateTable(
                "dbo.THAMSO",
                c => new
                    {
                        MaTS = c.String(nullable: false, maxLength: 5, unicode: false),
                        TenTS = c.String(maxLength: 50),
                        GiaTriTS = c.Int(),
                    })
                .PrimaryKey(t => t.MaTS);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.PHIEUGIAHAN", new[] { "MaHD", "MaPHG" }, "dbo.CHITIETHOPDONG");
            DropForeignKey("dbo.CONGTY", "MaHD", "dbo.HOPDONG");
            DropForeignKey("dbo.NHANVIEN", "MaCongTy", "dbo.CONGTY");
            DropForeignKey("dbo.PHONG", new[] { "Tang", "DienTich" }, "dbo.TANG");
            DropForeignKey("dbo.NHANVIEN", "MaPHG", "dbo.PHONG");
            DropForeignKey("dbo.CHITIETHOPDONG", "MaPHG", "dbo.PHONG");
            DropForeignKey("dbo.CHITIETHOPDONG", "MaHD", "dbo.HOPDONG");
            DropIndex("dbo.PHIEUGIAHAN", new[] { "MaHD", "MaPHG" });
            DropIndex("dbo.PHONG", new[] { "Tang", "DienTich" });
            DropIndex("dbo.NHANVIEN", new[] { "MaPHG" });
            DropIndex("dbo.NHANVIEN", new[] { "MaCongTy" });
            DropIndex("dbo.CONGTY", new[] { "MaHD" });
            DropIndex("dbo.CHITIETHOPDONG", new[] { "MaPHG" });
            DropIndex("dbo.CHITIETHOPDONG", new[] { "MaHD" });
            DropTable("dbo.THAMSO");
            DropTable("dbo.TAIKHOAN");
            DropTable("dbo.PHIEUGIAHAN");
            DropTable("dbo.TANG");
            DropTable("dbo.PHONG");
            DropTable("dbo.NHANVIEN");
            DropTable("dbo.CONGTY");
            DropTable("dbo.HOPDONG");
            DropTable("dbo.CHITIETHOPDONG");
        }
    }
}
