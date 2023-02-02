using AutoMapper;
using Back_end.Data;
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
        private readonly ValuesRepository _repository;
        private readonly ApplicationDbContext context;
        private readonly IMapper mapper;

        public ActividadesController(
            ValuesRepository repository,
            ApplicationDbContext context,
            IMapper mapper)
        {
            //this.repositorio = repositorio;
            this.context = context;
            this.mapper = mapper;
            this._repository = repository ?? throw new ArgumentNullException(nameof(repository));
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
        public async Task<List<ActividadUsuarioDTO>> Get()
        {

            //var queryable = context.Actividades.AsQueryable();
            //await HttpContext.InsertarParametrosPaginacionEnCabecera(queryable);
            //var actividades = await queryable.OrderBy(x => x.create_date).Paginar(paginacionDTO).ToListAsync();

            //return mapper.Map<List<ActividadDTO>>(actividades);

            return await _repository.GetAll();
        }

        
        
    }
}
