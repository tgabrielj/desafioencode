using Back_end.Validaciones;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Back_end.Entidades
{
    public class Usuario
    {
        public int id { get; set; }

        public string nombre { get; set; }
        public string apellido { get; set; }
        public string correo_electronico { get; set; }
        public DateTime fecha_nacimiento { get; set; }
        public int telefono { get; set; }
        public string pais { get; set; }
        public bool contactar { get; set; }

        
    }
}
