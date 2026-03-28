using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TaskManager.ENTITIES
{
    class Usuario
    {
        public int Id { get; set; }

        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Cedula { get; set; }

        public int GeneroId { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public int EstadoCivilId { get; set; }
        public int RolId { get; set; }

        public string UserName { get; set; }
        public string Password { get; set; }
    }
}
