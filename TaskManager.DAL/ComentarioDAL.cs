using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using TaskManager.ENTITIES;

namespace TaskManager.DAL
{
    public class ComentarioDAL
    {
        public List<Comentario> ListarPorTarea(int tareaId)
        {
            List<Comentario> lista = new List<Comentario>();

            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
                SELECT c.*, u.Nombre + ' ' + u.Apellido AS NombreUsuario
                FROM Comentarios c
                INNER JOIN Usuarios u ON c.UsuarioId = u.Id
                WHERE c.TareaId = @TareaId
                ORDER BY c.Fecha DESC", con);

                cmd.Parameters.AddWithValue("@TareaId", tareaId);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Comentario
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        TareaId = Convert.ToInt32(dr["TareaId"]),
                        UsuarioId = Convert.ToInt32(dr["UsuarioId"]),
                        Texto = dr["Comentario"].ToString(),
                        Fecha = Convert.ToDateTime(dr["Fecha"]),
                        NombreUsuario = dr["NombreUsuario"].ToString()
                    });
                }
            }

            return lista;
        }

        public void Guardar(Comentario c)
        {
            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
                INSERT INTO Comentarios (TareaId, UsuarioId, Comentario)
                VALUES (@TareaId, @UsuarioId, @Comentario)
            ", con);

                cmd.Parameters.AddWithValue("@TareaId", c.TareaId);
                cmd.Parameters.AddWithValue("@UsuarioId", c.UsuarioId);
                cmd.Parameters.AddWithValue("@Comentario", c.Texto);

                cmd.ExecuteNonQuery();
            }
        }
    }
}
