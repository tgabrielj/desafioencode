using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Back_end.DTOs
{
    public class UsuarioCreacionDTO
    {

        public string nombre { get; set; }
        public string apellido { get; set; }
        public string correo_electronico { get; set; }
        public DateTime fecha_nacimiento { get; set; }
        public string telefono { get; set; }
        public string pais { get; set; }
        public bool contactar { get; set; }


    }
}
