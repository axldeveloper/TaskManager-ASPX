using System;
using System.Web;
using System.Web.Services;
using TaskManager.BLL;

namespace TaskManager.Web.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e) { }

        [WebMethod]
        public static string ValidarLogin(string user, string pass)
        {
            UsuarioBLL bll = new UsuarioBLL();

            var usuario = bll.Login(user, pass);

            if (usuario != null)
            {
                HttpContext.Current.Response.Cookies["usuario"].Value = usuario.UserName;
                return "OK";
            }

            return "ERROR";
        }
    }
}