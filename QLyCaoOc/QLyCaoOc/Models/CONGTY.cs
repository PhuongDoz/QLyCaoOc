namespace QLyCaoOc.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CONGTY")]
    public partial class CONGTY
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public CONGTY()
        {
            NHANVIENs = new HashSet<NHANVIEN>();
        }

        [Key]
        [StringLength(5)]
        public string MaCongTy { get; set; }

        [StringLength(50)]
        public string TenCT { get; set; }

        [StringLength(50)]
        public string DiaChiCT { get; set; }

        [StringLength(12)]
        public string SDT { get; set; }

        [Required]
        [StringLength(5)]
        public string MaHD { get; set; }

        public virtual HOPDONG HOPDONG { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<NHANVIEN> NHANVIENs { get; set; }
    }
}
