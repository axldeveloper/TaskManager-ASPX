using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TaskManager.ENTITIES
{
    class Comentario
    {
        public int Id { get; set; }

        public int TareaId { get; set; }
        public int UsuarioId { get; set; }

        public string Texto { get; set; }
        public DateTime Fecha { get; set; }
    }
}
