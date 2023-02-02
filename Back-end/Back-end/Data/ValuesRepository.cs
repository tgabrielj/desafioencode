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

        // crear actividad

        public Task Insert(ActividadCreacionDTO actividad)
        {
            throw new NotImplementedException();
        }
    }
}
