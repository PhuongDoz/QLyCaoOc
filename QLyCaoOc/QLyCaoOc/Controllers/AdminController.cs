using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLyCaoOc.Models;
using System.IO;

namespace QLyCaoOc.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        dbQLyCaoOc db = new dbQLyCaoOc();
        public ActionResult Index()
        {
            return View();
        }
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tendn = collection["username"];
            var matkhau = collection["password"];
            if (String.IsNullOrEmpty(tendn))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập!";
            }
            else if (String.IsNullOrEmpty(matkhau))
            {
                ViewData["Loi2"] = "Phải nhập mật khẩu!";
            }
            else
            {
                TAIKHOAN tk = db.TAIKHOANs.SingleOrDefault(n => n.TenDN == tendn && n.MatKhau == matkhau);
                if (tk != null)
                {
                    Session["Taikhoan"] = tk;
                    return RedirectToAction("Index", "Room");
                }
                else
                    ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng !";
            }
            return View();
        }
    }
}