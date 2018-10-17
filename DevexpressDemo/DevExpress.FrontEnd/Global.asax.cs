using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace DevExpress.FrontEnd
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            ModelBinders.Binders.DefaultBinder = new DevExpress.Web.Mvc.DevExpressEditorsBinder();

            var siteName = System.Web.Hosting.HostingEnvironment.SiteName;
            Application["dbName"] = DbName;
            Application["siteName"] = siteName;
        }

        public static string DbName;
    }
}
