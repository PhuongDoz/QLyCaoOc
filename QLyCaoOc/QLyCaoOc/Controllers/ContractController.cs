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
            return View();
        }
        public ActionResult Chitiethopdong(string id)
        {
            HOPDONG hopdong = db.HOPDONGs.SingleOrDefault(n => n.MaHD == id);
            ViewBag.MaHD = hopdong.MaHD;
            if (hopdong == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(hopdong);


        
        }

       
    }
}