namespace QLyCaoOc.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TAIKHOAN")]
    public partial class TAIKHOAN
    {
        [Key]
        public int MaTK { get; set; }

        [StringLength(50)]
        public string TenDN { get; set; }

        [StringLength(30)]
        public string MatKhau { get; set; }
    }
}
