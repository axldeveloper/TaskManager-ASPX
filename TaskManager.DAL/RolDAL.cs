using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManager.ENTITIES;

namespace TaskManager.DAL
{
    public class RolDAL
    {
        public List<Rol> Listar()
        {
            List<Rol> lista = new List<Rol>();

            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();
                var cmd = new SqlCommand("SELECT * FROM Rol", con);
                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Rol
                    {
                        Id = (int)dr["Id"],
                        Descripcion = dr["Descripcion"].ToString()
                    });
                }
            }

            return lista;
        }
    }
}
