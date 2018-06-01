using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLyCaoOc.Models;

namespace QLyCaoOc.Controllers
{
    public class RoomController : Controller
    {

        dbQLyCaoOc db = new dbQLyCaoOc();
        // GET: Building
        public List<PHONG> layphong(int count)
        {
            return db.PHONGs.OrderByDescending(a => a.MaPHG).Take(count).ToList();
            //var phg = (from s in db.PHONGs
            //          orderby s.MaPHG descending
            //          select s).ToList();
            //return phg;
        }
        public ActionResult Index()
        {
            var phg = layphong(200);
            return View(phg.ToList());
        }

        [HttpGet]
        public ActionResult Themphong()
        {
            ViewBag.Tang = new SelectList(db.TANGs.ToList().OrderBy(n => n.Tang1), "Tang1","Tang1");
            ViewBag.DienTich = new SelectList(db.TANGs.ToList().OrderBy(n => n.DienTich), "DienTich", "DienTich");
            ViewBag.Gia = new SelectList(db.TANGs.ToList().OrderBy(n => n.Gia), "Gia", "Gia");
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themphong(FormCollection collection, PHONG phg)
        {
            ViewBag.Tang = new SelectList(db.TANGs.ToList().OrderBy(n => n.Tang1), "Tang1", "Tang1");
            ViewBag.DienTich = new SelectList(db.TANGs.ToList().OrderBy(n => n.DienTich), "DienTich", "DienTich");
            ViewBag.Gia = new SelectList(db.TANGs.ToList().OrderBy(n => n.Gia), "Gia", "Gia");
            var MaPhong = collection["MaPHG"];
            var TenPhong = collection["TenPHG"];
            var Tang = collection["Tang"];
            var DienTich = collection["DienTich"];
            var Gia = collection["Gia"];
            if (String.IsNullOrEmpty(TenPhong))
            {
                ViewData["Loi1"] = "Tên phòng không được để trống";
            }
            else
            {
                phg.MaPHG = Convert.ToInt32(MaPhong);
                phg.TenPHG = TenPhong;
                phg.Tang = Convert.ToInt32(Tang);
                phg.DienTich = Convert.ToInt32(DienTich);
                db.PHONGs.Add(phg);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return this.Themphong();
        }

        public ActionResult Xoaphong(int id)
        {
            PHONG phg = db.PHONGs.SingleOrDefault(n => n.MaPHG == id);
              if (phg == null)
            {
                Response.StatusCode = 404;
                return null;
            }
              return View(phg);
        }

        [HttpPost, ActionName("Xoaphong")]
        public ActionResult Xacnhanxoa(int id)
        {
            PHONG phg = db.PHONGs.SingleOrDefault(n => n.MaPHG == id);
            ViewBag.MaPHG = phg.MaPHG;
            if (phg == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.PHONGs.Remove(phg);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult Chitietphong(int id)
        {

            PHONG phg = db.PHONGs.SingleOrDefault(n => n.MaPHG == id);
            ViewBag.MaPHG = phg.MaPHG;
            if (phg == null)
            {
                Response.StatusCode = 404;
            }
            return View(phg);
        }

        [HttpGet]
        public ActionResult Suaphong(int id)
        {
            PHONG phg = db.PHONGs.SingleOrDefault(n => n.MaPHG == id);
            if (phg == null)
            {
                Response.StatusCode = 404;
            }
            ViewBag.Tang = new SelectList(db.TANGs.ToList().OrderBy(n => n.Tang1), "Tang1", "Tang1");
            ViewBag.DienTich = new SelectList(db.TANGs.ToList().OrderBy(n => n.DienTich), "DienTich", "DienTich");      
            return View(phg);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suaphong(PHONG phg)
        {
            ViewBag.Tang = new SelectList(db.TANGs.ToList().OrderBy(n => n.Tang1), "Tang1", "Tang1");
            ViewBag.DienTich = new SelectList(db.TANGs.ToList().OrderBy(n => n.DienTich), "DienTich", "DienTich");                                                  
            PHONG phong = db.PHONGs.Where(x => x.MaPHG == phg.MaPHG).Single<PHONG>();
            phong.TenPHG= phg.TenPHG;
            phong.Tang = phg.Tang;
            phong.DienTich = phg.DienTich;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        //public ActionResult Tang()
        //{
        //    var idTang = Json(JsonRequestBehavior.AllowGet);
        //    return ViewBag.Tang = idTang;
        //}
        //public ActionResult DT()
        //{
        //    return Json(JsonRequestBehavior.AllowGet);
        //}
        //public ActionResult HienThiGia()
        //{
        //    var idTang = ViewBag.Tang;
        //    var idDT = ViewBag.DienTich;

        //    var gia = from n in db.TANGs
        //              where n.Tang1 == idTang && n.DienTich == int.Parse(DT().ToString())
        //              select n.Gia;

        //    ViewBag.GiaTheoDTVaTang = gia;
        //    return PartialView();
        //}
    }
}