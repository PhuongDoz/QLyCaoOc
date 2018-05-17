namespace QLyCaoOc.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class dbQLyCaoOc : DbContext
    {
        public dbQLyCaoOc()
            : base("name=dbQLyCaoOc")
        {
        }

        public virtual DbSet<CHITIETHOPDONG> CHITIETHOPDONGs { get; set; }
        public virtual DbSet<CONGTY> CONGTies { get; set; }
        public virtual DbSet<HOPDONG> HOPDONGs { get; set; }
        public virtual DbSet<NHANVIEN> NHANVIENs { get; set; }
        public virtual DbSet<PHIEUGIAHAN> PHIEUGIAHANs { get; set; }
        public virtual DbSet<PHONG> PHONGs { get; set; }
        public virtual DbSet<TANG> TANGs { get; set; }
        public virtual DbSet<THAMSO> THAMSOes { get; set; }
        public virtual DbSet<TAIKHOAN> TAIKHOANs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CHITIETHOPDONG>()
                .Property(e => e.MaHD)
                .IsUnicode(false);

            modelBuilder.Entity<CHITIETHOPDONG>()
                .Property(e => e.MaPHG)
                .IsUnicode(false);

            modelBuilder.Entity<CHITIETHOPDONG>()
                .HasMany(e => e.PHIEUGIAHANs)
                .WithOptional(e => e.CHITIETHOPDONG)
                .HasForeignKey(e => new { e.MaHD, e.MaPHG });

            modelBuilder.Entity<CONGTY>()
                .Property(e => e.MaCongTy)
                .IsUnicode(false);

            modelBuilder.Entity<CONGTY>()
                .Property(e => e.MaHD)
                .IsUnicode(false);

            modelBuilder.Entity<CONGTY>()
                .HasMany(e => e.NHANVIENs)
                .WithRequired(e => e.CONGTY)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HOPDONG>()
                .Property(e => e.MaHD)
                .IsUnicode(false);

            modelBuilder.Entity<HOPDONG>()
                .HasMany(e => e.CHITIETHOPDONGs)
                .WithRequired(e => e.HOPDONG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HOPDONG>()
                .HasMany(e => e.CONGTies)
                .WithRequired(e => e.HOPDONG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NHANVIEN>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<NHANVIEN>()
                .Property(e => e.HinhAnh)
                .IsUnicode(false);

            modelBuilder.Entity<NHANVIEN>()
                .Property(e => e.MaCongTy)
                .IsUnicode(false);

            modelBuilder.Entity<NHANVIEN>()
                .Property(e => e.MaPHG)
                .IsUnicode(false);

            modelBuilder.Entity<PHIEUGIAHAN>()
                .Property(e => e.MaPhieuGiaHan)
                .IsUnicode(false);

            modelBuilder.Entity<PHIEUGIAHAN>()
                .Property(e => e.MaHD)
                .IsUnicode(false);

            modelBuilder.Entity<PHIEUGIAHAN>()
                .Property(e => e.MaPHG)
                .IsUnicode(false);

            modelBuilder.Entity<PHONG>()
                .Property(e => e.MaPHG)
                .IsUnicode(false);

            modelBuilder.Entity<PHONG>()
                .HasMany(e => e.CHITIETHOPDONGs)
                .WithRequired(e => e.PHONG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PHONG>()
                .HasMany(e => e.NHANVIENs)
                .WithRequired(e => e.PHONG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TANG>()
                .Property(e => e.Gia)
                .IsFixedLength();

            modelBuilder.Entity<TANG>()
                .HasMany(e => e.PHONGs)
                .WithRequired(e => e.TANG1)
                .HasForeignKey(e => new { e.Tang, e.DienTich })
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<THAMSO>()
                .Property(e => e.MaTS)
                .IsUnicode(false);

            modelBuilder.Entity<TAIKHOAN>()
                .Property(e => e.MaTK)
                .IsUnicode(false);

            modelBuilder.Entity<TAIKHOAN>()
                .Property(e => e.TenDN)
                .IsUnicode(false);

            modelBuilder.Entity<TAIKHOAN>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);
        }
    }
}
