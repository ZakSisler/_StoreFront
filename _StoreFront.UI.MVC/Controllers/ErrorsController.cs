using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using _StoreFront.UI.MVC.Exceptions;

namespace _StoreFront.UI.MVC.Exceptions
{
    public class ErrorsController : Controller
    {
        // GET: Errors
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Throw404()
        {
            return HttpNotFound();
            //This allows us to manually throw a specific type of error - 404: file not found
        }

        public ActionResult Unresolved()
        {
            //This is our basic default custom error page

            //To utilize this custom error page effectively, we could have logic that redirects when something goes wrong and sends the user here instead. Ex:RedirectToAction("Unresolved", "CustomErrors")
            return View();
        }

        public ActionResult DBTest()
        {
            //Simulate testing for Database connectivity before processing.
            // - If it fails, throw the custom error for logging purposes,
            //then catch it and redirect to a specific custom error page for this issue.
            // - If it succeeds, "do the stuff"

            try
            {
                bool dbCheck = true; //Toggle the boolean value for setting the test to fail or succeed

                if (dbCheck)
                {
                    return View(); //The database connection works -- we're cool to do the cool stuff now
                }
                else
                {
                    //DB connection failed. Throw a custom exception for the event.
                    throw new DBOfflineException();
                }
            }
            catch (Exception)
            {

                return RedirectToAction("DBOffline"); //Attempts to handle the error nicely & send the user to a 
                                                      //specific page for these errors
            }
        }

        public ActionResult DBOffline()
        {
            return View();
        }


    }
}