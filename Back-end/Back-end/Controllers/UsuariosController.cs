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
    [Route("api/usuarios")]
    [ApiController]
    public class UsuariosController : ControllerBase
    {
        private readonly ApplicationDbContext context;
        private readonly IMapper mapper;

        public UsuariosController(
            ApplicationDbContext context,
            IMapper mapper) {
            //this.repositorio = repositorio;
            this.context = context;
            this.mapper = mapper;
        }

        [HttpGet] //api/usuarios
        public async Task<ActionResult<List<UsuarioDTO>>> Get([FromQuery] PaginacionDTO paginacionDTO) {

            var queryable =  context.Usuarios.AsQueryable();
            await HttpContext.InsertarParametrosPaginacionEnCabecera(queryable);
            var usuarios = await queryable.OrderBy(x => x.nombre).Paginar(paginacionDTO).ToListAsync();

            return mapper.Map<List<UsuarioDTO>>(usuarios);
        }

        // un endpoint para obtener usuario por id
        [HttpGet("{id:int}")] // api/usuarios/1/gabriel
        public async Task<ActionResult<UsuarioDTO>> Get(int id) {
            // el BinRequired obliga a que los parametros sean obligatorios

            var usuario = await context.Usuarios.FirstOrDefaultAsync(x => x.id ==id);
            if (usuario == null) {
                return NotFound();
            }

            return mapper.Map<UsuarioDTO>(usuario);
        }

        [HttpPost]
        public async Task<ActionResult> Post([FromBody] UsuarioCreacionDTO usuarioCreacionDTO) {

            //throw new NotImplementedException();
            var usuario = mapper.Map<Usuario>(usuarioCreacionDTO);
            context.Add(usuario);
            await context.SaveChangesAsync();
            return NoContent();
        }

        [HttpPut("{id:int}")]
        public async Task<ActionResult> Put( int id, [FromBody] UsuarioCreacionDTO usuarioCreacionDTO)
        {
            var usuario = await context.Usuarios.FirstOrDefaultAsync(x => x.id == id);
            if (usuario == null)
            {
                return NotFound();
            }

            usuario = mapper.Map(usuarioCreacionDTO, usuario);
            await context.SaveChangesAsync();
            return NoContent();


        }


        [HttpDelete("{id:int}")]
        public async Task<ActionResult> Delete(int id)
        {
            var existe = await context.Usuarios.AnyAsync(x => x.id == id);

            if (!existe) {
                return NotFound();
            }

            context.Remove(new Usuario() { id = id });
            await context.SaveChangesAsync();
            return NoContent();
        }

    }
}
