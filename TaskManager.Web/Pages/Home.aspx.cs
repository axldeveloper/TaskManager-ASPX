using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TaskManager.Web.Pages
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        [WebMethod]
        public static string Logout()
        {
            HttpContext.Current.Response.Cookies["usuario"].Expires = DateTime.Now.AddDays(-1);
            return "OK";
        }
    }
}