using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Back_end.DTOs
{
    public class ActividadCreacionDTO
    {
        public DateTime date_create { get; set; }
        public int id_usuario { get; set; }
        public string actividad { get; set; }
    }
}
