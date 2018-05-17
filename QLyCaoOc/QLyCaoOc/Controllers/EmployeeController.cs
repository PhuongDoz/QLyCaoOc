using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QLyCaoOc.Models;
using System.IO;

namespace QLyCaoOc.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        dbQLyCaoOc db = new dbQLyCaoOc();
        private List<NHANVIEN> ListNhanVien(int count)
        {
            var nv = (from s in db.NHANVIENs
                      orderby s.MaNV descending
                      select s).Take(count).ToList();
            return nv;
        }
        public ActionResult Index()
        {
            var nhanvien = ListNhanVien(300);
            return View(nhanvien);
        }

        [HttpGet]
        public ActionResult ThemNhanVien()
        {
            ViewBag.MaNV = new SelectList(db.CONGTies.ToList().OrderBy(n => n.TenCT), "MaCongTy", "TenCT");
            ViewBag.MaPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG","MaPHG");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemNhanVien(NHANVIEN nv, HttpPostedFileBase fileupload)
        {
            //đưa dữ liệu vài dropdowload
            ViewBag.MaNV = new SelectList(db.CONGTies.ToList().OrderBy(n => n.TenCT), "MaCongTy", "TenCT");
            ViewBag.MaPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG","MaPHG");

            //Kiểm tra đường dẫn file
            if (fileupload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh nhân viên";
                return View();
            }
            //Thêm vào CSDL
            else
            {
                if (ModelState.IsValid)
                {
                    //Lưu tên file, lưu ý bổ sung thư viện system.IO
                    var fileName = Path.GetFileName(fileupload.FileName);
                    //lưu đường dẫn của fileName
                    var path = Path.Combine(Server.MapPath("~/images"), fileName);
                    //Kiểm tra hình ảnh tồn tại chưa
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        //Lưu hình ảnh vào đường dẫn
                        fileupload.SaveAs(path);
                    }
                    nv.HinhAnh = fileName;

                    //Lưu vào CSDL
                    db.NHANVIENs.Add(nv);
                    db.SaveChanges();
                }
                return RedirectToAction("nv");
            }
        }
        public ActionResult ChitietNV(string id)
        {
            //Lấy ra đối tượng sách theo mã
            NHANVIEN nv = db.NHANVIENs.SingleOrDefault(n => n.MaNV == id);
            ViewBag.MaNV = nv.MaNV;
            if (nv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(nv);
        }
        //chỉnh sửa sản phẩm
        [HttpGet]
        public ActionResult SuaNV(string id)
        {
            //Lấy ra đối tượng sách theo mã
            NHANVIEN nv = db.NHANVIENs.SingleOrDefault(n => n.MaNV == id);
            ViewBag.MaNV = nv.MaNV;
            //đưa dữ liệu vào dropdownList
            //Lấy daanh sách từ tabke chu de, sắp xếp tăng dần theo tên chủ đề, chọn mấy giá trị MaCD, hiển thị Tenchude
            ViewBag.MaNV = new SelectList(db.CONGTies.ToList().OrderBy(n => n.TenCT), "MaCongTy", "TenCT");
            ViewBag.MaPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG", "MaPHG");
            return View(nv);
        }


        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaNV(NHANVIEN nv, HttpPostedFileBase fileupload)
        {
            //đưa dữ liệu vài dropdowload
            ViewBag.MaNV = new SelectList(db.CONGTies.ToList().OrderBy(n => n.TenCT), "MaCongTy", "TenCT");
            ViewBag.MaPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG", "MaPHG");
            //Kiểm tra đường dẫn file
            if (fileupload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            //Thêm vào CSDL
            else
            {
                if (ModelState.IsValid)
                {
                    //Lưu tên file, lưu ý bổ sung thư viện system.IO
                    var fileName = Path.GetFileName(fileupload.FileName);
                    //lưu đường dẫn của fileName
                    var path = Path.Combine(Server.MapPath("~/images"), fileName);
                    //Kiểm tra hình ảnh tồn tại chưa?
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        //Lưu hình ảnh vào đường dẫn
                        fileupload.SaveAs(path);
                    }
                    NHANVIEN p = db.NHANVIENs.Where(x => x.MaNV == nv.MaNV).Single<NHANVIEN>();
                    p.MaNV = nv.MaNV;
                    p.TenNV = nv.TenNV;
                    p.DiaChiNV = nv.DiaChiNV;
                    p.HinhAnh = fileName;
                    p.SDTNV = nv.SDTNV;
                    p.ChucVu = nv.ChucVu;
                    db.SaveChanges();
                }
                return RedirectToAction("nv");
            }
        }

        //Hiển thị sản phẩm


        [HttpGet]
        public ActionResult XoaNV(string id)
        {
            //Lấy ra đối tượng sách cần xóa theo mã
            NHANVIEN nv = db.NHANVIENs.SingleOrDefault(n => n.MaNV == id);
            ViewBag.MaNV = nv.MaNV;
            if (nv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(nv);
        }

        [HttpPost, ActionName("Xoasach")]
        public ActionResult Xacnhanxoa(string id)
        {
            //Lấy ra đối tượng sách cần xóa theo mã
            NHANVIEN nv = db.NHANVIENs.SingleOrDefault(n => n.MaNV == id);
            ViewBag.MaNV = nv.MaNV;
            if (nv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.NHANVIENs.Remove(nv);
            db.SaveChanges();
            return RedirectToAction("nv");
        }

    }
}
