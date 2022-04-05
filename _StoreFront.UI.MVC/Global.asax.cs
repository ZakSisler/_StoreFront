using _StoreFront.UI.MVC.Models;
using System.Data.Entity;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace _StoreFront.UI.MVC
{
    // Note: For instructions on enabling IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=301868
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_Error()
        {
            //Send user to the default custom error page
            Response.Redirect("~/CustomErrors/Unresolved");

            //The above will only work if the MVC routing still works...

            //SUPER SAFE EXAMPLE - Send the user to a basic HTML page with the path rather than the controller/ action
            Response.Redirect("~/Error.html");
        }
    }
}
