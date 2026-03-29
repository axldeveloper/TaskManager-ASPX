using System;
using System.Collections.Generic;
using TaskManager.DAL;
using TaskManager.ENTITIES;

namespace TaskManager.BLL
{
    public class UsuarioBLL
    {
        private UsuarioDAL dal = new UsuarioDAL();

        public void Insertar(Usuario usuario)
        {
            if (string.IsNullOrEmpty(usuario.Nombre))
            {
                throw new Exception("El nombre es obligatorio.");
            }

            if (string.IsNullOrEmpty(usuario.Cedula))
            {
                throw new Exception("La cedula es obligatoria.");
            }

            dal.Insertar(usuario);
        }

        public List<Usuario> Listar()
        {
            return dal.Listar();
        }

        public void Eliminar(int id)
        {
            if (id <= 0)
            {
                throw new Exception("Id invalido.");
            }
            dal.Eliminar(id);
        }

        public void Actualizar(Usuario usuario)
        {
            if (usuario.Id <= 0)
                throw new Exception("ID inválido");

            dal.Actualizar(usuario);
        }
    }
}
