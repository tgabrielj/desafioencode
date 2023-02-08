using Back_end.DTOs;
using Microsoft.Data.SqlClient;
using System.Data;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Back_end.Data
{
    public class ValuesRepository
    {
        private readonly string _connectionString;

        public ValuesRepository(IConfiguration configuration) {

            _connectionString = configuration.GetConnectionString("dafaultConnection");
        }

        // obtener actividades por usuario
        public async Task<List<ActividadUsuarioDTO>> GetAll()
        {
            using (SqlConnection sql = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("pr_actividad_por_usuario", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    var response = new List<ActividadUsuarioDTO>();
                    await sql.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response.Add(MapToValue(reader));
                        }
                    }

                    return response;
                }
            }
        }

        //convertir a valor
        private ActividadUsuarioDTO MapToValue(SqlDataReader reader) {

            return new ActividadUsuarioDTO
            {


                fecha_actividad = (DateTime)reader["fecha_de_actividad"],

                nombre = reader["nombre"].ToString(),

                apellido = reader["apellido"].ToString(),

                actividad = reader["actividad"].ToString()

            };
        }  

        // crear actividad cuando es creacion de usuario

        public async Task Insert(ActividadCreacionDTO actividad)
        {
            using (SqlConnection sql = new SqlConnection(_connectionString)) {
                using (SqlCommand cmd = new SqlCommand("pr_actividad_insertar", sql)) {

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@id_usuario", actividad.id_usuario));
                    cmd.Parameters.Add(new SqlParameter("@actividad", actividad.actividad));
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();

                }
            }
        }


        // se obtienen todos los usuarios dados de alta
        public async Task<List<UsuarioDTO>> Get_usuarios()
        {
            using (SqlConnection sql = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("pr_usuarios_dados_alta", sql))
                {
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    var response = new List<UsuarioDTO>();
                    await sql.OpenAsync();

                    using (var reader = await cmd.ExecuteReaderAsync())
                    {
                        while (await reader.ReadAsync())
                        {
                            response.Add(MapToValue_usuario(reader));
                        }
                    }

                    return response;
                }
            }
        }


        //convertir a valor usuario
        private UsuarioDTO MapToValue_usuario(SqlDataReader reader)
        {

            return new UsuarioDTO
            {

        id = (int)reader["id"],

        nombre = reader["nombre"].ToString(),

        apellido = reader["apellido"].ToString(),

        correo_electronico = reader["correo_electronico"].ToString(),

        fecha_nacimiento = (DateTime)reader["fecha_nacimiento"],

        telefono = reader["telefono"].ToString(),

        pais = reader["pais"].ToString(),

        contactar = (bool)reader["contactar"]




            };
        }

        

        public async Task Dar_de_baja_usuario(int id, bool estado)
        {
            using (SqlConnection sql = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("pr_baja_usuario", sql))
                {

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@id", id));
                    cmd.Parameters.Add(new SqlParameter("@estado", estado));
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();

                }
            }
        }

        public async Task Insert_usuario(UsuarioCreacionDTO usuario)
        {
            using (SqlConnection sql = new SqlConnection(_connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("pr_insertar_usuario", sql))
                {

                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("@nombre", usuario.nombre));
                    cmd.Parameters.Add(new SqlParameter("@apellido", usuario.apellido));
                    cmd.Parameters.Add(new SqlParameter("@correo_electronico", usuario.correo_electronico));
                    cmd.Parameters.Add(new SqlParameter("@telefono", usuario.telefono));
                    cmd.Parameters.Add(new SqlParameter("@pais", usuario.pais));
                    cmd.Parameters.Add(new SqlParameter("@contactar", usuario.contactar));
                    await sql.OpenAsync();
                    await cmd.ExecuteNonQueryAsync();

                }
            }
        }



    }
}
