using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManager.ENTITIES;

namespace TaskManager.DAL
{
    public class EstadoCivilDAL
    {
        public List<EstadoCivil> Listar()
        {
            List<EstadoCivil> lista = new List<EstadoCivil>();

            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();
                var cmd = new SqlCommand("SELECT * FROM EstadoCivil", con);
                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new EstadoCivil
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
