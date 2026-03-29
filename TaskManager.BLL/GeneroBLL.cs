using System.Collections.Generic;
using TaskManager.DAL;
using TaskManager.ENTITIES;

namespace TaskManager.BLL
{
    public class GeneroBLL
    {
        private GeneroDAL dal = new GeneroDAL();

        public List<Genero> Listar()
        {
            return dal.Listar();
        }
    }
}
