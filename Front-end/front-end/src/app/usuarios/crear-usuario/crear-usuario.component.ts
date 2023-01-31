import { Component } from '@angular/core';
import {Router} from '@angular/router';
import { usuarioCreacionDTO } from '../usuario';

@Component({
  selector: 'app-crear-usuario',
  templateUrl: './crear-usuario.component.html',
  styleUrls: ['./crear-usuario.component.css']
})
export class CrearUsuarioComponent{

  constructor(private router: Router){
  }
// se recibie del formulario-usuario el usuario que se intenta crear
  guardarCambios(usuario: usuarioCreacionDTO){
    //guardar los cambios
    console.log(usuario);
    this.router.navigate(['/usuarios'])
  }

}
