using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using QLyCaoOc.Models;



namespace QLyCaoOc.Controllers
{
    public class ContractController : Controller
    {
        dbQLyCaoOc db = new dbQLyCaoOc();

        // GET: Building
        private List<CHITIETHOPDONG> ListThongTinHopDong(int count)
        {
            return db.CHITIETHOPDONGs.OrderByDescending(a => a.MaHD).Take(count).ToList();
        }
        private List<HOPDONG> ListHopDong(int count)
        {
            return db.HOPDONGs.OrderByDescending(a => a.NgayLap).Take(count).ToList();
        }
        public ActionResult Index()
        {

            var hopdongmoi = ListHopDong(200);
            return View(hopdongmoi);
        }
        public ActionResult ContractViewModel()
        {
            var listcontract = (from h in db.HOPDONGs
                                join cth in db.CHITIETHOPDONGs on h.MaHD equals cth.MaHD
                                join p in db.PHONGs on cth.MaPHG equals p.MaPHG
                                join t in db.TANGs on p.Tang equals t.Tang1
                                select new { h.MaHD, cth.MaPHG, p.Tang, p.DienTich, t.Gia });
            return View(listcontract.ToList());
        }
        public ActionResult Thongtinhopdong()
        {
            var hopdongmoi = ListThongTinHopDong(200);
            return View(hopdongmoi);
        }
        public ActionResult Suathongtinhopdong(int id1, int id2)
        {

            CHITIETHOPDONG cthopdong = db.CHITIETHOPDONGs.Find(id1, id2);

            if (cthopdong == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            ViewBag.MaPHG = new SelectList(db.CHITIETHOPDONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG", "MaPHG");

            ViewBag.ThoiGianThue = new SelectList(db.CHITIETHOPDONGs.ToList().OrderBy(n => n.ThoiGianThue), "ThoiGianThue", "ThoiGianThue");

            return View(cthopdong);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suathongtinhopdong(CHITIETHOPDONG cthopdong, int id1, int id2)
        {
            ViewBag.MaPHG = new SelectList(db.CHITIETHOPDONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG", "MaPHG");

            ViewBag.ThoiGianThue = new SelectList(db.CHITIETHOPDONGs.ToList().OrderBy(n => n.ThoiGianThue), "ThoiGianThue", "ThoiGianThue");


            if (ModelState.IsValid)
            {

                CHITIETHOPDONG cthd = db.CHITIETHOPDONGs.Find(id1, id2);
                cthd.MaPHG = cthopdong.MaPHG;
                cthd.ThoiGianThue = cthopdong.ThoiGianThue;
                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }

        public ActionResult BaoCaohopdong()
        {
            return View();
        }
      
        [HttpGet]
        public ActionResult Themhopdong()
        {


            ViewBag.MaPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG", "MaPHG");
            ViewBag.ThoiGianThue = new SelectList(db.CHITIETHOPDONGs, "ThoiGianThue");
            ViewBag.MaCongTy = new SelectList(db.CONGTies.ToList().OrderBy(n => n.MaCongTy), "MaCongTy", "TenCT");
            ViewBag.TenNV = new SelectList(db.NHANVIENs.ToList().OrderBy(n => n.TenNV), "TenNV", "TenNV");
            ViewBag.DiaChiNV = new SelectList(db.NHANVIENs.ToList().OrderBy(n => n.DiaChiNV), "DiaChiNV", "DiaChiNV");
            ViewBag.SDTNV = new SelectList(db.NHANVIENs.ToList().OrderBy(n => n.SDTNV), "SDTNV", "SDTNV");
            ViewBag.ChucVu = new SelectList(db.NHANVIENs.ToList().OrderBy(n => n.ChucVu), "ChucVu", "ChucVu");
            return View();

        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themhopdong(FormCollection collection, ContractViewModel model)
        {
            ViewBag.MaPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG");

            ViewBag.ThoiGianThue = new SelectList(db.CHITIETHOPDONGs, "ThoiGianThue");
            ViewBag.MaCongTy = new SelectList(db.CONGTies.ToList().OrderBy(n => n.MaCongTy), "MaCongTy", "TenCT");
            ViewBag.TenNV = new SelectList(db.NHANVIENs.ToList().OrderBy(n => n.TenNV), "TenNV", "TenNV");
            ViewBag.DiaChiNV = new SelectList(db.NHANVIENs.ToList().OrderBy(n => n.DiaChiNV), "DiaChiNV", "DiaChiNV");
            ViewBag.SDTNV = new SelectList(db.NHANVIENs.ToList().OrderBy(n => n.SDTNV), "SDTNV", "SDTNV");
            ViewBag.ChucVu = new SelectList(db.NHANVIENs.ToList().OrderBy(n => n.ChucVu), "ChucVu", "ChucVu");



            var NgayLap = collection["NgayLap"];
            var TienCoc = collection["TienCoc"];
            var ThoiGianThue = collection["ThoiGianThue"];
            var MaPHG = collection["MaPHG"];
            var MaCongTy = collection["MaCongTy"];
            var TenNV = collection["TenNV"];
            var DiaChiNV = collection["DiaChiNV"];
            var SDTNV = collection["SDTNV"];
            var ChucVu = collection["ChucVu"];

            if (String.IsNullOrEmpty(NgayLap))
            {
                ViewData["Loi1"] = "Ngày lập không được bỏ trống!";
            }
            else if (String.IsNullOrEmpty(TienCoc))
            {
                ViewData["Loi2"] = "Tiền cọc không đucợ bỏ trống!";
            }
            else if (String.IsNullOrEmpty(ThoiGianThue))
            {
                ViewData["Loi3"] = "Thời gian thuê không được bỏ trống!";
            }
            else if (String.IsNullOrEmpty(MaPHG))
            {
                ViewData["Loi4"] = "Mã phòng không được bỏ trống!";
            }
            else if (String.IsNullOrEmpty(MaCongTy))
            {
                ViewData["Loi5"] = "Mã công ty không được bỏ trống!";
            }
            else if (String.IsNullOrEmpty(TenNV))
            {
                ViewData["Loi6"] = "Tên khách hàng không được bỏ trống!";
            }
            else if (String.IsNullOrEmpty(DiaChiNV))
            {
                ViewData["Loi7"] = "Địa chỉ khách hàng không được bỏ trống!";
            }
            else if (String.IsNullOrEmpty(SDTNV))
            {
                ViewData["Loi8"] = "SĐT khách hàng không được bỏ trống!";
            }
            else if (String.IsNullOrEmpty(ChucVu))
            {
                ViewData["Loi9"] = "Chức vụ không được bỏ trống!";
            }



            HOPDONG hopdong = new HOPDONG();
            hopdong.MaHD = model.MaHD;
            hopdong.NgayLap = model.NgayLap;
            hopdong.TienCoc = model.TienCoc;
            hopdong.MaCongTy = model.MaCongTy;
            db.HOPDONGs.Add(hopdong);

            int mahd = hopdong.MaHD;

            CHITIETHOPDONG cthd = new CHITIETHOPDONG();
            cthd.MaHD = model.MaHD;
            cthd.MaPHG = model.MaPHG;
            cthd.ThoiGianThue = model.ThoiGianThue;
            db.CHITIETHOPDONGs.Add(cthd);

            NHANVIEN nv = new NHANVIEN();
            nv.MaPHG = model.MaPHG;
            nv.MaCongTy = model.MaCongTy;
            nv.TenNV = model.TenNV;
            nv.DiaChiNV = model.DiaChiNV;
            nv.SDTNV = model.SDTNV;
            nv.ChucVu = model.ChucVu;
            db.NHANVIENs.Add(nv);

            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Chitiethopdong(int id, int id2)
        {
            HOPDONG hopdong = db.HOPDONGs.SingleOrDefault(n => n.MaHD == id);
            CHITIETHOPDONG cthopdong = db.CHITIETHOPDONGs.SingleOrDefault(n => n.MaHD == id);
            PHONG phong = db.PHONGs.SingleOrDefault(n => n.MaPHG == id);
            CONGTY cty = db.CONGTies.SingleOrDefault(n => n.MaCongTy == id2);


            ViewBag.MaHD = hopdong.MaHD;
            ViewBag.MaPHG = cthopdong.MaPHG;
            ViewBag.TenPHG = phong.TenPHG;
            ViewBag.Tang = phong.Tang;
            ViewBag.DienTich = phong.DienTich;
            ViewBag.ThoiGianThue = cthopdong.ThoiGianThue;

            ViewBag.MaCongTy = cty.MaCongTy;
            ViewBag.TenCT = cty.TenCT;

            if (hopdong == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(hopdong);
        }

        public ActionResult Xoahopdong(int id)
        {
            HOPDONG hopdong = db.HOPDONGs.SingleOrDefault(n => n.MaHD == id);
            CHITIETHOPDONG cthopdong = db.CHITIETHOPDONGs.SingleOrDefault(n => n.MaHD == id);


            ViewBag.MaHD = hopdong.MaHD;
            ViewBag.MaPHG = cthopdong.MaPHG;
            ViewBag.ThoiGianThue = cthopdong.ThoiGianThue;

            if (hopdong == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(hopdong);

        }
        [HttpPost, ActionName("Xoahopdong")]
        public ActionResult Xacnhanxoa(int id)
        {

            HOPDONG hopdong = db.HOPDONGs.SingleOrDefault(n => n.MaHD == id);
            CHITIETHOPDONG cthopdong = db.CHITIETHOPDONGs.SingleOrDefault(n => n.MaHD == id);


            ViewBag.MaHD = hopdong.MaHD;
            ViewBag.MaPHG = cthopdong.MaPHG;
            ViewBag.ThoiGianThue = cthopdong.ThoiGianThue;
            if (hopdong == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.HOPDONGs.Remove(hopdong);
            db.CHITIETHOPDONGs.Remove(cthopdong);


            db.SaveChanges();

            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Suahopdong(int id)
        {

            HOPDONG hopdong = db.HOPDONGs.SingleOrDefault(n => n.MaHD == id);

            if (hopdong == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            ViewBag.NgayLap = new SelectList(db.HOPDONGs.ToList().OrderBy(n => n.NgayLap), "NgayLap", "NgayLap");

            ViewBag.TienCoc = new SelectList(db.HOPDONGs.ToList().OrderBy(n => n.TienCoc), "TienCoc", "TienCoc");

            return View(hopdong);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suahopdong(HOPDONG hopdong)
        {
            ViewBag.NgayLap = new SelectList(db.HOPDONGs.ToList().OrderBy(n => n.NgayLap), "NgayLap", "NgayLap");

            ViewBag.TienCoc = new SelectList(db.HOPDONGs.ToList().OrderBy(n => n.TienCoc), "TienCoc", "TienCoc");

            if (ModelState.IsValid)
            {

                HOPDONG hd = db.HOPDONGs.Where(x => x.MaHD == hopdong.MaHD).Single<HOPDONG>();
                hd.NgayLap = hopdong.NgayLap;
                hd.TienCoc = hopdong.TienCoc;
                db.SaveChanges();
            }

            return RedirectToAction("Index");
        }
        public JsonResult GetID(int id)
        {
            db.Configuration.ProxyCreationEnabled = false;
            List<PHONG> listphg = db.PHONGs.Where(x => x.MaPHG == id).ToList();
            return Json(listphg, JsonRequestBehavior.AllowGet);
        }

    }
}
