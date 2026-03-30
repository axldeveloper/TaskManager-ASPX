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
                HttpCookie cookie = new HttpCookie("usuario");

                cookie["Id"] = usuario.Id.ToString();
                cookie["UserName"] = usuario.UserName;
                cookie["Nombre"] = usuario.Nombre;

                cookie.Expires = DateTime.Now.AddHours(1);

                HttpContext.Current.Response.Cookies.Add(cookie);
                return "OK";
            }

            return "ERROR";
        }
    }
}