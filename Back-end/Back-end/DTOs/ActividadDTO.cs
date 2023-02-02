using Back_end.Validaciones;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace Back_end.DTOs
{
    public class ActividadDTO
    {
        public int id { get; set; }
        public DateTime create_date { get; set; }
        public int id_usuario { get; set; }
        public string actividad { get; set; }

    }
}
