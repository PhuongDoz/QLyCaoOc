using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLyCaoOc.Models
{
    public class ContractViewModel
    {
        public int MaHD { get; set; }
        public DateTime NgayLap { get; set; }
        public int TienCoc { get; set; }
        public int ThoiGianThue { get; set; }
        public int MaPHG { get; set; }
        public int MaCongTy { get; set; }
        public string TenNV { get; set; }
        public string DiaChiNV { get; set; }
        public string SDTNV { get; set; }
        public string ChucVu { get; set; }
        public string HinhAnh { get; set; }
    }
}