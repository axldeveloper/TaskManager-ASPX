using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManager.ENTITIES;

namespace TaskManager.DAL
{
    public class GeneroDAL
    {
        public List<Genero> Listar()
        {
            List<Genero> lista = new List<Genero>();

            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();
                var cmd = new SqlCommand("SELECT * FROM Genero", con);
                var dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Genero
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
