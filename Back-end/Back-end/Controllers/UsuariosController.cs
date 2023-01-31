using Back_end.Entidades;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
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
        

        public UsuariosController() {
            //this.repositorio = repositorio;
        }

        [HttpGet] //api/usuarios
        public ActionResult<List<Usuario>> Get() {
            //return repositorio.ObtenerTodosLosUsuarios();
            return new List<Usuario>() { 
                new Usuario(){

                id= 1,
                nombre= "gabrielllllllllll",
                apellido =  "juncos",
                correo_electronico = "gabriel@gmail.com",
                fecha_nacimiento = DateTime.Parse("20/12/1994"),
                telefono= 4620321,
                pais = "ARG",
                contactar =  true
                
                }
            };
        }

        // un endpoint para obtener usuario por id
        [HttpGet("{id:int}")] // api/usuarios/1/gabriel
        public async Task<ActionResult<Usuario>> Get(int id) {
            // el BinRequired obliga a que los parametros sean obligatorios

            throw new NotImplementedException();
        }

        [HttpPost]
        public ActionResult Post([FromBody] Usuario usuario) {

            throw new NotImplementedException();
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
