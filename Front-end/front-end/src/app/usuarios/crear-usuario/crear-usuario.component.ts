import { Component } from '@angular/core';
import {Router} from '@angular/router';
import { usuarioCreacionDTO } from '../usuario';
import { UsuariosService } from '../usuarios.service';

@Component({
  selector: 'app-crear-usuario',
  templateUrl: './crear-usuario.component.html',
  styleUrls: ['./crear-usuario.component.css']
})
export class CrearUsuarioComponent{

  constructor(private router: Router, private usuariosService: UsuariosService){
  }
  consulta : boolean;

  ngOnInit(): void {
    this.consulta = false;
    
  }

// se recibie del formulario-usuario el usuario que se intenta crear
  guardarCambios(usuario: usuarioCreacionDTO){
    //guardar los cambios
    this.usuariosService.crear(usuario).subscribe(()=>{
    console.log(usuario) 
    this.router.navigate(['/usuarios']);
    }, error => console.error(error));
  }

}
