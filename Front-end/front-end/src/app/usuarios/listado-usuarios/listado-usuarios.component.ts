import { HttpResponse } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { PageEvent } from '@angular/material/paginator';
import { usuarioCreacionDTO, usuarioDTO } from '../usuario';
import { UsuariosService } from '../usuarios.service';

@Component({
  selector: 'app-listado-usuarios',
  templateUrl: './listado-usuarios.component.html',
  styleUrls: ['./listado-usuarios.component.css']
})


export class ListadoUsuariosComponent implements OnInit{

  
  
  constructor(private usuariosService: UsuariosService){

  }

  usuarios : usuarioDTO[] = [];
  columnasAMostrar = ['Nombre', 'Apellido', 'Correo Electronico', 'Fecha de Nacimiento', 'Telefono', 'Pais de Residencia', 'Contactar' , 'Acciones'];
  cantidadTotalRegistros;
  paginaActual = 1;
  cantidadRegistrosAMostrar = 10;
 

  ngOnInit(): void {
    this.cargarRegistros(this.paginaActual, this.cantidadRegistrosAMostrar);
  }
  // se recibie del formulario-usuario el usuario que se intenta crear
  guardarCambios(usuario: usuarioCreacionDTO){
    //guardar los cambios
    console.log('recibo desde listado',usuario);
  }

  borrar(id: number){
    this.usuariosService.borrar(id)
    .subscribe(()=> {
      this.cargarRegistros(this.paginaActual, this.cantidadRegistrosAMostrar);
    }, error => console.error(error));
  }

  cargarRegistros(pagina:number, cantidadElementosAMostrar){

    this.usuariosService.obtenerTodos(pagina, cantidadElementosAMostrar)
    .subscribe((respuesta: HttpResponse<usuarioDTO[]>) => {
      this.usuarios = respuesta.body;
      console.log(respuesta.headers.get("cantidadTotalRegistros"));
      this.cantidadTotalRegistros = respuesta.headers.get("cantidadTotalRegistros");
    }, error => console.error(error))
  }

  actualizarPaginacion(datos: PageEvent){
    this.paginaActual = datos.pageIndex + 1;
    this.cantidadRegistrosAMostrar = datos.pageSize;
    this.cargarRegistros(this.paginaActual, this.cantidadRegistrosAMostrar);

  }

    


}


