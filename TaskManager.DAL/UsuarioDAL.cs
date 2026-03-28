using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaskManager.ENTITIES;

namespace TaskManager.DAL
{
    class UsuarioDAL
    {
        public void Insertar(Usuario usuario)
        {
            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();

                string query = @"INSERT INTO Usuarios (Nombre, Apellido, Cedula, GeneroId, FechaNacimiento, EstadoCivilId, RolId, Usuario, Password)
                VALUES
                (@Nombre, @Apellido, @Cedula, @GeneroId, @FechaNacimiento, @EstadoCivilId, @RolId, @Usuario, @Password)";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Nombre", usuario.Nombre);
                cmd.Parameters.AddWithValue("@Apellido", usuario.Apellido);
                cmd.Parameters.AddWithValue("@Cedula", usuario.Cedula);
                cmd.Parameters.AddWithValue("@GeneroId", usuario.GeneroId);
                cmd.Parameters.AddWithValue("@FechaNacimiento", usuario.FechaNacimiento);
                cmd.Parameters.AddWithValue("@EstadoCivilId", usuario.EstadoCivilId);
                cmd.Parameters.AddWithValue("@RolId", usuario.RolId);
                cmd.Parameters.AddWithValue("@Usuario", usuario.UserName);
                cmd.Parameters.AddWithValue("@Password", usuario.Password);

                cmd.ExecuteNonQuery();
            }
        }

        public List<Usuario> Listar()
        {
            List<Usuario> lista = new List<Usuario>();

            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();

                string query = "SELECT * FROM Usuarios";
                SqlCommand cmd = new SqlCommand(query, con);
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    lista.Add(new Usuario
                    {
                        Id = Convert.ToInt32(dr["Id"]),
                        Nombre = dr["Nombre"].ToString(),
                        Apellido = dr["Apellido"].ToString(),
                        Cedula = dr["Cedula"].ToString(),
                        GeneroId = Convert.ToInt32(dr["GeneroId"]),
                        EstadoCivilId = Convert.ToInt32(dr["EstadoCivilId"]),
                        RolId = Convert.ToInt32(dr["RolId"]),
                        UserName = dr["Usuario"].ToString()
                    });
                }
            }

            return lista;
        }

        public void Eliminar(int id)
        {
            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();

                string query = "DELETE FROM Usuarios WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Id", id);

                cmd.ExecuteNonQuery();
            }
        }

        public void Actualizar(Usuario u)
        {
            using (SqlConnection con = DbHelper.GetConnection())
            {
                con.Open();

                string query = @"UPDATE Usuarios SET
                Nombre=@Nombre,
                Apellido=@Apellido,
                Cedula=@Cedula
                WHERE Id=@Id";

                SqlCommand cmd = new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Nombre", u.Nombre);
                cmd.Parameters.AddWithValue("@Apellido", u.Apellido);
                cmd.Parameters.AddWithValue("@Cedula", u.Cedula);
                cmd.Parameters.AddWithValue("@Id", u.Id);

                cmd.ExecuteNonQuery();
            }
        }
    }
}

