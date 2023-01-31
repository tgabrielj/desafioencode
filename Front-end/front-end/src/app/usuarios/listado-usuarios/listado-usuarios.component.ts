import { Component, OnInit } from '@angular/core';
import { usuarioCreacionDTO } from '../usuario';
import { UsuariosService } from '../usuarios.service';

@Component({
  selector: 'app-listado-usuarios',
  templateUrl: './listado-usuarios.component.html',
  styleUrls: ['./listado-usuarios.component.css']
})


export class ListadoUsuariosComponent implements OnInit{

  usuarios = [{nombre: 'gabriel', apellido:'juncos'},
  {nombre: 'leo', apellido:'messi'}];

  

  columnasAMostrar = ['nombre', 'apellido'];

  constructor(private usuariosService: UsuariosService){

  }

  ngOnInit(): void {
    this.usuariosService.obtenerTodos()
    .subscribe(usuarios_ => {
      console.log(usuarios_);
    }, error => console.error(error))
  }
  // se recibie del formulario-usuario el usuario que se intenta crear
  guardarCambios(usuario: usuarioCreacionDTO){
    //guardar los cambios
    console.log('recibo desde listado',usuario);
  }



}


