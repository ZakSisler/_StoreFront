using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using _StoreFront.DATA.EF;
using _StoreFront.UI.MVC.Models;
using PagedList;
using PagedList.Mvc;

namespace _StoreFront.UI.MVC.Controllers
{
    public class ProductsController : Controller
    {
        private ChessStoreEntities db = new ChessStoreEntities();

        // GET: Products
        public ActionResult Index(int page = 1)
        {
            int pageSize = 5;
            var products = db.Products.Include(p => p.ProductCategory).Include(p => p.ProductStatu).OrderBy(p => p.ProductName).ToList();

            return View(products.ToPagedList(page, pageSize));
        }


        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }


        #region Custom Add-to-Cart Functionality (Called from details view)

        public ActionResult AddToCart(int qty, int productID)
        {
            //Create an empty shell for the LOCAL shopping cart variable
            Dictionary<int, CartItemViewModel> shoppingCart = null;

            //check if session shopping cart exists. If so, use it to populate the local version
            if (Session["cart"] != null)
            {
                //Session shopping cart exists. Put its items in the local version, which is easier to work with
                shoppingCart = (Dictionary<int, CartItemViewModel>)Session["cart"];
                //Need to unbox the Session object to its smaller, more specific type -- Explicit casting
            }
            else
            {
                //If the Sessioin cart doesn't exist yet, we nee to instantiate it to get started
                shoppingCart = new Dictionary<int, CartItemViewModel>();
                //After this if/else block, we now have a local cart that's ready to add things to it
            }

            //Find the product they referenced by its ID
            Product product = db.Products.Where(b => b.ProductID == productID).FirstOrDefault();

            if (product == null)
            {
                //IF given a bad ID, return the user to some other page to try again
                //Alternatively we could throw some kind of error, whih we will
                //discuss further in Module 6
                return RedirectToAction("Index");
            }
            else
            {
                //IF the Book is valid, add the line-item to the cart
                CartItemViewModel item = new CartItemViewModel(qty, product);

                //Put the item in the local cart. If they already have that product as a cart item, 
                //then instead we will update the qty. This is a big part as to why we have the dictionary.
                if (shoppingCart.ContainsKey(product.ProductID))
                {
                    shoppingCart[product.ProductID].Qty += qty;
                }
                else
                {
                    shoppingCart.Add(product.ProductID, item);
                }

                //Now update the SESSION version of the cart so we can maintain that info between requests
                Session["cart"] = shoppingCart; //No explicit casting needed here
            }

            //Send them to View their Cart Items
            return RedirectToAction("Index", "ShoppingCart");
        }

        #endregion


        // GET: Products/Create
        [Authorize(Roles = "Admin")]
        public ActionResult Create()
        {
            ViewBag.ProductCategoryID = new SelectList(db.ProductCategories, "ProductCategoryID", "ProductCategory1");
            ViewBag.ProductStatusID = new SelectList(db.ProductStatus, "ProductStatusID", "StatusName");
            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Create([Bind(Include = "ProductID,ProductName,ProductDescription,ProductCategoryID,ProductStatusID,Price,ProductImage")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.ProductCategoryID = new SelectList(db.ProductCategories, "ProductCategoryID", "ProductCategory1", product.ProductCategoryID);
            ViewBag.ProductStatusID = new SelectList(db.ProductStatus, "ProductStatusID", "StatusName", product.ProductStatusID);
            return View(product);
        }

        // GET: Products/Edit/5
        [Authorize(Roles = "Admin")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.ProductCategoryID = new SelectList(db.ProductCategories, "ProductCategoryID", "ProductCategory1", product.ProductCategoryID);
            ViewBag.ProductStatusID = new SelectList(db.ProductStatus, "ProductStatusID", "StatusName", product.ProductStatusID);
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "Admin")]
        public ActionResult Edit([Bind(Include = "ProductID,ProductName,ProductDescription,ProductCategoryID,ProductStatusID,Price,ProductImage")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.ProductCategoryID = new SelectList(db.ProductCategories, "ProductCategoryID", "ProductCategory1", product.ProductCategoryID);
            ViewBag.ProductStatusID = new SelectList(db.ProductStatus, "ProductStatusID", "StatusName", product.ProductStatusID);
            return View(product);
        }

        // GET: Products/Delete/5
        [Authorize(Roles = "Admin")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [Authorize(Roles = "Admin")]
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }



        #region AJAX CRUD Functionality

        //Deletes the product record, returns only JSON data on id & confirmation
        [AcceptVerbs(HttpVerbs.Post)]
        public JsonResult AjaxDelete(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();

            string confirmMessage = string.Format("Deleted Product '{0}' from the database.", product.ProductName);
            return Json(new { id = id, message = confirmMessage });
        }

        //Gets the partial View for Details with AJAX
        //Generate this View like normal, but choose Details scaffolding for Product AND check Partial View checkbox
        [HttpGet]
        public PartialViewResult ProductDetails(int id)
        {
            Product product = db.Products.Find(id);
            return PartialView(product);


            ///////////////////////////example
            //Create Partial View (ProductDetails.cshtml)
            // - Template: Details
            // - Model Class: Product
            // - Data Context Class: ChessStoreEntities
            // - Check "Create as Partial View" checkbox
            // - Minor tweaks to View Content
        }

        //Create a new Product record. Also returns the products data as JSON.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxCreate(Product product)
        {
            db.Products.Add(product);
            db.SaveChanges();
            return Json(product);


            //////////////////example
            /*
             * Create a Partial View (ProductCreate.cshtml)
             * - Template: Create
             * - Model: Product
             * - Data Context classL ChessStoreEntities
             * - Check "Create as Partial View"
             */
        }

        //GET PartialView for a product edit form displayed with AJAX
        [HttpGet]
        public PartialViewResult ProductEdit(int id)
        {
            Product product = db.Products.Find(id);
            return PartialView(product);

            /*
             * Create a Partial View (ProductEdit.cshtml) 
             * - Template: edit
             * - Model: Product
             * - Date Context Class: ChessStorePlusEntities
             * - Check the "Create as Partial View" checkbox
             * - Minor tweaks to content
             */
        }

        //Edits publisher record and returns publishers's data as JSON
        [HttpPost]
        [ValidateAntiForgeryToken]
        public JsonResult AjaxEdit(Product product)
        {
            db.Entry(product).State = EntityState.Modified;
            db.SaveChanges();
            return Json(product);
        }

        #endregion

    }
}
