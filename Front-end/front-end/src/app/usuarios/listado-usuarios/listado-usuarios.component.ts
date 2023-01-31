import { Component, OnInit } from '@angular/core';
import { usuarioCreacionDTO } from '../usuario';
import { UsuariosService } from '../usuarios.service';

@Component({
  selector: 'app-listado-usuarios',
  templateUrl: './listado-usuarios.component.html',
  styleUrls: ['./listado-usuarios.component.css']
})


export class ListadoUsuariosComponent implements OnInit{

  usuarios = [];

  

  columnasAMostrar = ['Nombre', 'Apellido', 'Correo Electronico', 'Fecha de Nacimiento', 'Telefono', 'Pais de Residencia', 'Contactar' , 'Acciones'];

  constructor(private usuariosService: UsuariosService){

  }

  ngOnInit(): void {
    this.usuariosService.obtenerTodos()
    .subscribe(usuarios_ => {
      this.usuarios = usuarios_;
      console.log(usuarios_);
    }, error => console.error(error))
  }
  // se recibie del formulario-usuario el usuario que se intenta crear
  guardarCambios(usuario: usuarioCreacionDTO){
    //guardar los cambios
    console.log('recibo desde listado',usuario);
  }



}


