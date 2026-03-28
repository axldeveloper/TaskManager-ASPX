using System;
using System.Collections.Generic;
using System.Web.Services;
using TaskManager.BLL;
using TaskManager.ENTITIES;

namespace TaskManager.Web.Pages
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [WebMethod]
        public static string Guardar(Usuario usuario)
        {
            try
            {
                UsuarioBLL bll = new UsuarioBLL();
                bll.Insertar(usuario);
                return "OK";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        [WebMethod]
        public static List<Usuario> Listar()
        {
            UsuarioBLL bll = new UsuarioBLL();
            return bll.Listar();
        }

        [WebMethod]
        public static void Eliminar(int id)
        {
            UsuarioBLL bll = new UsuarioBLL();
            bll.Eliminar(id);
        }
    }
}