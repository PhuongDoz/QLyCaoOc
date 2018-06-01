using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLyCaoOc.Models;
using System.Threading.Tasks;
using System.Data.Entity.Validation;
using System.ComponentModel;


namespace QLyCaoOc.Controllers
{
    public class CompanyController : Controller
    {
        dbQLyCaoOc db = new dbQLyCaoOc();
        // GET: Building
        private List<CONGTY> ListCongTy(int count)
        {
            return db.CONGTies.OrderByDescending(a => a.MaCongTy).Take(count).ToList();
        }
        public ActionResult Index()
        {

            var congty = ListCongTy(200);
            return View(congty);
        }
        // GET: Company
        [HttpGet]
        public ActionResult Themcongty()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themcongty(FormCollection collection, CONGTY cty)
        {
            var MaCongTy = collection["MaCongTy"];
            var TenCongTy = collection["TenCT"];
            var DiaChiCTy = collection["DiaChiCT"];
            var SDT = collection["SDT"];
            if (String.IsNullOrEmpty(TenCongTy))
            {
                ViewData["Loi1"] = "Tên công ty không được bỏ trống";
            }
            else if (String.IsNullOrEmpty(DiaChiCTy))
            {
                ViewData["Loi2"] = "Phải nhập địa chỉ công ty";
            }
            else if (String.IsNullOrEmpty(SDT))
            {
                ViewData["Loi3"] = "Phải nhập SĐT công ty";
            }
            else
            {
                cty.MaCongTy = Convert.ToInt32(MaCongTy);
                cty.TenCT = TenCongTy;
                cty.DiaChiCT = DiaChiCTy;
                cty.SDT = SDT;
                db.CONGTies.Add(cty);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return this.Themcongty();
        }
        public ActionResult Chitietcongty(int id)
        {
            CONGTY cty = db.CONGTies.SingleOrDefault(n => n.MaCongTy == id);
            ViewBag.MaCongTy = cty.MaCongTy;
            if (cty == null)
            {
                Response.StatusCode = 404;
                return null;
            }

            return View(cty);
        }
        [HttpGet]
        public ActionResult Xoacongty(int id)
        {
            CONGTY cty = db.CONGTies.SingleOrDefault(n => n.MaCongTy == id);

            ViewBag.MaCongTy = cty.MaCongTy;
            if (cty == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(cty);

        }
        [HttpPost, ActionName("Xoacongty")]
        public ActionResult Xacnhanxoa(int id)
        {
            CONGTY cty = db.CONGTies.SingleOrDefault(n => n.MaCongTy == id);
            ViewBag.MaCongTy = cty.MaCongTy;
            if (cty == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.CONGTies.Remove(cty);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpGet]
        public ActionResult Suacongty(int id)
        {
            CONGTY cty = db.CONGTies.SingleOrDefault(n => n.MaCongTy == id);
            if (cty == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(cty);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suacongty(CONGTY congty)
        {
            if (ModelState.IsValid)
            {
                CONGTY cty = db.CONGTies.Where(x => x.MaCongTy == congty.MaCongTy).Single<CONGTY>();
                cty.MaCongTy = congty.MaCongTy;
                cty.TenCT = congty.TenCT;
                cty.DiaChiCT = congty.DiaChiCT;
                cty.SDT = congty.SDT;
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }
    }
}