using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using TaskManager.ENTITIES;

namespace TaskManager.DAL
{
    public class TareaDAL
    {
        public List<Tarea> Listar()
        {
            List<Tarea> lista = new List<Tarea>();
            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
                SELECT 
                    t.Id,
                    t.Titulo,
                    t.Descripcion,
                    t.Estado,
                    t.ProyectoId,
                    t.UsuarioAsignadoId,
                    p.Nombre AS NombreProyecto,
                    u.Nombre + ' ' + u.Apellido AS NombreUsuario
                FROM Tareas t
                INNER JOIN Proyectos p ON t.ProyectoId = p.Id
                INNER JOIN Usuarios u ON t.UsuarioAsignadoId = u.Id", con);

                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Tarea
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        Titulo = dr["Titulo"].ToString(),
                        Descripcion = dr["Descripcion"].ToString(),
                        Estado = dr["Estado"].ToString(),
                        ProyectoId = Convert.ToInt32(dr["ProyectoId"]),
                        UsuarioAsignadoId = Convert.ToInt32(dr["UsuarioAsignadoId"]),
                        NombreProyecto = dr["NombreProyecto"].ToString(),
                        NombreUsuario = dr["NombreUsuario"].ToString()
                    });
                }
            }

            return lista;
        }

        public void Guardar(Tarea t)
        {
            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
                INSERT INTO Tareas 
                (ProyectoId, Titulo, Descripcion, Estado, UsuarioAsignadoId)
                VALUES (@ProyectoId, @Titulo, @Descripcion, @Estado, @UsuarioAsignadoId)", con);

                cmd.Parameters.AddWithValue("@ProyectoId", t.ProyectoId);
                cmd.Parameters.AddWithValue("@Titulo", t.Titulo);
                cmd.Parameters.AddWithValue("@Descripcion", t.Descripcion);
                cmd.Parameters.AddWithValue("@Estado", t.Estado);
                cmd.Parameters.AddWithValue("@UsuarioAsignadoId", t.UsuarioAsignadoId);

                cmd.ExecuteNonQuery();
            }
        }

        public void Actualizar(Tarea t)
        {
            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(@"
                    UPDATE Tareas
                        SET ProyectoId=@ProyectoId,
                            Titulo=@Titulo,
                            Descripcion=@Descripcion,
                            Estado=@Estado,
                            UsuarioAsignadoId=@UsuarioAsignadoId
                        WHERE Id=@Id", con);

                cmd.Parameters.AddWithValue("@Id", t.Id);
                cmd.Parameters.AddWithValue("@ProyectoId", t.ProyectoId);
                cmd.Parameters.AddWithValue("@Titulo", t.Titulo);
                cmd.Parameters.AddWithValue("@Descripcion", t.Descripcion);
                cmd.Parameters.AddWithValue("@Estado", t.Estado);
                cmd.Parameters.AddWithValue("@UsuarioAsignadoId", t.UsuarioAsignadoId);

                cmd.ExecuteNonQuery();
            }
        }

        public void Eliminar(int id)
        {
            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("DELETE FROM Tareas WHERE Id=@Id", con);

                cmd.Parameters.AddWithValue("@Id", id);

                cmd.ExecuteNonQuery();
            }
        }

    }
}
