using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using _StoreFront.DATA.EF;
using System.Data;
using System.Data.Entity;

namespace _StoreFront.UI.MVC.Controllers
{
    public class FiltersController : Controller
    {
        private ChessStoreEntities db = new ChessStoreEntities();

        // GET: Filters
        public ActionResult Index()
        {
            return View();
        }

        //jQuery DataTables client-side example
        public ActionResult Clientside()
        {
            var products = db.Products;
            return View(products.ToList());
        }

    }

}