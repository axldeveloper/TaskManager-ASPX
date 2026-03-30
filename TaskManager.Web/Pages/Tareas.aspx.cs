using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Services;
using TaskManager.BLL;
using TaskManager.ENTITIES;

namespace TaskManager.Web.Pages
{
    public partial class Tareas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Request.Cookies["usuario"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        [WebMethod]
        public static List<Tarea> Listar()
        {
            return new TareaBLL().Listar();
        }

        [WebMethod]
        public static string Guardar(Tarea t)
        {
            new TareaBLL().Guardar(t);
            return "OK";
        }

        [WebMethod]
        public static List<Proyecto> GetProyectos()
        {
            return new ProyectoBLL().Listar();
        }

        [WebMethod]
        public static List<Usuario> GetUsuarios()
        {
            return new UsuarioBLL().Listar();
        }

        [WebMethod]
        public static string Actualizar(Tarea t)
        {
            new TareaBLL().Actualizar(t);
            return "OK";
        }

        [WebMethod]
        public static string Eliminar(int id)
        {
            new TareaBLL().Eliminar(id);
            return "OK";
        }
    }
}