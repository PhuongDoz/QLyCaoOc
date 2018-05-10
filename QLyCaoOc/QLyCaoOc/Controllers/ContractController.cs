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
        dbQLyCaoOcDataContext db = new dbQLyCaoOcDataContext();
        // GET: Building
        private List<HOPDONG> ListHopDong(int count)
        {
            return db.HOPDONGs.OrderByDescending(a => a.NgayLap).Take(count).ToList();
        }
        public ActionResult Index()
        {
          
            var hopdongmoi =  ListHopDong(200);
            return View(hopdongmoi);
        }
        [HttpGet]
        public ActionResult Themhopdong()
        {

            ViewBag.DienTich = new SelectList(db.PHONGs.ToList().OrderBy(n => n.DienTich), "DienTich");
            ViewBag.Tang = new SelectList(db.PHONGs.ToList().OrderBy(n => n.Tang), "Tang");
            ViewBag.MaPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG");
            ViewBag.TenPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "TenPHG");
            ViewBag.ThoiGianThue = new SelectList(db.CHITIETHOPDONGs.ToList().OrderBy(n => n.ThoiGianThue), "ThoiGianThue");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themhopdong(HOPDONG hopdong,CHITIETHOPDONG cthopdong,PHONG phong, CONGTY cty )
        {
            ViewBag.DienTich = new SelectList(db.PHONGs.ToList().OrderBy(n => n.DienTich), "DienTich");
            ViewBag.Tang = new SelectList(db.PHONGs.ToList().OrderBy(n => n.Tang), "Tang");
            ViewBag.MaPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG),"MaPHG");
            ViewBag.TenPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG),"TenPHG");
            ViewBag.ThoiGianThue = new SelectList(db.CHITIETHOPDONGs.ToList().OrderBy(n => n.ThoiGianThue), "ThoiGianThue");
            db.HOPDONGs.InsertOnSubmit(hopdong);
            db.CHITIETHOPDONGs.InsertOnSubmit(cthopdong);
            db.PHONGs.InsertOnSubmit(phong);
            db.CONGTies.InsertOnSubmit(cty);
            db.SubmitChanges();
            return RedirectToAction("Index");

        }
        public ActionResult Chitiethopdong(string id)
        {
            HOPDONG hopdong = db.HOPDONGs.SingleOrDefault(n => n.MaHD == id);
            CHITIETHOPDONG cthopdong = db.CHITIETHOPDONGs.SingleOrDefault(n => n.MaHD == id);
            PHONG phong = db.PHONGs.SingleOrDefault(n => n.MaPHG == id);
            CONGTY cty = db.CONGTies.SingleOrDefault(n => n.MaHD == id);
           
            ViewBag.MaHD = hopdong.MaHD;
            ViewBag.MaPHG = cthopdong.MaPHG;
            ViewBag.TenPHG = phong.TenPHG;
            ViewBag.Tang = phong.Tang;
            ViewBag.DienTich = phong.DienTich;
            ViewBag.ThoiGianThue = cthopdong.ThoiGianThue;

            ViewBag.MaCongTy = cty.MaCongTy;
            ViewBag.TenCT = cty.TenCT;
            ViewBag.SDT = cty.SDT;
            ViewBag.DiaChiCT = cty.DiaChiCT;
            if (hopdong == null)
            {
                Response.StatusCode = 404;
                return null;
            }
           
            return View(hopdong);
        }
        public ActionResult Xoahopdong(string id)
        {
            HOPDONG hopdong = db.HOPDONGs.SingleOrDefault(n => n.MaHD == id);
            CHITIETHOPDONG cthopdong = db.CHITIETHOPDONGs.SingleOrDefault(n => n.MaHD == id);
            PHONG phong = db.PHONGs.SingleOrDefault(n => n.MaPHG == id);
            CONGTY cty = db.CONGTies.SingleOrDefault(n => n.MaHD == id);

            ViewBag.MaHD = hopdong.MaHD;
            ViewBag.MaPHG = cthopdong.MaPHG;
            ViewBag.TenPHG = phong.TenPHG;
            ViewBag.Tang = phong.Tang;
            ViewBag.DienTich = phong.DienTich;
            ViewBag.ThoiGianThue = cthopdong.ThoiGianThue;

            ViewBag.MaCongTy = cty.MaCongTy;
            ViewBag.TenCT = cty.TenCT;
            ViewBag.SDT = cty.SDT;
            ViewBag.DiaChiCT = cty.DiaChiCT;

        
            if (hopdong == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(hopdong);

        }
        [HttpPost, ActionName("Xoahopdong")]
        public ActionResult Xacnhanxoa(string id)
        {
            HOPDONG hopdong = db.HOPDONGs.SingleOrDefault(n => n.MaHD== id);
            CHITIETHOPDONG cthopdong = db.CHITIETHOPDONGs.SingleOrDefault(n => n.MaHD == id);
            PHONG phong = db.PHONGs.SingleOrDefault(n => n.MaPHG == id);
            CONGTY cty = db.CONGTies.SingleOrDefault(n => n.MaHD == id);
            ViewBag.MaHD= hopdong.MaHD;
            if (hopdong == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.HOPDONGs.DeleteOnSubmit(hopdong);
            db.CHITIETHOPDONGs.DeleteOnSubmit(cthopdong);
            db.PHONGs.DeleteOnSubmit(phong);
            db.CONGTies.DeleteOnSubmit(cty);
            db.SubmitChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Suahopdong(string id)
        {
            HOPDONG hopdong = db.HOPDONGs.SingleOrDefault(n => n.MaHD == id);
           
     
            if (hopdong == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.DienTich = new SelectList(db.PHONGs.ToList().OrderBy(n => n.DienTich), "DienTich");
            ViewBag.Tang = new SelectList(db.PHONGs.ToList().OrderBy(n => n.Tang), "Tang");
            ViewBag.MaPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG");
            ViewBag.TenPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "TenPHG");
            ViewBag.ThoiGianThue = new SelectList(db.CHITIETHOPDONGs.ToList().OrderBy(n => n.ThoiGianThue), "ThoiGianThue");
            return View(hopdong);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suahopdong(HOPDONG hopdong, CHITIETHOPDONG cthopdong, PHONG phong, CONGTY congty)
        {
            ViewBag.DienTich = new SelectList(db.PHONGs.ToList().OrderBy(n => n.DienTich), "DienTich");
            ViewBag.Tang = new SelectList(db.PHONGs.ToList().OrderBy(n => n.Tang), "Tang");
            ViewBag.MaPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG");
            ViewBag.TenPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "TenPHG");
            ViewBag.ThoiGianThue = new SelectList(db.CHITIETHOPDONGs.ToList().OrderBy(n => n.ThoiGianThue), "ThoiGianThue");
            if (ModelState.IsValid)
            {
                HOPDONG hd = db.HOPDONGs.Where(x => x.MaHD == hopdong.MaHD).Single<HOPDONG>();
                hd.NgayLap = hopdong.NgayLap;
                hd.TienCoc = hopdong.TienCoc;
                CHITIETHOPDONG cthd = db.CHITIETHOPDONGs.Where(x => x.MaHD == cthopdong.MaHD).Single<CHITIETHOPDONG>();
                cthd.MaPHG = cthopdong.MaPHG;
                cthd.ThoiGianThue = cthopdong.ThoiGianThue;
                PHONG phg = db.PHONGs.Where(x => x.MaPHG == phong.MaPHG).Single<PHONG>();

                phg.TenPHG = phong.TenPHG;
                phg.Tang = phong.Tang;
                phg.DienTich = phong.DienTich;
                CONGTY cty = db.CONGTies.Where(x => x.MaCongTy == congty.MaCongTy).Single<CONGTY>();
                cty.TenCT = congty.TenCT;
                cty.DiaChiCT = congty.DiaChiCT;
                cty.SDT = congty.SDT;
                cty.TenCT = congty.TenCT;

                db.SubmitChanges();
            }
                
                return RedirectToAction("Index");
        }
    }
}
