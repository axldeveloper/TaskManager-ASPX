using System.Collections.Generic;
using TaskManager.DAL;
using TaskManager.ENTITIES;

namespace TaskManager.BLL
{
    public class EstadoCiviLBLL
    {
        private EstadoCivilDAL dal = new EstadoCivilDAL();

        public List<EstadoCivil> Listar()
        {
            return dal.Listar();
        }
    }
}
