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
                .HasMany(e => e.PHIEUGIAHANs)
                .WithRequired(e => e.CHITIETHOPDONG)
                .HasForeignKey(e => new { e.MaHD, e.MaPHG })
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CONGTY>()
                .HasMany(e => e.HOPDONGs)
                .WithRequired(e => e.CONGTY)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<HOPDONG>()
                .HasMany(e => e.CHITIETHOPDONGs)
                .WithRequired(e => e.HOPDONG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NHANVIEN>()
                .Property(e => e.HinhAnh)
                .IsUnicode(false);

            modelBuilder.Entity<PHONG>()
                .HasMany(e => e.CHITIETHOPDONGs)
                .WithRequired(e => e.PHONG)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TANG>()
                .HasMany(e => e.PHONGs)
                .WithRequired(e => e.TANG1)
                .HasForeignKey(e => new { e.Tang, e.DienTich })
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TAIKHOAN>()
                .Property(e => e.TenDN)
                .IsUnicode(false);

            modelBuilder.Entity<TAIKHOAN>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);
        }
    }
}
