using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TaskManager.ENTITIES
{
    class Tarea
    {
        public int Id { get; set; }

        public int ProyectoId { get; set; }
        public string Titulo { get; set; }
        public string Descripcion { get; set; }
        public string Estado { get; set; }

        public int UsuarioAsignadoId { get; set; }
    }
}
