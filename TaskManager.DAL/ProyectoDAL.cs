using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using TaskManager.ENTITIES;

namespace TaskManager.DAL
{
    public class ProyectoDAL
    {
        public List<Proyecto> Listar()
        {
            List<Proyecto> lista = new List<Proyecto>();

            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Proyectos", con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Proyecto
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        Nombre = dr["Nombre"].ToString(),
                        Descripcion = dr["Descripcion"].ToString(),
                        FechaInicio = Convert.ToDateTime(dr["FechaInicio"]),
                        FechaFin = Convert.ToDateTime(dr["FechaFin"]),
                        Estado = dr["Estado"].ToString()
                    });
                }
            }

            return lista;
        }

        public void Guardar(Proyecto p)
        {
            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(@"INSERT INTO Proyectos (Nombre, Descripcion, FechaInicio, FechaFin, Estado) VALUES (@Nombre,@Descripcion,@FechaInicio,@FechaFin,@Estado)", con);

                cmd.Parameters.AddWithValue("@Nombre", p.Nombre);
                cmd.Parameters.AddWithValue("@Descripcion", p.Descripcion);
                cmd.Parameters.AddWithValue("@FechaInicio", p.FechaInicio);
                cmd.Parameters.AddWithValue("@FechaFin", p.FechaFin);
                cmd.Parameters.AddWithValue("@Estado", p.Estado);

                cmd.ExecuteNonQuery();
            }
        }
    }
}
