using AutoMapper;
using Back_end.DTOs;
using Back_end.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Back_end.Utilidades
{
    public class AutoMapperProfiles: Profile
    {
        public AutoMapperProfiles() {

            CreateMap<Usuario, UsuarioDTO>().ReverseMap();
            CreateMap<UsuarioCreacionDTO, Usuario>();
        }
    }
}
