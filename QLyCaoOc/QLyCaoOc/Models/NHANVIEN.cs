namespace QLyCaoOc.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NHANVIEN")]
    public partial class NHANVIEN
    {
        [Key]
        [StringLength(5)]
        public string MaNV { get; set; }

        [StringLength(50)]
        public string TenNV { get; set; }

        [StringLength(50)]
        public string DiaChiNV { get; set; }

        [StringLength(10)]
        public string SDTNV { get; set; }

        [Required]
        [StringLength(50)]
        public string HinhAnh { get; set; }

        [StringLength(30)]
        public string ChucVu { get; set; }

        [StringLength(5)]
        public string MaCongTy { get; set; }

        [Required]
        [StringLength(5)]
        public string MaPHG { get; set; }

        public virtual CONGTY CONGTY { get; set; }

        public virtual PHONG PHONG { get; set; }
    }
}
