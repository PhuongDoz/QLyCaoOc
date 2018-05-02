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
        dbQLyCaoOcDataContext data = new dbQLyCaoOcDataContext();
        // GET: Building
        private List<HOPDONG> ListHopDong(int count)
        {
            return data.HOPDONGs.OrderByDescending(a => a.NgayLap).Take(count).ToList();
        }
        public ActionResult Index()
        {
            var hopdongmoi =  ListHopDong(200);

            return View(hopdongmoi);
        }
    }
}