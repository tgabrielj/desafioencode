using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Back_end.DTOs
{
    public class ActividadCreacionDTO
    {
        public DateTime create_date { get; set; }
        public int id_usuario { get; set; }
        public string actividad { get; set; }
    }
}
