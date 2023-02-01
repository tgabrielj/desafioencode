import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router'
import { usuarioDTO } from '../usuario';
import {Router} from '@angular/router';

@Component({
  selector: 'app-editar-usuario',
  templateUrl: './editar-usuario.component.html',
  styleUrls: ['./editar-usuario.component.css']
})
export class EditarUsuarioComponent implements OnInit{
  constructor(private router: Router){

  }

  //viene por bd
  modelo: usuarioDTO = {
    id:1,
    nombre: "gabriel",
    apellido: "juncos",
    correo_electronico: "gabriel@gmail.com",
    fecha_nacimiento: new Date(),
    telefono: "3513279054",
    pais: "ARG",
    contactar: true
  };

  ngOnInit(): void {
  
  }

  // se recibie del formulario-usuario el usuario que se intenta crear
  guardarCambios(usuario: usuarioDTO){
    //guardar los cambios
    console.log(usuario);
    this.router.navigate(['/usuarios'])
  }
}
