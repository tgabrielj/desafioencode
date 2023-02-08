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
    [Route("api/usuarios")]
    [ApiController]
    public class UsuariosController : ControllerBase
    {
        private readonly ValuesRepository _repository;
        private readonly ApplicationDbContext context;
        private readonly IMapper mapper;
        private ActividadCreacionDTO actividad;

        public UsuariosController(
            ValuesRepository repository,
            ApplicationDbContext context,
            IMapper mapper) {
            this.actividad = new ActividadCreacionDTO();
            this.context = context;
            this.mapper = mapper;
            this._repository = repository ?? throw new ArgumentNullException(nameof(repository));
        }

        [HttpGet] //api/usuarios

        public async Task<List<UsuarioDTO>> Get_usuarios() {

            //var queryable =  context.Usuarios.AsQueryable();
            //await HttpContext.InsertarParametrosPaginacionEnCabecera(queryable);
            //var usuarios = await queryable.OrderBy(x => x.nombre).Paginar(paginacionDTO).ToListAsync();

            //return mapper.Map<List<UsuarioDTO>>(usuarios);
            return await _repository.Get_usuarios();
        }

        // un endpoint para obtener usuario por id
        [HttpGet("{id:int}")] // api/usuarios/1/gabriel
        public async Task<ActionResult<UsuarioDTO>> Get(int id) {
            // el BinRequired obliga a que los parametros sean obligatorios

            this.actividad.create_date = DateTime.Now;
            this.actividad.id_usuario = id;
            this.actividad.actividad = "consulta de usuario";

            var usuario = await context.Usuarios.FirstOrDefaultAsync(x => x.id ==id);
            if (usuario == null) {
                return NotFound();
            }

            await _repository.Insert(actividad);

            return mapper.Map<UsuarioDTO>(usuario);
        }

        [HttpPost]
        public async Task Post([FromBody] UsuarioCreacionDTO usuarioCreacionDTO) {

        
            //var usuario = mapper.Map<Usuario>(usuarioCreacionDTO);
            //context.Add(usuario);
            //await context.SaveChangesAsync();
            //return NoContent();
            await _repository.Insert_usuario(usuarioCreacionDTO);
        }

        [HttpPut("{id:int}")]
        public async Task<ActionResult> Put( int id, [FromBody] UsuarioCreacionDTO usuarioCreacionDTO)
        {
            this.actividad.create_date = DateTime.Now;
            this.actividad.id_usuario = id;
            this.actividad.actividad = "actualizacion de usuario";

            var usuario = await context.Usuarios.FirstOrDefaultAsync(x => x.id == id);
            if (usuario == null)
            {
                return NotFound();
            }

            usuario = mapper.Map(usuarioCreacionDTO, usuario);
            await context.SaveChangesAsync();
            await _repository.Insert(actividad);

            return NoContent();


        }


        [HttpDelete("{id:int}")]
        public async Task<ActionResult> Delete(int id)
        {
            var existe = await context.Usuarios.AnyAsync(x => x.id == id);

            if (!existe) {
                return NotFound();
            }

            this.actividad.create_date = DateTime.Now;
            this.actividad.id_usuario = id;
            this.actividad.actividad = "eliminacion de usuario";



            //context.Remove(new Usuario() { id = id });
            //await context.SaveChangesAsync();

            // se llama al proceso almacenado para actualizar el estado del usuario a 0 dado de baja
            await _repository.Dar_de_baja_usuario(id, false);
            await _repository.Insert(actividad);

            return NoContent();
        }

    }
}
