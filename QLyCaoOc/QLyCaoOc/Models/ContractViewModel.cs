using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QLyCaoOc.Models
{
    public class ContractViewModel
    {
        public CHITIETHOPDONG cthd { get; set; }
        public TANG tang { get; set; }
        public HOPDONG hd { get; set; }
        
    }
    public class HopDong
    {
        public string MaHD { get; set; }
        public DateTime NgayLap { get; set; }
        public int TienCoc { get; set; }
        public string MaPHG { get; set; }
        public string TenPHG { get; set; }
        public int Tang { get; set; }
        public int DienTich { get; set; }
        public int Gia { get; set; }
        public int ThoiGianThue { get; set; }
    }
}