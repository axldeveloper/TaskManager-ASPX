using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManager.DAL;
using TaskManager.ENTITIES;

namespace TaskManager.BLL
{
    public class ProyectoBLL
    {
        ProyectoDAL dal = new ProyectoDAL();

        public List<Proyecto> Listar()
        {
            return dal.Listar();
        }

        public void Guardar(Proyecto p)
        {
            dal.Guardar(p);
        }
    }
}
