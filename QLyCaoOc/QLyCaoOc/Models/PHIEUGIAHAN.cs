namespace QLyCaoOc.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PHIEUGIAHAN")]
    public partial class PHIEUGIAHAN
    {
        [Key]
        [StringLength(5)]
        public string MaPhieuGiaHan { get; set; }

        public DateTime? NgayGiaHan { get; set; }

        public DateTime? NgayHetHan { get; set; }

        [StringLength(5)]
        public string MaHD { get; set; }

        [StringLength(5)]
        public string MaPHG { get; set; }

        public virtual CHITIETHOPDONG CHITIETHOPDONG { get; set; }
    }
}
