using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManager.DAL;
using TaskManager.ENTITIES;

namespace TaskManager.BLL
{
    public class ComentarioBLL
    {
        ComentarioDAL dal = new ComentarioDAL();

        public List<Comentario> ListarPorTarea(int tareaId)
        {
            return dal.ListarPorTarea(tareaId);
        }

        public void Guardar(Comentario c)
        {
            dal.Guardar(c);
        }
    }
}
