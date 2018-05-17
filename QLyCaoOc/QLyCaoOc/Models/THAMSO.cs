namespace QLyCaoOc.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("THAMSO")]
    public partial class THAMSO
    {
        [Key]
        public int MaTS { get; set; }

        [StringLength(50)]
        public string TenTS { get; set; }

        public int? GiaTriTS { get; set; }
    }
}
