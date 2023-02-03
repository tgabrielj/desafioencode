import { Component } from '@angular/core';
import {Router} from '@angular/router';
import { usuarioCreacionDTO } from '../usuario';
import { UsuariosService } from '../usuarios.service';
import { ActividadesService } from 'src/app/actividades/actividades.service';
import { actividadCreacionDTO } from 'src/app/actividades/actividad';

@Component({
  selector: 'app-crear-usuario',
  templateUrl: './crear-usuario.component.html',
  styleUrls: ['./crear-usuario.component.css']
})
export class CrearUsuarioComponent{

  constructor(private router: Router, 
    private usuariosService: UsuariosService,
    private actividadesService: ActividadesService){
  }
  consulta : boolean;

  actividad_ : actividadCreacionDTO;

 

  ngOnInit(): void {


    this.consulta = false;

    this.actividad_ = {
      create_date: new Date(),
      id_usuario: 8,
      actividad: 'creacion de usuario',
    }
    
  }

// se recibie del formulario-usuario el usuario que se intenta crear
  guardarCambios(usuario: usuarioCreacionDTO){
    //guardar los cambios
    this.usuariosService.crear(usuario).subscribe(()=>{
    console.log(usuario);
    this.router.navigate(['/usuarios']);
    }, error => console.error(error));

    this.registrarActividad();
  }

  registrarActividad(){
    console.log("ver objeto actividad",this.actividad_)
    //guardar los cambios
    this.actividadesService.crearActividad(this.actividad_).subscribe(()=>{
      console.log(this.actividad_)
      }, error => console.error(error));

  }

}
