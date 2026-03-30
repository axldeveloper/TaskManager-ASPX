using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskManager.BLL;
using TaskManager.ENTITIES;

namespace TaskManager.Web.Pages
{
    public partial class Proyectos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        [WebMethod]
        public static List<Proyecto> Listar()
        {
            ProyectoBLL bll = new ProyectoBLL();
            return bll.Listar();
        }

        [WebMethod]
        public static string Guardar(Proyecto p)
        {
            ProyectoBLL bll = new ProyectoBLL();
            bll.Guardar(p);
            return "OK";
        }
    }
}