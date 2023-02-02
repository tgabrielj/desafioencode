using AutoMapper;
using Back_end.DTOs;
using Back_end.Entidades;
using Back_end.Utilidades;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Back_end.Controllers
{
    [Route("api/actividades")]
    [ApiController]
    public class ActividadesController : ControllerBase
    {
        private readonly ApplicationDbContext context;
        private readonly IMapper mapper;

        public ActividadesController(
            ApplicationDbContext context,
            IMapper mapper)
        {
            //this.repositorio = repositorio;
            this.context = context;
            this.mapper = mapper;
        }

        [HttpPost]
        public async Task<ActionResult> Post([FromBody] ActividadCreacionDTO actividadCreacionDTO) {

            var actividad = mapper.Map<Actividad>(actividadCreacionDTO);
            context.Add(actividad);
            actividad.create_date = DateTime.Now;
            await context.SaveChangesAsync();
            return NoContent();
        }

        [HttpGet] //api/actividades
        public async Task<ActionResult<List<ActividadDTO>>> Get([FromQuery] PaginacionDTO paginacionDTO)
        {

            var queryable = context.Actividades.AsQueryable();
            await HttpContext.InsertarParametrosPaginacionEnCabecera(queryable);
            var actividades = await queryable.OrderBy(x => x.create_date).Paginar(paginacionDTO).ToListAsync();

            return mapper.Map<List<ActividadDTO>>(actividades);
        }

        
        
    }
}
