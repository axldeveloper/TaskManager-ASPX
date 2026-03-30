using System.Collections.Generic;
using TaskManager.DAL;
using TaskManager.ENTITIES;

namespace TaskManager.BLL
{
    public class TareaBLL
    {
        TareaDAL dal = new TareaDAL();

		public List<Tarea> Listar()
        {
            return dal.Listar();
        }

		public void Guardar(Tarea t)
        {
            dal.Guardar(t);
        }
    }
}
