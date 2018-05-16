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
        public ActionResult Themcongty(CONGTY cty)
        {
            db.CONGTies.Add(cty);         
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Chitietcongty(string id)
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
        public ActionResult Xoacongty(string id)
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
        public ActionResult Xacnhanxoa(string id)
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
        public ActionResult Suacongty(string id)
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