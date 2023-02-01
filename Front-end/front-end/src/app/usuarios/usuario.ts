export interface usuarioCreacionDTO{
    nombre: string;
    apellido: string;
    correo_electronico: string;
    fecha_nacimiento: Date;
    telefono: string;
    pais: string;
    contactar: boolean;
}

export interface usuarioDTO{
    id: number;
    nombre: string;
    apellido: string;
    correo_electronico: string;
    fecha_nacimiento: Date;
    telefono: string;
    pais: string;
    contactar: boolean;
}