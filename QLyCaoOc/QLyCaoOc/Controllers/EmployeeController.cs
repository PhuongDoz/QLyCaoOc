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
            ViewBag.MaCongTy = new SelectList(db.CONGTies.ToList().OrderBy(n => n.TenCT), "MaCongTy", "TenCT");
            ViewBag.MaPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG","MaPHG");
            return View();
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ThemNhanVien(FormCollection collection, NHANVIEN nv, HttpPostedFileBase fileupload)
        {
            var TenNV = collection["TenNV"];
            var DiaChi = collection["DiaChiNV"];
            var SDT = collection["SDTNV"];
            var ChucVu = collection["ChucVu"];
            var MaCongTy = collection["MaCongTy"];
            var MaPHG = collection["MaPHG"];
            if(String.IsNullOrEmpty(TenNV))
            {
                ViewData["Loi1"] = "Tên nhân viên không được bỏ trống!";
            }
            else if (String.IsNullOrEmpty(DiaChi))
            {
                ViewData["Loi2"] = "Địa chỉ nhân viên không đucợ bỏ trống!";
            }
            else if (String.IsNullOrEmpty(SDT))
            {
                ViewData["Loi3"] = "Số điện thoại nhân viên không được bỏ trống!";
            }else if(String.IsNullOrEmpty(ChucVu))
            {
                ViewData["Loi4"] = "Chức vụ nhân viên không được bỏ trống!";
            }
            else if (String.IsNullOrEmpty(MaCongTy))
            {
                ViewData["Loi5"] = "Mã công ty không được bỏ trống!";
            }
            else if (String.IsNullOrEmpty(MaPHG))
            {
                ViewData["Loi6"] = "Mã phòng không được bỏ trống!";
            }
            //đưa dữ liệu vài dropdowload
            ViewBag.MaCongTy = new SelectList(db.CONGTies.ToList().OrderBy(n => n.TenCT), "MaCongTy", "TenCT");
            ViewBag.MaPHG = new SelectList(db.PHONGs.ToList().OrderBy(n => n.MaPHG), "MaPHG","MaPHG");

            //Kiểm tra đường dẫn file
            if (fileupload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh nhân viên";
                return View();
            }
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
                return RedirectToAction("Index");
             }
            return View();
        }
        
        public ActionResult ChitietNV(int id)
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
        public ActionResult SuaNV(int id)
        {
            //Lấy ra đối tượng sách theo mã
            NHANVIEN nv = db.NHANVIENs.SingleOrDefault(n => n.MaNV == id);
            ViewBag.MaNV = nv.MaNV;
            //đưa dữ liệu vào dropdownList
            //Lấy daanh sách từ tabke chu de, sắp xếp tăng dần theo tên chủ đề, chọn mấy giá trị MaCD, hiển thị Tenchude
            ViewBag.MaNV = new SelectList(db.CONGTies.ToList().OrderBy(n => n.TenCT), "MaCongTy", "TenCT");

            return View(nv);
        }


        [HttpPost]
        [ValidateInput(false)]
        public ActionResult SuaNV(NHANVIEN nv, HttpPostedFileBase fileupload)
        {
            //đưa dữ liệu vài dropdowload
            ViewBag.MaNV = new SelectList(db.CONGTies.ToList().OrderBy(n => n.TenCT), "MaCongTy", "TenCT");

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
                return RedirectToAction("Index");
            }
        }

        //Hiển thị sản phẩm


        [HttpGet]
        public ActionResult XoaNV(int id)
        {
            //Lấy ra đối tượng nv cần xóa theo mã
            NHANVIEN nv = db.NHANVIENs.SingleOrDefault(n => n.MaNV == id);
            ViewBag.MaNV = nv.MaNV;
            if (nv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(nv);
        }

        [HttpPost, ActionName("XoaNV")]
        public ActionResult Xacnhanxoa(int id)
        {
            //Lấy ra đối tượng nv cần xóa theo mã
            NHANVIEN nv = db.NHANVIENs.SingleOrDefault(n => n.MaNV == id);
            ViewBag.MaNV = nv.MaNV;
            if (nv == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.NHANVIENs.Remove(nv);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}
