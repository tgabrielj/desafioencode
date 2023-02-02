import { Component, EventEmitter, Input, Output } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import {Router} from '@angular/router';
import { usuarioCreacionDTO } from '../usuario';

@Component({
  selector: 'app-formulario-usuario',
  templateUrl: './formulario-usuario.component.html',
  styleUrls: ['./formulario-usuario.component.css']
})
export class FormularioUsuarioComponent {

  

  constructor(private router: Router, private formBuilder:FormBuilder){
  }

  form: FormGroup;
  esConsulta = false;

  @Input()
  modelo: usuarioCreacionDTO;

  @Input()
  consulta: boolean;

  @Output()
  onSubmit : EventEmitter<usuarioCreacionDTO> = new EventEmitter<usuarioCreacionDTO>();

  ngOnInit():void{
    
    this.form = this.formBuilder.group({
      nombre: ['', {
        validators:[Validators.required, Validators.minLength(3), Validators.pattern("^[ a-zA-ZñÑáéíóúÁÉÍÓÚ]+$")]
      }],
      apellido: ['', {
        validators:[Validators.required, Validators.minLength(3), , Validators.pattern("^[ a-zA-ZñÑáéíóúÁÉÍÓÚ]+$")]
      }],
      correo_electronico: ['', {
        validators:[Validators.required,Validators.pattern("^[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,4}$")]
      }],
      fecha_nacimiento: ['', {
        validators:[Validators.required, Validators.minLength(3)]
      }],
      telefono: ['', {
        validators:[Validators.required, Validators.minLength(7),Validators.maxLength(10),Validators.pattern(/^([0-9])*$/)]
      
      }],
      pais: ['', {
        validators:[Validators.required, Validators.minLength(3)]
      }],
      contactar: ['', {
        validators:[Validators.required]
      }]

    });

    
    if (this.modelo!== undefined){
      // machera los atributos del formulario con el modelo usuario
      this.form.patchValue(this.modelo)
    }

    console.log("es consulta", this.consulta);

    if (this.consulta == true){
      this.form.disable();
    }

    
  }

  guardarCambios(){
    //form value se accede a la info del formulario
    this.onSubmit.emit(this.form.value)
  
  }



  
  
}
