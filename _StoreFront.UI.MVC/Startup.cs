using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(_StoreFront.UI.MVC.Startup))]
namespace _StoreFront.UI.MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
