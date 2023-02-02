using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Back_end.DTOs
{
    public class ActividadUsuarioDTO
    {

        public DateTime fecha_actividad { get; set; }
        public string nombre { get; set; }
        public string apellido { get; set; }
        public string actividad { get; set; }
    }
}
