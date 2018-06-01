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
        public int MaPhieuGiaHan { get; set; }

        public DateTime? NgayGiaHan { get; set; }

        public DateTime? NgayHetHan { get; set; }

        public int MaHD { get; set; }

        public int MaPHG { get; set; }

        public virtual CHITIETHOPDONG CHITIETHOPDONG { get; set; }
    }
}
