using System.DirectoryServices.AccountManagement;
using System.Web;
using System.Web.Mvc;

namespace DevExpress.FrontEnd
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
            filters.Add(new AuthoriseAdAttribute());
        }
    }

    public class AuthoriseAdAttribute : AuthorizeAttribute
    {
        //public string Groups { get; set; }

        public static bool CheckUserHasAccessToApplication(HttpContextBase httpContext)
        {
           // var userName = System.Security.Principal.WindowsIdentity.GetCurrent().Name;
            var userName = httpContext.User.Identity.Name;
            // set up domain context
            var ctx = new PrincipalContext(ContextType.Domain, "AD");

            // find a user
            var user = UserPrincipal.FindByIdentity(ctx, userName);

            // find the group in question
            var group = GroupPrincipal.FindByIdentity(ctx, "Qatar Tools–Users");

            if (user != null && group != null)
            {
                if (user.IsMemberOf(group))
                {
                    return true;
                }
            }
            return false;
        }

        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (base.AuthorizeCore(httpContext))
            {
                return CheckUserHasAccessToApplication(httpContext);               
            }
            return false;
        }
    }
}
