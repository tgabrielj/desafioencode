export interface actividadCreacionDTO{
    create_date: Date;
    id_usuario: number;
    actividad: string;
}

export interface actividadDTO{
    id: number;
    create_date: Date;
    id_usuario: number;
    actividad: string;
}

export interface actividadUsuarioDTO{
    fecha_de_actividad: Date;
    nombre: string;
    apellido: string;
    actividad: string;
}