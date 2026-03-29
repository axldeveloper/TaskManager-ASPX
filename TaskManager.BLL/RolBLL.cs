using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManager.DAL;
using TaskManager.ENTITIES;

namespace TaskManager.BLL
{
    public class RolBLL
    {
        private RolDAL dal = new RolDAL();

        public List<Rol> Listar()
        {
            return dal.Listar();
        }
    }
}
