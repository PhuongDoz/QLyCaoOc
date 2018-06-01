using QLyCaoOc.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QLyCaoOc.Controllers
{
    public class FloorController : Controller
    {

        dbQLyCaoOc db = new dbQLyCaoOc();
        // GET: Tang
        private List<TANG> ListTang(int count)
        {
            return db.TANGs.OrderByDescending(a => a.Tang1).Take(count).ToList();
        }
        public ActionResult Index()
        {
            var tang = ListTang(200);
            return View(tang);
        }

        //THÊM TẦNG
        [HttpGet]
        public ActionResult Themtang()
        {
            return View();
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Themtang(TANG tang)
        {
            db.TANGs.Add(tang);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //XÓa Tầng
        public ActionResult Xoatang(int id1 , int id2)
        {
            TANG tang = db.TANGs.Find(id1,id2);
            if (tang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(tang);
        }

        [HttpPost, ActionName("Xoatang")]
        [ValidateAntiForgeryToken]
        public ActionResult Xacnhanxoa(int id1, int id2)
        {
            TANG tang = db.TANGs.Find(id1,id2);
            ViewBag.Tang1 = tang.Tang1;
            if (tang == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.TANGs.Remove(tang);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult Suatang(int id1 , int id2)
        {
            TANG tang = db.TANGs.Find(id1, id2);
            if (tang == null)
            {
                Response.StatusCode = 404;
            }
            return View(tang);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult Suatang(TANG tg, int id1, int id2)
        {
            TANG tang = db.TANGs.Find(id1, id2);
            tang.Tang1 = tg.Tang1;
            tang.DienTich = tg.DienTich;
            tang.Gia = tg.Gia;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}