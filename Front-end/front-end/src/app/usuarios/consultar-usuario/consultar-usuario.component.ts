import { Component, OnInit } from '@angular/core';
import {ActivatedRoute} from '@angular/router'
import { usuarioDTO } from '../usuario';
import {Router} from '@angular/router';
import { UsuariosService } from '../usuarios.service';

@Component({
  selector: 'app-consultar-usuario',
  templateUrl: './consultar-usuario.component.html',
  styleUrls: ['./consultar-usuario.component.css']
})
export class ConsultarUsuarioComponent implements OnInit{
  
  constructor(private router: Router,
    private usuarioService: UsuariosService,
    private activatedRoute: ActivatedRoute){

  }

  consulta : boolean;

  modelo : usuarioDTO;;

  ngOnInit(): void {
    this.activatedRoute.params.subscribe((params) => {
      this.usuarioService.obtenerPorId(params.id)
      .subscribe(usuario => {
        this.consulta = true;
        this.modelo= usuario;// en caso de no encontrar al usuario con ese id redirige al listado de usuarios
      },() => this.router.navigate(['/usuarios']))
    })
    
  }

  // se recibie del formulario-usuario el usuario que se intenta crear
  guardarCambios(usuario: usuarioDTO){
    this.usuarioService.editar(this.modelo.id, usuario)
    .subscribe(() => {
        this.router.navigate(['/usuarios']);
      },
      (error) => console.log('no se pudo guardar los cambios') 
    )
  }




}
