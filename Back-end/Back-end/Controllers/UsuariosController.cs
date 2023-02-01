using Back_end.Entidades;
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
        

        public UsuariosController(
            ApplicationDbContext context) {
            //this.repositorio = repositorio;
            this.context = context;
        }

        [HttpGet] //api/usuarios
        public async Task<ActionResult<List<Usuario>>> Get() {

            return await context.Usuarios.ToListAsync();
            
        }

        // un endpoint para obtener usuario por id
        [HttpGet("{id:int}")] // api/usuarios/1/gabriel
        public async Task<ActionResult<Usuario>> Get(int id) {
            // el BinRequired obliga a que los parametros sean obligatorios

            throw new NotImplementedException();
        }

        [HttpPost]
        public async Task<ActionResult> Post([FromBody] Usuario usuario) {

            //throw new NotImplementedException();
            context.Add(usuario);
            await context.SaveChangesAsync();
            return NoContent();
        }

        [HttpPut]
        public ActionResult Put([FromBody] Usuario usuario)
        {
            throw new NotImplementedException();

        }


        [HttpDelete]
        public ActionResult Delete()
        {
            throw new NotImplementedException();
        }

    }
}
