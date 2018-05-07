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
        dbQLyCaoOcDataContext db = new dbQLyCaoOcDataContext();
        private List<PHONG> ListPhong(int count)
        {
            return db.PHONGs.OrderByDescending(a => a.Tang).Take(count).ToList();
        }
        // GET: Room
        public ActionResult Index()
        {
            var phong = ListPhong(100);
            return View(phong);
        }
    }
}